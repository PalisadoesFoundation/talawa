/// A container representing a cached item with its production timestamp.
class CacheEntry<T> {
  /// Creates a [CacheEntry] with the given [value] and the current time.
  CacheEntry(this.value) : ts = DateTime.now();

  /// The cached data value.
  final T value;

  /// The timestamp when this entry was created or updated.
  final DateTime ts;
}

/// A simple Stale-While-Revalidate (SWR) cache implementation for in-memory storage.
class SwrCache {
  final _mem = <String, CacheEntry<dynamic>>{};

  /// Retrieves a value from the cache by its [key].
  ///
  /// Returns null if the key is not found or has expired (if expiration logic is added).
  T? get<T>(String key) => _mem[key]?.value as T?;

  /// Manually sets a [value] in the cache for the given [key].
  void set<T>(String key, T value) {
    _mem[key] = CacheEntry<T>(value);
  }

  /// Removes the entry associated with [key] from the cache.
  void remove(String key) {
    _mem.remove(key);
  }

  /// Clears all entries from the memory cache.
  void clear() {
    _mem.clear();
  }

  /// Executes a [fetcher] function and updates the cache with the result for the given [key].
  ///
  /// This implements the revalidation part of the SWR pattern.
  Future<T> revalidate<T>(String key, Future<T> Function() fetcher) async {
    final fresh = await fetcher();
    _mem[key] = CacheEntry<T>(fresh);
    return fresh;
  }
}
