




loadCachedData method - BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/base\_feed\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/)
3. [BaseFeedManager<T>](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager-class.html)
4. loadCachedData method

loadCachedData


dark\_mode

light\_mode




# loadCachedData method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<T>>
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
2. [base\_feed\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/)
3. [BaseFeedManager<T>](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager-class.html)
4. loadCachedData method

##### BaseFeedManager class





talawa
1.0.0+1






