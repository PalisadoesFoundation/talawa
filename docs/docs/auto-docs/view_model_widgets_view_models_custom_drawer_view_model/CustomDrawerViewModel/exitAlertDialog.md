::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  exitAlertDialog method

::: self-name
exitAlertDialog
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  exitAlertDialog method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
