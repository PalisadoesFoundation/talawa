::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/third_party_service/connectivity_service.dart](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  connectionStream property

::: self-name
connectionStream
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html" below-sidebar=""}
<div>

# [connectionStream]{.kind-property} property

</div>

::: {#getter .section}
::: {.section .multi-line-signature}
[[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
get [connectionStream]{.name}
:::

::: {.section .desc .markdown}
Getter for the stream of connection status changes.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Stream<List<ConnectivityResult>> get connectionStream =>
    connectionStatusController.stream;
```
:::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  connectionStream property

##### ConnectivityService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
