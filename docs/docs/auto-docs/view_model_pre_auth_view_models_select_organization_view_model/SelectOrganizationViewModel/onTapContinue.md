::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/pre_auth_view_models/select_organization_view_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  onTapContinue method

::: self-name
onTapContinue
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [onTapContinue]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [onTapContinue]{.name}()
:::

::: {.section .desc .markdown}
Helper for listener to check if user can tap on continue option or not.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void onTapContinue() {
  // if user selected any organization.
  if (selectedOrganization.id != '-1') {
    navigationService.pushScreen(
      Routes.signupDetailScreen,
      arguments: selectedOrganization,
    );
  } else {
    navigationService.showTalawaErrorSnackBar(
      'Select one organization to continue',
      MessageType.warning,
    );
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  onTapContinue method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
