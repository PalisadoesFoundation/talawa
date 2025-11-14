<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [pinned_post_service](../services_pinned_post_service/services_pinned_post_service-library.md)
3.  PinnedPostService class

<div class="self-name">

PinnedPostService

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_pinned_post_service/services_pinned_post_service-library-sidebar.html"
below-sidebar="services_pinned_post_service/PinnedPostService-class-sidebar.html">

<div>

# <span class="kind-class">PinnedPostService</span> class

</div>

<div class="section desc markdown">

Service to manage pinned posts in the application.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseFeedManager](../services_caching_base_feed_manager/BaseFeedManager-class.md)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span>
- PinnedPostService

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[PinnedPostService](../services_pinned_post_service/PinnedPostService/PinnedPostService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[after](../services_pinned_post_service/PinnedPostService/after.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
`after` is used to fetch posts after a certain cursor.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[before](../services_pinned_post_service/PinnedPostService/before.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
`before` is used to fetch posts before a certain cursor.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[cacheKey](../services_caching_base_feed_manager/BaseFeedManager/cacheKey.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
feed cacheBox key.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[currentOrg](../services_pinned_post_service/PinnedPostService/currentOrg.md)</span> <span class="signature">→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>  
Returns current organisation.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[first](../services_pinned_post_service/PinnedPostService/first.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
`first` is used to limit the number of posts fetched in a single
request.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[last](../services_pinned_post_service/PinnedPostService/last.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
`last` is used to limit the number of posts fetched so i dont thinkin a
single request from the end.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[pinnedPostInfo](../services_pinned_post_service/PinnedPostService/pinnedPostInfo.md)</span> <span class="signature">↔ [PageInfo](../models_page_info_page_info/PageInfo-class.md)</span>  
Object to hold pagination information for posts. It contains information
like `after`, `before`, `first`, and `last`.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[pinnedPosts](../services_pinned_post_service/PinnedPostService/pinnedPosts.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>  
Getter to access the list of pinned posts.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[pinnedPostStream](../services_pinned_post_service/PinnedPostService/pinnedPostStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span>  
Returns a stream of pinned posts.

<div class="features">

<span class="feature">no setter</span>

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

<span class="name">[fetchDataFromApi](../services_pinned_post_service/PinnedPostService/fetchDataFromApi.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span> </span>  
Abstract method to be implemented by subclasses to fetch data from an
API.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[fetchPostsInitial](../services_pinned_post_service/PinnedPostService/fetchPostsInitial.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to load cached data from Hive database.

<span class="name">[getNewFeedAndRefreshCache](../services_caching_base_feed_manager/BaseFeedManager/getNewFeedAndRefreshCache.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span> </span>  
Fetches new data from the API if online, updates the cache, and returns
the data.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[loadCachedData](../services_caching_base_feed_manager/BaseFeedManager/loadCachedData.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span>\></span></span> </span>  
Loads the data cached in Hive.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshPinnedPosts](../services_pinned_post_service/PinnedPostService/refreshPinnedPosts.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Fetches pinned posts from API, updates cache and stream.

<span class="name">[saveDataToCache](../services_caching_base_feed_manager/BaseFeedManager/saveDataToCache.md)</span><span class="signature">(<span id="saveDataToCache-param-data" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Post](../models_post_post_model/Post-class.md)</span>\></span></span> <span class="parameter-name">data</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Saves a list of data to the cache, replacing any existing data.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setOrgStreamSubscription](../services_pinned_post_service/PinnedPostService/setOrgStreamSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This method sets up a stream that constantly listens to change in
current org.

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
2.  [pinned_post_service](../services_pinned_post_service/services_pinned_post_service-library.md)
3.  PinnedPostService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
