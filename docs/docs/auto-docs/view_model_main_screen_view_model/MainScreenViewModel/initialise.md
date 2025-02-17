::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialise]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [ctx]{.parameter-name}, {]{#initialise-param-ctx .parameter}
2.  [required
    [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [fromSignUp]{.parameter-name}, ]{#initialise-param-fromSignUp
    .parameter}
3.  [required
    [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [mainScreenIndex]{.parameter-name},
    ]{#initialise-param-mainScreenIndex .parameter}
4.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [demoMode]{.parameter-name} = [false]{.default-value},
    ]{#initialise-param-demoMode .parameter}
5.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [testMode]{.parameter-name} = [false]{.default-value},
    ]{#initialise-param-testMode .parameter}

})
:::

::: {.section .desc .markdown}
Initalizing function.

**params**:

-   `ctx`: BuildContext, contain parent info
-   `fromSignUp`: Bool to find user entry
-   `mainScreenIndex`: Index to find tab on mainScreen
-   `demoMode`: Whether the app is in demo mode
-   `testMode`: Whether the app is in test mode

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialise(
  BuildContext ctx, {
  required bool fromSignUp,
  required int mainScreenIndex,
  bool demoMode = false,
  bool testMode = false,
}) {
  this.testMode = testMode;
  MainScreenViewModel.demoMode = demoMode;
  currentPageIndex = mainScreenIndex;
  showAppTour = fromSignUp || demoMode;
  context = ctx;
  final appTourDialogWidget = appTourDialog(ctx);
  print(ctx);
  print(context);
  pluginPrototypeData = {
    "Donation": {
      "icon": Icons.attach_money_outlined,
      "page": const ChangeThemeTile(),
    },
  };

  notifyListeners();
  if (!showAppTour) {
    tourComplete = true;
    tourSkipped = false;
  } else {
    Future.delayed(
      const Duration(seconds: 1),
      () => navigationService.pushDialog(
        appTourDialogWidget,
      ),
    );
  }
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
4.  initialise method

##### MainScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
