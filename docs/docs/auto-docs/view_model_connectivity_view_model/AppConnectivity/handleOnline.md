::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html" below-sidebar=""}
<div>

# [handleOnline]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[handleOnline]{.name}()
:::

::: {.section .desc .markdown}
This function handles the actions to be taken when the device is online.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> handleOnline() async {
  isOnline = true;
  showSnackbar(isOnline: true);
  databaseFunctions.init();
  cacheService.offlineActionQueue.getActions().forEach((action) async {
    final result = await action.execute();
    GraphqlExceptionResolver.encounteredExceptionOrError(
      CriticalActionException('action done'),
    );
    debugPrint(result.toString());
  });
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
4.  handleOnline method

##### AppConnectivity class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
