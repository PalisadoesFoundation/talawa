::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/main_screen_view_model.dart](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4.  onTabTapped method

::: self-name
onTabTapped
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [onTabTapped]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [onTabTapped]{.name}(

1.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [index]{.parameter-name}]{#onTabTapped-param-index .parameter}

)
:::

::: {.section .desc .markdown}
Handles click on
[BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html).

**params**:

-   `index`: it is track of current page index.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void onTabTapped(int index) {
  currentPageIndex = index;
  notifyListeners();
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
4.  onTabTapped method

##### MainScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
