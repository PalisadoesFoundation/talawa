::::::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [pushDialog]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [pushDialog]{.name}(

1.  [[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.type-annotation}
    [dialog]{.parameter-name}]{#pushDialog-param-dialog .parameter}

)
:::

::: {.section .desc .markdown}
This function remove all the routes till the particular route and add
new route.

**params**:

-   `dialog`: Widget to show

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void pushDialog(Widget dialog) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
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
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  pushDialog method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
