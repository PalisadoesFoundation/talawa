




getNewFeedAndRefreshCache method - BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/base\_feed\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/)
3. [BaseFeedManager<T>](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager-class.html)
4. getNewFeedAndRefreshCache method

getNewFeedAndRefreshCache


dark\_mode

light\_mode




# getNewFeedAndRefreshCache method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<T>>
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
2. [base\_feed\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/)
3. [BaseFeedManager<T>](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager-class.html)
4. getNewFeedAndRefreshCache method

##### BaseFeedManager class





talawa
1.0.0+1






