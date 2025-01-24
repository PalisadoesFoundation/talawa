




saveDataToCache method - BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/base\_feed\_manager.dart](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. saveDataToCache method

saveDataToCache


dark\_mode

light\_mode




# saveDataToCache method


Future<void>
saveDataToCache(

1. List<T> data

)

Saves a list of data to the cache, replacing any existing data.

**params**:

* `data`: The list of data to be saved to the cache.

**returns**:
None


## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [base\_feed\_manager](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. saveDataToCache method

##### BaseFeedManager class





talawa
1.0.0+1






