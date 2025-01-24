




onTapContinue method - SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. onTapContinue method

onTapContinue


dark\_mode

light\_mode




# onTapContinue method


void
onTapContinue()

Helper for listener to check if user can tap on continue option or not.

**params**:
None

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [select\_organization\_view\_model](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. onTapContinue method

##### SelectOrganizationViewModel class





talawa
1.0.0+1






