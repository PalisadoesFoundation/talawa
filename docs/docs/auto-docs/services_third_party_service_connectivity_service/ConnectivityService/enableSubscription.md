::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/third_party_service/connectivity_service.dart](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  enableSubscription method

::: self-name
enableSubscription
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html" below-sidebar=""}
<div>

# [enableSubscription]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[enableSubscription]{.name}()
:::

::: {.section .desc .markdown}
This function enables the subscription to connectivity changes.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> enableSubscription() async {
  connectivityInstance.onConnectivityChanged.listen(
    (List<ConnectivityResult> result) {
      print(result);
      connectionStatusController.add(result);
    },
    onError: (error) {
      // Handle errors during listening for changes
      print('Error listening for connectivity changes: $error');
    },
  );
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
4.  enableSubscription method

##### ConnectivityService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
