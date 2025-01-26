::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  switchOrg method

::: self-name
switchOrg
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [switchOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [switchOrg]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
    [switchToOrg]{.parameter-name}]{#switchOrg-param-switchToOrg
    .parameter}

)
:::

::: {.section .desc .markdown}
This function switches the organization to the specified `switchToOrg`.

If `selectedOrg` is equal to `switchToOrg` and `switchToOrg` is present,
a warning message is displayed using a custom Snackbar. Otherwise, it
saves the `switchToOrg` as the current organization, updates the
selected organization name, and displays an informational message using
a custom Snackbar.

**params**:

-   `switchToOrg`: The organization to switch to.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void switchOrg(OrgInfo switchToOrg) {
  // if `selectedOrg` is equal to `switchOrg` and `switchToOrg` present or not.
  if ((selectedOrg == switchToOrg) &&
      (isPresentinSwitchableOrg(switchToOrg))) {
    // _navigationService.pop();
    navigationService.showTalawaErrorSnackBar(
      '${switchToOrg.name} already selected',
      MessageType.warning,
    );
  } else {
    userConfig.saveCurrentOrgInHive(switchToOrg);
    setSelectedOrganizationName(switchToOrg);
    navigationService.showTalawaErrorSnackBar(
      'Switched to ${switchToOrg.name}',
      MessageType.info,
    );
  }
  navigationService.pop();
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
4.  switchOrg method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
