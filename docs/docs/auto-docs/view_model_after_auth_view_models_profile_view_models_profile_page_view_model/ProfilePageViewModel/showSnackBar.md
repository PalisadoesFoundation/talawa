::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [showSnackBar]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showSnackBar]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [message]{.parameter-name}]{#showSnackBar-param-message .parameter}

)
:::

::: {.section .desc .markdown}
show message on Snack Bar.

**params**:

-   `message`: String Message to show on snackbar

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void showSnackBar(String message) {
  _navigationService.showTalawaErrorDialog(message, MessageType.error);
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [profile_page_view_model](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  [ProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4.  showSnackBar method

##### ProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
