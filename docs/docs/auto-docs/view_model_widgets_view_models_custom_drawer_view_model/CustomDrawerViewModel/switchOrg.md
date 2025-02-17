
<div>

# switchOrg method

</div>


void switchOrg(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)]
    switchToOrg]

)



This function switches the organization to the specified `switchToOrg`.

If `selectedOrg` is equal to `switchToOrg` and `switchToOrg` is present,
a warning message is displayed using a custom Snackbar. Otherwise, it
saves the `switchToOrg` as the current organization, updates the
selected organization name, and displays an informational message using
a custom Snackbar.

**params**:

-   `switchToOrg`: The organization to switch to.

**returns**: None



## Implementation

``` language-dart
void switchOrg(OrgInfo switchToOrg) {
  // if `selectedOrg` is equal to `switchOrg` and `switchToOrg` present or not.
  if ((selectedOrg == switchToOrg) &&
      (isPresentinSwitchableOrg(switchToOrg))) {
    // _navigationService.;
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
  navigationService.;
}
```







1.  [talawa](../../index.md)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  switchOrg method

##### CustomDrawerViewModel class







