




getNewFeedAndRefreshCache method - BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/base\_feed\_manager.dart](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. getNewFeedAndRefreshCache method

getNewFeedAndRefreshCache


dark\_mode

light\_mode




# getNewFeedAndRefreshCache method


Future<List<T>>
getNewFeedAndRefreshCache()

Fetches new data from the API if online, updates the cache, and returns the data.

If offline, loads and returns cached data.

**params**:
None

**returns**:

* `Future<List<T>>`: A Future containing a list of the latest data.

## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [base\_feed\_manager](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. getNewFeedAndRefreshCache method

##### BaseFeedManager class





talawa
1.0.0+1






