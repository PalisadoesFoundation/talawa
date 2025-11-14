<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [base_feed_manager](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.md)
3.  [BaseFeedManager<span class="signature">\<<span class="type-parameter">T</span>\></span>](../../services_caching_base_feed_manager/BaseFeedManager-class.md)
4.  getNewFeedAndRefreshCache method

<div class="self-name">

getNewFeedAndRefreshCache

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_caching_base_feed_manager/BaseFeedManager-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getNewFeedAndRefreshCache</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">T</span>\></span></span>\></span></span>
<span class="name">getNewFeedAndRefreshCache</span>

</div>

<div class="section desc markdown">

Fetches new data from the API if online, updates the cache, and returns
the data.

If offline, loads and returns cached data.

**params**: None

**returns**:

- `Future<List<T>>`: A Future containing a list of the latest data.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<List<T>>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [base_feed_manager](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.md)
3.  [BaseFeedManager<span class="signature">\<<span class="type-parameter">T</span>\></span>](../../services_caching_base_feed_manager/BaseFeedManager-class.md)
4.  getNewFeedAndRefreshCache method

##### BaseFeedManager class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
