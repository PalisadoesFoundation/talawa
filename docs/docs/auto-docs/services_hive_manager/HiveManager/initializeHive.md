::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/hive_manager.dart](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  initializeHive static method

::: self-name
initializeHive
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_hive_manager/HiveManager-class-sidebar.html" below-sidebar=""}
<div>

# [initializeHive]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initializeHive]{.name}({

1.  [required
    [[Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html)]{.type-annotation}
    [dir]{.parameter-name}, ]{#initializeHive-param-dir .parameter}

})
:::

::: {.section .desc .markdown}
Initializes Hive with the specified directory.

**params**:

-   `dir`: A
    [Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html)
    object representing the directory where Hive will store its data
    files.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static Future<void> initializeHive({required Directory dir}) async {
  _initHive(dir);
  await registerAdapters();
  await _openBoxes();
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
4.  initializeHive static method

##### HiveManager class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
