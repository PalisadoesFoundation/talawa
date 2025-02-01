::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/navigation_service.dart](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  showTalawaErrorSnackBar method

::: self-name
showTalawaErrorSnackBar
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [showTalawaErrorSnackBar]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showTalawaErrorSnackBar]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [errorMessage]{.parameter-name},
    ]{#showTalawaErrorSnackBar-param-errorMessage .parameter}
2.  [[[MessageType](../../enums_enums/MessageType.html)]{.type-annotation}
    [messageType]{.parameter-name}]{#showTalawaErrorSnackBar-param-messageType
    .parameter}

)
:::

::: {.section .desc .markdown}
This is used for the quick error of `duration: 2 seconds`.

**params**:

-   `errorMessage`: Error Message shown in snackbar
-   `messageType`: Type of Message
-   `duration`: Duration of snackbar

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void showTalawaErrorSnackBar(
  String errorMessage,
  MessageType messageType,
) {
  final Duration duration = Duration(milliseconds: errorMessage.length * 80);
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      padding: EdgeInsets.zero,
      duration: duration,
      content: TalawaErrorSnackBar(
        duration: duration,
        messageType: messageType,
        errorMessage: errorMessage,
      ),
      backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
    ),
  );
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
4.  showTalawaErrorSnackBar method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
