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
  ///
  /// **params**:
  /// * `key`: The unique key to identify the cached value.
  ///
  /// **returns**:
  /// * `T?`: The cached value if found, null otherwise.
  T? get<T>(String key) => _mem[key]?.value as T?;

  /// Manually sets a [value] in the cache for the given [key].
  ///
  /// **params**:
  /// * `key`: The unique key to identify the cached value.
  /// * `value`: The value to be cached.
  ///
  /// **returns**:
  ///   None
  void set<T>(String key, T value) {
    _mem[key] = CacheEntry<T>(value);
  }

  /// Removes the entry associated with [key] from the cache.
  ///
  /// **params**:
  /// * `key`: The unique key of the entry to remove.
  ///
  /// **returns**:
  ///   None
  void remove(String key) {
    _mem.remove(key);
  }

  /// Clears all entries from the memory cache.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void clear() {
    _mem.clear();
  }

  /// Executes a [fetcher] function and updates the cache with the result for the given [key].
  ///
  /// This implements the revalidation part of the SWR pattern.
  ///
  /// **params**:
  /// * `key`: The unique key to identify the cached value.
  /// * `fetcher`: A function that returns a Future of the value to be cached.
  ///
  /// **returns**:
  /// * `Future<T>`: A Future containing the fresh value.
  Future<T> revalidate<T>(String key, Future<T> Function() fetcher) async {
    final fresh = await fetcher();
    _mem[key] = CacheEntry<T>(fresh);
    return fresh;
  }
}
