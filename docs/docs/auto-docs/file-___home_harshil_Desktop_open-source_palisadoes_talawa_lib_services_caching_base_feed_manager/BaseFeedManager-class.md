




BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../index.html)
2. [services/caching/base\_feed\_manager.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/)
3. BaseFeedManager<T> class

BaseFeedManager


dark\_mode

light\_mode




# BaseFeedManager<T> class [abstract](https://dart.dev/language/class-modifiers#abstract "This type can not be directly constructed.")


An abstract base class for managing a feed of type `T` with caching and online data fetching capabilities.

This class provides methods for initializing a cache, loading cached data, saving data to cache,
and fetching new data from an API. It also handles automatic cache refreshing when online.

**params**:

* `cacheKey`: A unique key for identifying the cache box in Hive.

**methods**:

* `loadCachedData`: Loads the data cached in Hive for the specified [cacheKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/cacheKey.html).
* `saveDataToCache`: Saves a list of data to the cache, clearing any existing data in the process.
* `fetchDataFromApi`: Abstract method to be implemented by subclasses for fetching data from an API.
* `getNewFeedAndRefreshCache`: Fetches new data from the API if online, updates the cache, and returns the data.
  If offline, it loads and returns cached data.

## Constructors

[BaseFeedManager](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/BaseFeedManager.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) cacheKey)




## Properties

[cacheKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

feed cacheBox key.
final

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[fetchDataFromApi](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/fetchDataFromApi.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<T>>


Abstract method to be implemented by subclasses to fetch data from an API.

[getNewFeedAndRefreshCache](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<T>>


Fetches new data from the API if online, updates the cache, and returns the data.

[loadCachedData](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<T>>


Loads the data cached in Hive.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[saveDataToCache](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)<T> data)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Saves a list of data to the cache, replacing any existing data.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [base\_feed\_manager](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_caching_base_feed_manager/)
3. BaseFeedManager<T> class

##### base\_feed\_manager library





talawa
1.0.0+1






