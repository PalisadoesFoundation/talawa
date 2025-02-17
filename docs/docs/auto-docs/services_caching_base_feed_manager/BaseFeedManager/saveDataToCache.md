
<div>

# saveDataToCache method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
saveDataToCache(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)\<[T\>]]
    data]

)



Saves a list of data to the cache, replacing any existing data.

**params**:

-   `data`: The list of data to be saved to the cache.

**returns**: None



## Implementation

``` language-dart
Future<void> saveDataToCache(List<T> data) async {
  debugPrint('saveToCache1');
  await _box.;
  debugPrint(_box.values.length.);
  debugPrint('saveToCache2');
  await _box.addAll(data);
  debugPrint('saveToCache');
  debugPrint(_box.values.length.);
  debugPrint(_box.values.length.);
}
```







1.  [talawa](../../index.md)
2.  [base_feed_manager](../../services_caching_base_feed_manager/)
3.  BaseFeedManager[\<[T\>]](../../services_caching_base_feed_manager/BaseFeedManager-class.md)
4.  saveDataToCache method

##### BaseFeedManager class







