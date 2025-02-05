


# onTapJoin method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> onTapJoin
()





<p>This function make user to join the selected organization.
The function uses <code>joinOrgById</code> graph QL query.</p>



## Implementation

```dart
Future<void> onTapJoin() async {
  // if `selectedOrganization` is public.
  if (selectedOrganization.isPublic == true) {
    try {
      // run the graph QL mutation
      final QueryResult result = await databaseFunctions.gqlAuthMutation(
        queries.joinOrgById(selectedOrganization.id!),
      ) as QueryResult;

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
        'SomeThing went wrong',
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







