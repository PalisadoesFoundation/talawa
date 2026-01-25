class CacheEntry<T> {
  final T value;
  final DateTime ts;
  CacheEntry(this.value) : ts = DateTime.now();
}

class SwrCache {
  final _mem = <String, CacheEntry<dynamic>>{};

  T? get<T>(String key) => _mem[key]?.value as T?;

  Future<T> revalidate<T>(String key, Future<T> Function() fetcher) async {
    final fresh = await fetcher();
    _mem[key] = CacheEntry<T>(fresh);
    return fresh;
  }
}
