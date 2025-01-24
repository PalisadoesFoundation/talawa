




onTapJoin method - SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. onTapJoin method

onTapJoin


dark\_mode

light\_mode




# onTapJoin method


Future<void>
onTapJoin()

This function make user to join the selected organization.

The function uses `joinOrgById` graph QL query

**params**:
None

**returns**:

* `Future<void>`: None

## Implementation

```
Future<void> onTapJoin() async {
  // if `selectedOrganization` registrations is not required.
  if (selectedOrganization.userRegistrationRequired == false) {
    try {
      // run the graph QL mutation
      final QueryResult result = await databaseFunctions.gqlAuthMutation(
        queries.joinOrgById(selectedOrganization.id!),
      );

      final List<OrgInfo>? joinedOrg =
          ((result.data!['joinPublicOrganization']
                      as Map<String, dynamic>)['joinedOrganizations']
                  as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList();
      userConfig.updateUserJoinedOrg(joinedOrg!);
      // if user joined organization length is 1
      if (userConfig.currentUser.joinedOrganizations!.length == 1) {
        userConfig.saveCurrentOrgInHive(
          userConfig.currentUser.joinedOrganizations![0],
        );
        navigationService.removeAllAndPush(
          Routes.mainScreen,
          Routes.splashScreen,
          arguments: MainScreenArgs(mainScreenIndex: 0),
        );
      } else {
        navigationService.pop();
        navigationService.showTalawaErrorSnackBar(
          'Joined ${selectedOrganization.name} successfully',
          MessageType.info,
        );
      }
    } on Exception catch (e) {
      print(e);
      navigationService.showTalawaErrorSnackBar(
        'Something went wrong',
        MessageType.error,
      );
    }
  }
  // else {
  //   try {
  //     // navigationService.pushScreen(Routes.requestAccess);
  //   } on Exception catch (e) {
  //     print(e);
  //     navigationService.showTalawaErrorSnackBar(
  //       'SomeThing went wrong',
  //       MessageType.error,
  //     );
  //   }
  // }
}
```

 


1. [talawa](../../index.html)
2. [select\_organization\_view\_model](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. onTapJoin method

##### SelectOrganizationViewModel class





talawa
1.0.0+1






