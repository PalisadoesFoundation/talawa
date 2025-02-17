::::::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
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
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  printNavigatorState method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
