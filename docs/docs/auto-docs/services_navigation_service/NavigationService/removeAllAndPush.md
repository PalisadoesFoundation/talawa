::::::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [removeAllAndPush]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[removeAllAndPush]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [routeName]{.parameter-name}, ]{#removeAllAndPush-param-routeName
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [tillRoute]{.parameter-name}, {]{#removeAllAndPush-param-tillRoute
    .parameter}
3.  [[dynamic]{.type-annotation} [arguments]{.parameter-name},
    ]{#removeAllAndPush-param-arguments .parameter}

})
:::

::: {.section .desc .markdown}
This function remove all the routes till the particular route and add
new route.

**params**:

-   `routeName`: Name of the Route
-   `tillRoute`: Route till we want to remove
-   `arguments`: Set of arguments

**returns**:

-   `Future<dynamic>`: resolves if the Screen was succesfully
    removeAllAndPushed.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> removeAllAndPush(
  String routeName,
  String tillRoute, {
  dynamic arguments,
}) {
  return navigatorKey.currentState!.pushNamedAndRemoveUntil(
    routeName,
    ModalRoute.withName(tillRoute),
    arguments: arguments,
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
4.  removeAllAndPush method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
