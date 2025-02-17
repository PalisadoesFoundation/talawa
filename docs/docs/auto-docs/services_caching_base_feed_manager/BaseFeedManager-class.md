
<div>

# BaseFeedManager\<[T\>] class [abstract](https://dart.dev/language/class-modifiers#abstract "This type can not be directly constructed.")

</div>


An abstract base class for managing a feed of type `T` with caching and
online data fetching capabilities.

This class provides methods for initializing a cache, loading cached
data, saving data to cache, and fetching new data from an API. It also
handles automatic cache refreshing when online.

**params**:

-   `cacheKey`: A unique key for identifying the cache box in Hive.

**methods**:

-   `loadCachedData`: Loads the data cached in Hive for the specified
    [cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html).
-   `saveDataToCache`: Saves a list of data to the cache, clearing any
    existing data in the process.
-   `fetchDataFromApi`: Abstract method to be implemented by subclasses
    for fetching data from an API.
-   `getNewFeedAndRefreshCache`: Fetches new data from the API if
    online, updates the cache, and returns the data. If offline, it
    loads and returns cached data.




Implementers

:   -   [EventService](../services_event_service/EventService-class.html)
    -   [PostService](../services_post_service/PostService-class.html)



## Constructors

[[BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager/BaseFeedManager.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] cacheKey])]

:   



## Properties

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   feed cacheBox key.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[fetchDataFromApi](../services_caching_base_feed_manager/BaseFeedManager/fetchDataFromApi.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)\<[T\>]]\>]] ]
:   Abstract method to be implemented by subclasses to fetch data from
    an API.

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)\<[T\>]]\>]] ]
:   Fetches new data from the API if online, updates the cache, and
    returns the data.

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)\<[T\>]]\>]] ]
:   Loads the data cached in Hive.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)\<[T\>]] data]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Saves a list of data to the cache, replacing any existing data.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [base_feed_manager](../services_caching_base_feed_manager/)
3.  BaseFeedManager\<[T\>] class

##### base_feed_manager library







