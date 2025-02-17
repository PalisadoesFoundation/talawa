::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html" below-sidebar=""}
<div>

# [handleConnection]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[handleConnection]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [result]{.parameter-name}]{#handleConnection-param-result
    .parameter}

)
:::

::: {.section .desc .markdown}
This function handles the device\'s connectivity status based on the
provided
[List\<ConnectivityResult\>](https://api.flutter.dev/flutter/dart-core/List-class.html).

**params**:

-   `result`: A
    [List\<ConnectivityResult\>](https://api.flutter.dev/flutter/dart-core/List-class.html)
    indicating the current connectivity status.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> handleConnection(List<ConnectivityResult> result) async {
  if (result.any(
    (r) =>
        ![ConnectivityResult.none, ConnectivityResult.bluetooth].contains(r),
  )) {
    handleOnline();
  } else {
    handleOffline();
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [connectivity_view_model](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4.  handleConnection method

##### AppConnectivity class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
