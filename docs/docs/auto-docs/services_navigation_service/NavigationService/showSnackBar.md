::::::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [showSnackBar]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showSnackBar]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [message]{.parameter-name}, {]{#showSnackBar-param-message
    .parameter}
2.  [[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)]{.type-annotation}
    [duration]{.parameter-name} = [const Duration(seconds:
    2)]{.default-value}, ]{#showSnackBar-param-duration .parameter}

})
:::

::: {.section .desc .markdown}
This is used for the quick alert of `duration: 2 seconds` with text
message(passed).

**params**:

-   `message`: Message would be shown on snackbar
-   `duration`: Duration of Snackbar

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void showSnackBar(
  String message, {
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: duration,
      content: Text(
        AppLocalizations.of(navigatorKey.currentContext!)!
            .strictTranslate(message),
      ),
    ),
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
4.  showSnackBar method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
