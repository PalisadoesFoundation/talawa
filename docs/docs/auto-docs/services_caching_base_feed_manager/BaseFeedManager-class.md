:::::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_base_feed_manager/services_caching_base_feed_manager-library-sidebar.html" below-sidebar="services_caching_base_feed_manager/BaseFeedManager-class-sidebar.html"}
<div>

# [BaseFeedManager\<[T]{.type-parameter}\>]{.kind-class} class [abstract](https://dart.dev/language/class-modifiers#abstract "This type can not be directly constructed."){.feature .feature-abstract}

</div>

::: {.section .desc .markdown}
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
:::

::: section

Implementers

:   -   [EventService](../services_event_service/EventService-class.html)
    -   [PostService](../services_post_service/PostService-class.html)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager/BaseFeedManager.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [cacheKey]{.parameter-name}]{#-param-cacheKey .parameter})]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   feed cacheBox key.
    ::: features
    [final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[fetchDataFromApi](../services_caching_base_feed_manager/BaseFeedManager/fetchDataFromApi.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Abstract method to be implemented by subclasses to fetch data from
    an API.

[[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetches new data from the API if online, updates the cache, and
    returns the data.

[[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Loads the data cached in Hive.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-annotation} [data]{.parameter-name}]{#saveDataToCache-param-data .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Saves a list of data to the cache, replacing any existing data.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [base_feed_manager](../services_caching_base_feed_manager/)
3.  BaseFeedManager[\<[T]{.type-parameter}\>]{.signature} class

##### base_feed_manager library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
