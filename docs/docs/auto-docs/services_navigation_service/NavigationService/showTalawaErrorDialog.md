::::::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [showTalawaErrorDialog]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showTalawaErrorDialog]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [errorMessage]{.parameter-name},
    ]{#showTalawaErrorDialog-param-errorMessage .parameter}
2.  [[[MessageType](../../enums_enums/MessageType.html)]{.type-annotation}
    [messageType]{.parameter-name}]{#showTalawaErrorDialog-param-messageType
    .parameter}

)
:::

::: {.section .desc .markdown}
Shows an Error Dialog Box.

**params**:

-   `errorMessage`: Message shown in dialog
-   `messageType`: Type of Message

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void showTalawaErrorDialog(String errorMessage, MessageType messageType) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return TalawaErrorDialog(
        errorMessage,
        messageType: messageType,
      );
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
4.  showTalawaErrorDialog method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
