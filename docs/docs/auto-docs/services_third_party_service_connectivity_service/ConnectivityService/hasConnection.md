::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/third_party_service/connectivity_service.dart](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  hasConnection method

::: self-name
hasConnection
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html" below-sidebar=""}
<div>

# [hasConnection]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[hasConnection]{.name}()
:::

::: {.section .desc .markdown}
This function checks if the device currently has any type of network
connection.

**params**: None

**returns**:

-   `Future<bool>`: indicating whether the device has a network
    connection.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> hasConnection() async {
  try {
    final results = await getConnectionType();
    return results.isNotEmpty &&
        results.any((result) => result != ConnectivityResult.none);
  } catch (e) {
    return false;
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  hasConnection method

##### ConnectivityService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
