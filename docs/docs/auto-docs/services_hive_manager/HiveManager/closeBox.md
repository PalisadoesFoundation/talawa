::::::: {#dartdoc-main-content .main-content above-sidebar="services_hive_manager/HiveManager-class-sidebar.html" below-sidebar=""}
<div>

# [closeBox\<[T]{.type-parameter}\>]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[closeBox]{.name}\<[T]{.type-parameter}\>(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [boxName]{.parameter-name}]{#closeBox-param-boxName .parameter}

)
:::

::: {.section .desc .markdown}
Closes the `boxName` named box.

**params**:

-   `boxName`: Name of the box.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static Future<void> closeBox<T>(String boxName) async {
  try {
    await Hive.box<T>(boxName).close();
  } catch (e) {
    print('Failed to close the box $boxName');
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [hive_manager](../../services_hive_manager/)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.html)
4.  closeBox\<[T]{.type-parameter}\> static method

##### HiveManager class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
