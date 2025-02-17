
<div>

# onTapContinue method

</div>


void 



Helper for listener to check if user can tap on continue option or not.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  // if user selected any organization.
  if (selectedOrganization?.id != '-1') {
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







1.  [talawa](../../index.md)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.md)
4.  onTapContinue method

##### SelectOrganizationViewModel class







