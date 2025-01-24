




loadCachedData method - BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/base\_feed\_manager.dart](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. loadCachedData method

loadCachedData


dark\_mode

light\_mode




# loadCachedData method


Future<List<T>>
loadCachedData()

Loads the data cached in Hive.

**params**:
None

**returns**:

* `Future<List<T>>`: A Future containing a list of cached data.

## Implementation

```
Future<List<T>> loadCachedData() async {
  final data = _box.values.toList();
  return data;
}
```

 


1. [talawa](../../index.html)
2. [base\_feed\_manager](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. loadCachedData method

##### BaseFeedManager class





talawa
1.0.0+1






