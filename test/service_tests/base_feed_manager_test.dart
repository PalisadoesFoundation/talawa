import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/caching/base_feed_manager.dart';
import 'package:talawa/services/retry_queue.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

// Concrete implementation of BaseFeedManager for testing
class TestFeedManager extends BaseFeedManager<String> {
  TestFeedManager(super.cacheKey);

  int fetchCallCount = 0;
  int failCount = 0; // Number of calls that should fail before succeeding

  @override
  Future<List<String>> fetchDataFromApi({Map<String, dynamic>? params}) async {
    fetchCallCount++;
    if (failCount > 0) {
      failCount--;
      throw Exception('API fetch failed (remaining failures: $failCount)');
    }
    return ['item1', 'item2', 'item3'];
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late TestFeedManager feedManager;
  late Box<String> mockBox;

  setUpAll(() {
    testSetupLocator();
    registerServices();
    Hive.init('./test/fixtures/core');
  });

  setUp(() async {
    // Register the box adapter and open the box
    if (!Hive.isBoxOpen('test_feed_cache')) {
      mockBox = await Hive.openBox<String>('test_feed_cache');
    } else {
      mockBox = Hive.box<String>('test_feed_cache');
    }

    feedManager = TestFeedManager('test_feed_cache');
    feedManager.fetchCallCount = 0;
    feedManager.failCount = 0;
    await feedManager.clearCache();
  });

  tearDown(() async {
    await feedManager.clearCache();
  });

  tearDownAll(() async {
    await Hive.close();
    unregisterServices();
  });

  group('BaseFeedManager - fetchWithRetry Tests', () {
    test('fetchWithRetry succeeds on first attempt', () async {
      AppConnectivity.isOnline = true;

      final result = await feedManager.fetchWithRetry(
        retryKey: 'test-fetch-success',
      );

      expect(result, isNotEmpty);
      expect(result.length, 3);
      expect(result[0], 'item1');
      expect(feedManager.fetchCallCount, 1);

      // Verify data was cached
      final cached = await feedManager.loadCachedData();
      expect(cached.length, 3);
    });

    test('fetchWithRetry retries on failure then succeeds', () async {
      AppConnectivity.isOnline = true;

      // Fail first call, succeed on retry
      feedManager.failCount = 1;

      final result = await feedManager.fetchWithRetry(
        retryKey: 'test-fetch-retry',
      );

      expect(result, isNotEmpty);
      expect(feedManager.fetchCallCount, greaterThan(1));
    });

    test('fetchWithRetry falls back to cache when all retries fail', () async {
      AppConnectivity.isOnline = true;

      // Pre-populate cache
      await feedManager.saveDataToCache(['cached1', 'cached2']);

      // Make all API calls fail (more than retry attempts)
      feedManager.failCount = 10; // Will exhaust all retries

      final result = await feedManager.fetchWithRetry(
        retryKey: 'test-fetch-fallback',
      );

      // Should return cached data
      expect(result, isNotEmpty);
      expect(result.length, 2);
      expect(result[0], 'cached1');
    });

    test('fetchWithRetry uses custom retry key', () async {
      AppConnectivity.isOnline = true;
      final customKey = 'custom-retry-key-123';

      final result = await feedManager.fetchWithRetry(
        retryKey: customKey,
      );

      expect(result, isNotEmpty);
      // Verify the retry queue was used with the custom key
      final retryQueue = locator<RetryQueue>();
      expect(retryQueue.isRetrying(customKey), false); // Should be done
    });

    test('fetchWithRetry generates key when not provided', () async {
      AppConnectivity.isOnline = true;

      final result = await feedManager.fetchWithRetry();

      expect(result, isNotEmpty);
      expect(feedManager.fetchCallCount, 1);
    });

    test('fetchWithRetry saves data to cache on success', () async {
      AppConnectivity.isOnline = true;

      // Clear cache first
      await feedManager.clearCache();

      final result = await feedManager.fetchWithRetry(
        retryKey: 'test-cache-save',
      );

      expect(result.length, 3);

      // Verify data was saved to cache
      final cached = await feedManager.loadCachedData();
      expect(cached.length, 3);
      expect(cached[0], 'item1');
    });
  });

  group('BaseFeedManager - getNewFeedAndRefreshCache Tests', () {
    test('getNewFeedAndRefreshCache fetches and caches when online', () async {
      AppConnectivity.isOnline = true;

      final result = await feedManager.getNewFeedAndRefreshCache();

      expect(result, isNotEmpty);
      expect(result.length, 3);

      // Verify caching
      final cached = await feedManager.loadCachedData();
      expect(cached.length, 3);
    });

    test('getNewFeedAndRefreshCache returns cached data when offline', () async {
      // Pre-populate cache
      await feedManager.saveDataToCache(['offline1', 'offline2']);

      AppConnectivity.isOnline = false;

      final result = await feedManager.getNewFeedAndRefreshCache();

      expect(result.length, 2);
      expect(result[0], 'offline1');
      expect(feedManager.fetchCallCount, 0); // Should not fetch
    });

    test('getNewFeedAndRefreshCache falls back to cache on error', () async {
      AppConnectivity.isOnline = true;

      // Pre-populate cache
      await feedManager.saveDataToCache(['fallback1', 'fallback2']);

      // Make API fail
      feedManager.failCount = 10;

      final result = await feedManager.getNewFeedAndRefreshCache();

      // Should return cached data
      expect(result.length, 2);
      expect(result[0], 'fallback1');
    });
  });

  group('BaseFeedManager - Basic Operations', () {
    test('loadCachedData returns empty list when cache is empty', () async {
      final cached = await feedManager.loadCachedData();
      expect(cached, isEmpty);
    });

    test('saveDataToCache stores data correctly', () async {
      final testData = ['test1', 'test2', 'test3'];
      await feedManager.saveDataToCache(testData);

      final cached = await feedManager.loadCachedData();
      expect(cached.length, 3);
      expect(cached, testData);
    });

    test('clearCache removes all cached data', () async {
      await feedManager.saveDataToCache(['data1', 'data2']);

      final beforeClear = await feedManager.loadCachedData();
      expect(beforeClear.length, 2);

      await feedManager.clearCache();

      final afterClear = await feedManager.loadCachedData();
      expect(afterClear, isEmpty);
    });
  });
}
