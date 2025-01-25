::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/caching/cache_service.dart](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.html)
4.  offlineResult property

::: self-name
offlineResult
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_caching_cache_service/CacheService-class-sidebar.html" below-sidebar=""}
<div>

# [offlineResult]{.kind-property} property

</div>

::: {.section .multi-line-signature}
[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}
[offlineResult]{.name}

::: features
[final]{.feature}
:::
:::

::: {.section .desc .markdown}
static graphql result when device is offline.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static final QueryResult offlineResult = QueryResult(
  options: QueryOptions(
    document: gql(PostQueries().addLike()),
  ),
  data: {
    'cached': true,
  },
  source: QueryResultSource.cache,
);
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [cache_service](../../services_caching_cache_service/)
3.  [CacheService](../../services_caching_cache_service/CacheService-class.html)
4.  offlineResult property

##### CacheService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
