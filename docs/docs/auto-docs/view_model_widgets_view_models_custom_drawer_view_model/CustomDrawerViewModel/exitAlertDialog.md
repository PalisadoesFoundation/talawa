::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [exitAlertDialog]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)]{.returntype}
[exitAlertDialog]{.name}()
:::

::: {.section .desc .markdown}
returns an exit alert dialog.

**params**: None

**returns**:

-   `CustomAlertDialog`: returns customAlertDialogBox.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
CustomAlertDialog exitAlertDialog() {
  return CustomAlertDialog(
    key: const Key("Exit?"),
    reverse: true,
    dialogSubTitle: 'Are you sure you want to exit this organization?',
    successText: 'Exit',
    success: () {},
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  exitAlertDialog method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
