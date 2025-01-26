::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  setSelectedOrganizationName method

::: self-name
setSelectedOrganizationName
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setSelectedOrganizationName]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setSelectedOrganizationName]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
    [updatedOrganization]{.parameter-name}]{#setSelectedOrganizationName-param-updatedOrganization
    .parameter}

)
:::

::: {.section .desc .markdown}
This function switches the current organization to new organization.

**params**:

-   `updatedOrganization`: `OrgInfo` type, new organization.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setSelectedOrganizationName(OrgInfo updatedOrganization) {
  // if current and updated organization are not same.
  if (_selectedOrg != updatedOrganization) {
    _selectedOrg = updatedOrganization;
    // update in `UserConfig` variable.
    userConfig.currentOrgInfoController.add(_selectedOrg!);
    notifyListeners();
  }
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
4.  setSelectedOrganizationName method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
