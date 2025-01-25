::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/connectivity_view_model.dart](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4.  handleOffline method

::: self-name
handleOffline
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html" below-sidebar=""}
<div>

# [handleOffline]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[handleOffline]{.name}()
:::

::: {.section .desc .markdown}
This function handles the actions to be taken when the device is
offline.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> handleOffline() async {
  isOnline = false;
  showSnackbar(isOnline: false);
  databaseFunctions.init();
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
4.  handleOffline method

##### AppConnectivity class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
