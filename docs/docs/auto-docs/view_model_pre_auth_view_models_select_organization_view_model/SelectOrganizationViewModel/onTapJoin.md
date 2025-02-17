
<div>

# onTapJoin method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




This function make user to join the selected organization.

The function uses `joinOrgById` graph QL query

**params**: None

**returns**:

-   `Future<void>`: None



## Implementation

``` language-dart
Future<void>  async {
  // if `selectedOrganization` registrations is not required.
  if (selectedOrganization!.userRegistrationRequired == false) {
    try {
      // run the graph QL mutation
      final QueryResult result = await databaseFunctions.gqlAuthMutation(
        queries.joinOrgById(selectedOrganization!.id!),
      );

      final List<OrgInfo>? joinedOrg =
          ((result.data!['joinPublicOrganization']
                      as Map<String, dynamic>)['joinedOrganizations']
                  as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .;
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
        navigationService.;
        navigationService.showTalawaErrorSnackBar(
          'Joined ${selectedOrganization?.name} successfully',
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







1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  onTapJoin method

##### SelectOrganizationViewModel class







