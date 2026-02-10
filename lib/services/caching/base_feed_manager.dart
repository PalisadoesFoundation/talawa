import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/cache/swr_cache.dart';
import 'package:talawa/services/retry_queue.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

/// An abstract base class for managing a feed of type [T] with caching and online data fetching capabilities.
///
/// This class provides methods for initializing a cache, loading cached data, saving data to cache,
/// and fetching new data from an API. It also handles automatic cache refreshing when online.
///
/// **params**:
/// * `cacheKey`: A unique key for identifying the cache box in Hive.
///
/// **methods**:
/// * `loadCachedData`: Loads the data cached in Hive for the specified [cacheKey].
/// * `saveDataToCache`: Saves a list of data to the cache, clearing any existing data in the process.
/// * `fetchDataFromApi`: Abstract method to be implemented by subclasses for fetching data from an API.
/// * `getNewFeedAndRefreshCache`: Fetches new data from the API if online, updates the cache, and returns the data.
///   If offline, it loads and returns cached data.
abstract class BaseFeedManager<T> {
  BaseFeedManager(this.cacheKey) {
    _initialize();
  }

  /// feed cacheBox key.
  final String cacheKey;

  /// feed cache box.
  late Box<T> _box;

  /// SWR Cache instance
  final _swrCache = SwrCache();

  /// Initializes the Hive box associated with the [cacheKey].
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _initialize() async {
    _box = Hive.box<T>(cacheKey);
  }

  /// Loads the data cached in Hive.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<T>>`: A Future containing a list of cached data.
  Future<List<T>> loadCachedData() async {
    // Try memory cache first
    final memCached = _swrCache.get<List<T>>(cacheKey);
    if (memCached != null) {
      return memCached;
    }

    final data = _box.values.toList();
    return data;
  }

  /// Saves a list of data to the cache, replacing any existing data.
  ///
  /// **params**:
  /// * `data`: The list of data to be saved to the cache.
  ///
  /// **returns**:
  ///   None
  Future<void> saveDataToCache(List<T> data) async {
    await _box.clear();
    await _box.addAll(data);
    _swrCache.set(cacheKey, data);
  }

  /// Clear cached data.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> clearCache() async {
    await _box.clear();
    _swrCache.remove(cacheKey);
  }

  /// Abstract method to be implemented by subclasses to fetch data from an API.
  ///
  /// **params**:
  /// * `params`: Optional parameters for the API request.
  ///
  /// **returns**:
  /// * `Future<List<T>>`: A Future containing a list of data fetched from the API.
  Future<List<T>> fetchDataFromApi({Map<String, dynamic>? params});

  /// Fetches new data from the API if online, updates the cache, and returns the data.
  ///
  /// If offline, loads and returns cached data.
  ///
  /// **params**:
  /// * `params`: Optional parameters for the API request.
  ///
  /// **returns**:
  /// * `Future<List<T>>`: A Future containing a list of the latest data.
  Future<List<T>> getNewFeedAndRefreshCache({
    Map<String, dynamic>? params,
  }) async {
    if (AppConnectivity.isOnline) {
      try {
        return await _swrCache.revalidate<List<T>>(cacheKey, () async {
          final data = await fetchDataFromApi(params: params);
          await saveDataToCache(data);
          return data;
        });
      } catch (e) {
        debugPrint(e.toString());
        return loadCachedData();
      }
    } else {
      return loadCachedData();
    }
  }

  /// Fetch data with retry support.
  ///
  /// This method fetches data from the API with automatic retry using
  /// exponential backoff on failure. If all retries fail, it falls back
  /// to cached data.
  ///
  /// **params**:
  /// * `retryKey`: Optional unique key for the retry operation. If not
  ///   provided, a key is generated based on the cache key and timestamp.
  /// * `params`: Optional parameters for the API request.
  ///
  /// **returns**:
  /// * `Future<List<T>>`: A Future containing a list of data.
  Future<List<T>> fetchWithRetry({
    String? retryKey,
    Map<String, dynamic>? params,
  }) async {
    final key =
        retryKey ?? 'feed-$cacheKey-${DateTime.now().millisecondsSinceEpoch}';
    final queue = locator<RetryQueue>();

    final result = await queue.execute(
      () => fetchDataFromApi(params: params),
      key: key,
      onRetry: (attempt, error) {
        debugPrint(
          'BaseFeedManager: Retry attempt $attempt for $cacheKey: $error',
        );
      },
    );

    if (result.succeeded && result.data != null) {
      await saveDataToCache(result.data!);
      return result.data!;
    }

    debugPrint('BaseFeedManager: All retries failed, loading cached data');
    return loadCachedData();
  }
}
