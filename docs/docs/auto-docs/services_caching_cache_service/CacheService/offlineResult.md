<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/caching/cache_service.dart](../../services_caching_cache_service/services_caching_cache_service-library.md)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  offlineResult property

<div class="self-name">

offlineResult

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_caching_cache_service/CacheService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">offlineResult</span> property

</div>

<div class="section multi-line-signature">

[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span>
<span class="name">offlineResult</span>

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div class="section desc markdown">

static graphql result when device is offline.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static final QueryResult offlineResult = QueryResult(
  options: QueryOptions(
    document: gql(.),
  ),
  data: ,
  source: QueryResultSource.cache,
);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [cache_service](../../services_caching_cache_service/services_caching_cache_service-library.md)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  offlineResult property

##### CacheService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
