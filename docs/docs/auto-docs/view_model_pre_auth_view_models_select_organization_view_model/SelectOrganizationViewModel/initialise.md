




initialise method - SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


Future<void>
initialise(

1. String initialData

)

initializer.

**params**:

* `initialData`: data

**returns**:

* `Future<void>`: None

## Implementation

```
Future<void> initialise(String initialData) async {
  searchFocus.addListener(searchActive);
  if (!initialData.contains('-1')) {
    databaseFunctions.init();
    final fetch = await databaseFunctions.fetchOrgById(initialData);
    if (fetch.runtimeType == OrgInfo) {
      selectedOrganization = fetch as OrgInfo;
      if (userConfig.currentUser.refreshToken?.isEmpty ?? true) {
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: selectedOrganization,
        );
      } else {
        selectOrg(selectedOrganization);
      }
      setState(ViewState.idle);
    }
  }
}
```

 


1. [talawa](../../index.html)
2. [select\_organization\_view\_model](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. initialise method

##### SelectOrganizationViewModel class





talawa
1.0.0+1






