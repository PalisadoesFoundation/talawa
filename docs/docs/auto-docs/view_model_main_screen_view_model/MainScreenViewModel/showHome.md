::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/main_screen_view_model.dart](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4.  showHome method

::: self-name
showHome
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [showHome]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showHome]{.name}(

1.  [[[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)]{.type-annotation}
    [clickedTarget]{.parameter-name}]{#showHome-param-clickedTarget
    .parameter}

)
:::

::: {.section .desc .markdown}
This function shows the Home screen.

**params**:

-   `clickedTarget`: object to identify clickedTarget.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void showHome(TargetFocus clickedTarget) {
  switch (clickedTarget.identify) {
    case "keySHMenuIcon":
      scaffoldKey.currentState!.openDrawer();
      break;
    case "keyDrawerLeaveCurrentOrg":
      navigationService.pop();
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4.  showHome method

##### MainScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
