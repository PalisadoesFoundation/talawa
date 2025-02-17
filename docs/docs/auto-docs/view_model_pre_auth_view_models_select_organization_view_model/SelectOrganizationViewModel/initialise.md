
<div>

# initialise method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
initialise(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    initialData]

)



initializer.

**params**:

-   `initialData`: data

**returns**:

-   `Future<void>`: None



## Implementation

``` language-dart
Future<void> initialise(String initialData) async {
  searchFocus.addListener(searchActive);
  if (!initialData.contains('-1')) {
    databaseFunctions.;
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







1.  [talawa](../../index.md)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.md)
4.  initialise method

##### SelectOrganizationViewModel class







