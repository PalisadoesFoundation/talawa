::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/navigation_service.dart](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  showCustomToast method

::: self-name
showCustomToast
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/NavigationService-class-sidebar.html" below-sidebar=""}
<div>

# [showCustomToast]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showCustomToast]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [msg]{.parameter-name}]{#showCustomToast-param-msg .parameter}

)
:::

::: {.section .desc .markdown}
Shows an Custom Toast.

**params**:

-   `msg`: Message shown in Toast

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void showCustomToast(String msg) {
  DelightToastBar(
    builder: (context) {
      return ToastCard(
        title: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        leading: const Icon(
          Icons.error_outline,
          color: Colors.redAccent,
        ),
        color: Colors.black.withOpacity(0.8),
      );
    },
  ).show(navigatorKey.currentContext!);
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
4.  showCustomToast method

##### NavigationService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
