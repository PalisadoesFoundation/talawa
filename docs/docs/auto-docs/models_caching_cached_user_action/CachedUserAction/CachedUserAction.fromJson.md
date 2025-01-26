::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/caching/cached_user_action.dart](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  CachedUserAction.fromJson factory constructor

::: self-name
CachedUserAction.fromJson
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_caching_cached_user_action/CachedUserAction-class-sidebar.html" below-sidebar=""}
<div>

# [CachedUserAction.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[CachedUserAction.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {.section .desc .markdown}
Creates a CachedUserAction from a JSON-compatible map.

**params**:

-   `json` : a map representing the CachedUserAction.

**returns**:

-   `CachedUserAction` : a new instance of CachedUserAction.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory CachedUserAction.fromJson(Map<String, dynamic> json) {
  return CachedUserAction(
    id: json['id'] as String,
    operation: json['operation'] as String,
    variables: json['variables'] as Map<String, dynamic>?,
    timeStamp: DateTime.parse(json['timeStamp'] as String),
    status: json['status'] as CachedUserActionStatus,
    expiry: DateTime.parse(json['expiry'] as String),
    metaData: json['metaData'] as Map<String, dynamic>?,
    operationType: json['operationType'] as CachedOperationType,
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  CachedUserAction.fromJson factory constructor

##### CachedUserAction class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
