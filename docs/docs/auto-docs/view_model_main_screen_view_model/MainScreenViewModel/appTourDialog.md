::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [appTourDialog]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[appTourDialog]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [ctx]{.parameter-name}]{#appTourDialog-param-ctx .parameter}

)
:::

::: {.section .desc .markdown}
Builds and returns an AppTourDialog.

**params**:

-   `ctx`: The build context to work with.

**returns**:

-   `Widget`: The built
    [Dialog](https://api.flutter.dev/flutter/material/Dialog-class.html)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget appTourDialog(BuildContext ctx) {
  return CustomAlertDialog(
    dialogTitle: 'App Tour',
    dialogSubTitle: 'Start app tour to know talawa functioning',
    successText: 'Start',
    secondaryButtonText: 'Skip',
    success: () {
      navigationService.pop();
      print(MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen);
      if (MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen ??
          false) {
        MainScreenViewModel.scaffoldKey.currentState?.closeDrawer();
      }
      tourHomeTargets();
    },
    secondaryButtonTap: () {
      tourComplete = false;
      tourSkipped = true;
      navigationService.pop();
      notifyListeners();
    },
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4.  appTourDialog method

##### MainScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
