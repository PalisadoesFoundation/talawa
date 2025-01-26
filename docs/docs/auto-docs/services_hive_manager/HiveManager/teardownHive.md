::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/hive_manager.dart](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  teardownHive static method

::: self-name
teardownHive
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_hive_manager/HiveManager-class-sidebar.html" below-sidebar=""}
<div>

# [teardownHive]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[teardownHive]{.name}()
:::

::: {.section .desc .markdown}
Closes all opened Hive boxes and the Hive instance itself.

This method ensures that all Hive boxes are properly closed to avoid
potential data corruption when the application is terminated or when
Hive is no longer needed.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static Future<void> teardownHive() async {
  await _closeBoxes();
  await Hive.close();
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
4.  teardownHive static method

##### HiveManager class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
