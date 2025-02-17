::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getFabTitle]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getFabTitle]{.name}()
:::

::: {.section .desc .markdown}
The funtion returns title to be displayed on Floating Action Button.

**params**: None

**returns**:

-   `String`: Returns the title to be displayed on Floating Action
    Button.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String getFabTitle() {
  if (event.isRegisterable == false) {
    return "Not Registrable";
  } else if (event.isRegistered == true) {
    return "Registered";
  } else {
    return "Register";
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  getFabTitle method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
