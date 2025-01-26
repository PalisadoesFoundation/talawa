::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/hive_manager.dart](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  registerAdapter\<[T]{.type-parameter}\> static method

::: self-name
registerAdapter
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_hive_manager/HiveManager-class-sidebar.html" below-sidebar=""}
<div>

# [registerAdapter\<[T]{.type-parameter}\>]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[registerAdapter]{.name}\<[T]{.type-parameter}\>(

1.  [[[TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-annotation}
    [adapter]{.parameter-name}]{#registerAdapter-param-adapter
    .parameter}

)
:::

::: {.section .desc .markdown}
Registers the `adapter` named adapter.

**params**:

-   `adapter`: Adapter to register.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static Future<void> registerAdapter<T>(TypeAdapter<T> adapter) async {
  try {
    Hive.registerAdapter<T>(adapter);
  } catch (e) {
    print('Failed to register Hive adapters: $e');
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  registerAdapter\<[T]{.type-parameter}\> static method

##### HiveManager class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
