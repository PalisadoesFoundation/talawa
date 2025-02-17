::::::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html" below-sidebar=""}
<div>

# [getConnectionType]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[getConnectionType]{.name}()
:::

::: {.section .desc .markdown}
Checks the current internet connectivity status of the device.

**params**: None

**returns**:

-   `Future<List<ConnectivityResult>>`: indicates if the url is
    reachable.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<ConnectivityResult>> getConnectionType() async {
  final result = await connectivity.checkConnectivity();
  return result;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  getConnectionType method

##### ConnectivityService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
