<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [cache_service](../../services_caching_cache_service/services_caching_cache_service-library.md)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  executeOrCacheOperation method

<div class="self-name">

executeOrCacheOperation

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_caching_cache_service/CacheService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">executeOrCacheOperation</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">executeOrCacheOperation</span>(

1.  <span id="executeOrCacheOperation-param-operation"
    class="parameter">

)

</div>

<div class="section desc markdown">

Executes a GraphQL operation or caches it for offline execution.

This function checks internet connectivity. If online, it executes the
provided `whenOnline` function and returns the result. If offline, it
creates a `CachedUserAction` object representing the operation and
stores it in the `offlineActionQueue`. It then returns null.

**params**:

- `operation`: The GraphQL operation string.
- `variables`: Optional variables for the operation
  (`Map<String, dynamic>`).
- `operationType`: The type of the GraphQL operation (from
  `CachedOperationType` enum).
- `whenOnline`: A function that executes the operation online and
  returns the result (`Future<QueryResult<Object?>?>`).

**returns**:

- `Future<QueryResult<Object?>>`: Returns the result of the operation.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [cache_service](../../services_caching_cache_service/services_caching_cache_service-library.md)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.md)
4.  executeOrCacheOperation method

##### CacheService class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
