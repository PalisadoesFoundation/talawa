import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/cache/swr_cache.dart';

void main() {
  group('SwrCache', () {
    late SwrCache cache;

    setUp(() {
      cache = SwrCache();
    });

    test('get returns null if key does not exist', () {
      expect(cache.get<String>('non_existent_key'), isNull);
    });

    test('revalidate updates cache and returns fresh data', () async {
      const key = 'test_key';
      const freshData = 'fresh_data';

      final result = await cache.revalidate<String>(key, () async => freshData);

      expect(result, equals(freshData));
      expect(cache.get<String>(key), equals(freshData));
    });

    test('get returns cached data after revalidate', () async {
      const key = 'test_key';
      const cachedData = 'cached_data';

      await cache.revalidate<String>(key, () async => cachedData);

      expect(cache.get<String>(key), equals(cachedData));
    });

    test('revalidate overwrites existing cache', () async {
      const key = 'test_key';
      const oldData = 'old_data';
      const newData = 'new_data';

      await cache.revalidate<String>(key, () async => oldData);
      expect(cache.get<String>(key), equals(oldData));

      await cache.revalidate<String>(key, () async => newData);
      expect(cache.get<String>(key), equals(newData));
    });

    test('set manually updates the cache', () {
      const key = 'test_key';
      const data = 'manual_data';

      cache.set<String>(key, data);
      expect(cache.get<String>(key), equals(data));
    });

    test('remove deletes specific key from cache', () {
      const key = 'test_key';
      cache.set<String>(key, 'data');
      expect(cache.get<String>(key), isNotNull);

      cache.remove(key);
      expect(cache.get<String>(key), isNull);
    });

    test('clear wipes the entire cache', () {
      cache.set('key1', 'val1');
      cache.set('key2', 'val2');
      expect(cache.get('key1'), isNotNull);
      expect(cache.get('key2'), isNotNull);

      cache.clear();
      expect(cache.get('key1'), isNull);
      expect(cache.get('key2'), isNull);
    });

    test('revalidate propagates fetcher exceptions', () async {
      await expectLater(
        () => cache.revalidate<String>(
            'key', () => throw Exception('fetch failed')),
        throwsException,
      );
      expect(cache.get<String>('key'), isNull);
    });
  });
}
