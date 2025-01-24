




switchOrg method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. switchOrg method

switchOrg


dark\_mode

light\_mode




# switchOrg method


void
switchOrg(

1. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html) switchToOrg

)

This function switches the organization to the specified `switchToOrg`.

If `selectedOrg` is equal to `switchToOrg` and `switchToOrg` is present, a warning message is displayed using a custom Snackbar.
Otherwise, it saves the `switchToOrg` as the current organization, updates the selected organization name,
and displays an informational message using a custom Snackbar.

**params**:

* `switchToOrg`: The organization to switch to.

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [custom\_drawer\_view\_model](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. switchOrg method

##### CustomDrawerViewModel class





talawa
1.0.0+1






