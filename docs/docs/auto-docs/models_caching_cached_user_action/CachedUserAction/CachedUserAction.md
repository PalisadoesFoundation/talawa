::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/caching/cached_user_action.dart](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  CachedUserAction constructor

::: self-name
CachedUserAction
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_caching_cached_user_action/CachedUserAction-class-sidebar.html" below-sidebar=""}
<div>

# [CachedUserAction]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[CachedUserAction]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [id]{.parameter-name}, ]{#-param-id .parameter}
2.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [operation]{.parameter-name}, ]{#-param-operation .parameter}
3.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [variables]{.parameter-name}, ]{#-param-variables .parameter}
4.  [required
    [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [timeStamp]{.parameter-name}, ]{#-param-timeStamp .parameter}
5.  [required
    [[CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.html)]{.type-annotation}
    [status]{.parameter-name}, ]{#-param-status .parameter}
6.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [metaData]{.parameter-name}, ]{#-param-metaData .parameter}
7.  [required
    [[CachedOperationType](../../enums_enums/CachedOperationType.html)]{.type-annotation}
    [operationType]{.parameter-name}, ]{#-param-operationType
    .parameter}
8.  [required
    [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [expiry]{.parameter-name}, ]{#-param-expiry .parameter}

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
CachedUserAction({
  required this.id,
  required this.operation,
  this.variables,
  required this.timeStamp,
  required this.status,
  this.metaData,
  required this.operationType,
  required this.expiry,
});
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  CachedUserAction constructor

##### CachedUserAction class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
