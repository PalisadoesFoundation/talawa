<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/caching/base_feed_manager.dart](../services_caching_base_feed_manager/)
3.  BaseFeedManager<span class="signature">\<<span class="type-parameter">T</span>\></span>
    class

<div class="self-name">

BaseFeedManager

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_caching_base_feed_manager/services_caching_base_feed_manager-library-sidebar.html"
below-sidebar="services_caching_base_feed_manager/BaseFeedManager-class-sidebar.html">

<div>

# <span class="kind-class">BaseFeedManager\<<span class="type-parameter">T</span>\></span> class <a href="https://dart.dev/language/class-modifiers#abstract"
class="feature feature-abstract"
title="This type can not be directly constructed.">abstract</a>

</div>

<div class="section desc markdown">

An abstract base class for managing a feed of type `T` with caching and
online data fetching capabilities.

This class provides methods for initializing a cache, loading cached
data, saving data to cache, and fetching new data from an API. It also
handles automatic cache refreshing when online.

**params**:

- `cacheKey`: A unique key for identifying the cache box in Hive.

**methods**:

- `loadCachedData`: Loads the data cached in Hive for the specified
  [cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.md).
- `saveDataToCache`: Saves a list of data to the cache, clearing any
  existing data in the process.
- `fetchDataFromApi`: Abstract method to be implemented by subclasses
  for fetching data from an API.
- `getNewFeedAndRefreshCache`: Fetches new data from the API if online,
  updates the cache, and returns the data. If offline, it loads and
  returns cached data.

</div>

<div class="section">

Implementers  
- [EventService](../services_event_service/EventService-class.md)
- [PinnedPostService](../services_pinned_post_service/PinnedPostService-class.md)
- [PostService](../services_post_service/PostService-class.md)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[BaseFeedManager.new](../services_caching_base_feed_manager/BaseFeedManager/BaseFeedManager.md)</span><span class="signature">(<span id="-param-cacheKey" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">cacheKey</span></span>)</span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
feed cacheBox key.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[fetchDataFromApi](../services_caching_base_feed_manager/BaseFeedManager/fetchDataFromApi.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">T</span>\></span></span>\></span></span> </span>  
Abstract method to be implemented by subclasses to fetch data from an
API.

<span class="name">[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">T</span>\></span></span>\></span></span> </span>  
Fetches new data from the API if online, updates the cache, and returns
the data.

<span class="name">[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">T</span>\></span></span>\></span></span> </span>  
Loads the data cached in Hive.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.md)</span><span class="signature">(<span id="saveDataToCache-param-data" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">T</span>\></span></span> <span class="parameter-name">data</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Saves a list of data to the cache, replacing any existing data.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [base_feed_manager](../services_caching_base_feed_manager/)
3.  BaseFeedManager<span class="signature">\<<span class="type-parameter">T</span>\></span>
    class

##### base_feed_manager library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
