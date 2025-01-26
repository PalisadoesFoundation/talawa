::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/navigation_service.dart](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  printNavigatorState method

::: self-name
printNavigatorState
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [printNavigatorState]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [printNavigatorState]{.name}()
:::

::: {.section .desc .markdown}
This function prints current navigation state.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void printNavigatorState() {
  final navigatorState = navigatorKey.currentState;
  if (navigatorState != null) {
    print('Can pop: ${navigatorState.canPop()}');
    print('Current Route: ${navigatorState.widget}');
    print('Navigator Stack: ${navigatorState.widget}');
    print(
      'Route History: ${navigatorState.widget.pages.map((page) => page.toString()).toList()}',
    );
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  printNavigatorState method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
