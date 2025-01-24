




BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../index.html)
2. [services/caching/base\_feed\_manager.dart](../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
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

* `loadCachedData`: Loads the data cached in Hive for the specified [cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html).
* `saveDataToCache`: Saves a list of data to the cache, clearing any existing data in the process.
* `fetchDataFromApi`: Abstract method to be implemented by subclasses for fetching data from an API.
* `getNewFeedAndRefreshCache`: Fetches new data from the API if online, updates the cache, and returns the data.
  If offline, it loads and returns cached data.

Implementers

* [EventService](../services_event_service/EventService-class.html)
* [PostService](../services_post_service/PostService-class.html)



## Constructors

[BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager/BaseFeedManager.html)(String cacheKey)




## Properties

[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)
→ String

feed cacheBox key.
final

[hashCode](../services_caching_base_feed_manager/BaseFeedManager/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../services_caching_base_feed_manager/BaseFeedManager/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[fetchDataFromApi](../services_caching_base_feed_manager/BaseFeedManager/fetchDataFromApi.html)()
→ Future<List<T>>


Abstract method to be implemented by subclasses to fetch data from an API.

[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)()
→ Future<List<T>>


Fetches new data from the API if online, updates the cache, and returns the data.

[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)()
→ Future<List<T>>


Loads the data cached in Hive.

[noSuchMethod](../services_caching_base_feed_manager/BaseFeedManager/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)(List<T> data)
→ Future<void>


Saves a list of data to the cache, replacing any existing data.

[toString](../services_caching_base_feed_manager/BaseFeedManager/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_caching_base_feed_manager/BaseFeedManager/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [base\_feed\_manager](../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. BaseFeedManager<T> class

##### base\_feed\_manager library





talawa
1.0.0+1






