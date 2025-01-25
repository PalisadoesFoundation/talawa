::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/connectivity_view_model.dart](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
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
::: {#dartdoc-main-content .main-content above-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html" below-sidebar=""}
<div>

# [enableSubscription]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [enableSubscription]{.name}()
:::

::: {.section .desc .markdown}
Subscribes to
[connectivityStream](../../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html)
of
[ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html).

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void enableSubscription() {
  try {
    _subscription =
        connectivityStream.listen((List<ConnectivityResult> result) {
      handleConnection(result);
    });
  } catch (e) {
    print("Error subscribing to connectivity stream: $e");
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [connectivity_view_model](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4.  enableSubscription method

##### AppConnectivity class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
