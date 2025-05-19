import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    debugPrint('saveToCache1');
    await _box.clear();
    debugPrint(_box.values.length.toString());
    debugPrint('saveToCache2');
    await _box.addAll(data);
    debugPrint('saveToCache');
    debugPrint(_box.values.length.toString());
    debugPrint(_box.values.length.toString());
  }

  /// Abstract method to be implemented by subclasses to fetch data from an API.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<T>>`: A Future containing a list of data fetched from the API.
  Future<List<T>> fetchDataFromApi();

  /// Fetches new data from the API if online, updates the cache, and returns the data.
  ///
  /// If offline, loads and returns cached data.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<T>>`: A Future containing a list of the latest data.
  Future<List<T>> getNewFeedAndRefreshCache() async {
    if (AppConnectivity.isOnline) {
      try {
        final data = await fetchDataFromApi();
        await saveDataToCache(data);
        return data;
      } catch (e) {
        debugPrint(e.toString());
        return loadCachedData();
      }
    } else {
      return loadCachedData();
    }
  }
}
