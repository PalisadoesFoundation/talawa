::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/connectivity_view_model.dart](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4.  showSnackbar static method

::: self-name
showSnackbar
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html" below-sidebar=""}
<div>

# [showSnackbar]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showSnackbar]{.name}({

1.  [required
    [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [isOnline]{.parameter-name}, ]{#showSnackbar-param-isOnline
    .parameter}

})
:::

::: {.section .desc .markdown}
Triggers the snackbar UI to show online status.

**params**:

-   `isOnline`: online status of the device.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static void showSnackbar({required bool isOnline}) {
  final context = navigationService.navigatorKey.currentContext;
  if (context != null) {
    final TextStyle customStyle = Theme.of(context).textTheme.bodyMedium!;
    if (isOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.green,
          content: Text(
            'You are back online!',
            style: customStyle,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'You are ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: 'Offline!',
                  style: customStyle.copyWith(color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      );
    }
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
4.  showSnackbar static method

##### AppConnectivity class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
