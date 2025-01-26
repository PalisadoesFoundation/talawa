::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/navigation_service.dart](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  popAndPushScreen method

::: self-name
popAndPushScreen
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [popAndPushScreen]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[popAndPushScreen]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [routeName]{.parameter-name}, {]{#popAndPushScreen-param-routeName
    .parameter}
2.  [[dynamic]{.type-annotation} [arguments]{.parameter-name},
    ]{#popAndPushScreen-param-arguments .parameter}

})
:::

::: {.section .desc .markdown}
This function pop the initial route and push the new route to the
navigator.

**params**:

-   `routeName`: Name of the Route
-   `arguments`: Set of arguments

**returns**:

-   `Future<dynamic>`: resolves if the Screen was succesfully
    popAndPushed.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
  navigatorKey.currentState!.pop();
  return pushScreen(routeName, arguments: arguments);
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
4.  popAndPushScreen method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
