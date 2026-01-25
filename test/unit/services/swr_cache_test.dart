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
  });
}
