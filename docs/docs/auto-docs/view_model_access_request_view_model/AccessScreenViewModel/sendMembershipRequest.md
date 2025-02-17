
<div>

# sendMembershipRequest method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Sending member ship request function.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  //TODO: Implement Message arg for below function
  final result = await databaseFunctions.gqlAuthMutation(
    queries.sendMembershipRequest(selectedOrganization.id!),
  );
  if (result.data != null) {
    final OrgInfo membershipRequest = OrgInfo.fromJson(
      (result.data!['sendMembershipRequest']
          as Map<String, dynamic>)['organization'] as Map<String, dynamic>,
    );
    userConfig.updateUserMemberRequestOrg([membershipRequest]);
    if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
      navigationService.removeAllAndPush(
        Routes.waitingScreen,
        Routes.splashScreen,
      );
    } else {
      navigationService.;
      navigationService.showTalawaErrorSnackBar(
        'Join in request sent to ${selectedOrganization.name} successfully',
        MessageType.info,
      );
    }
  }
}
```







1.  [talawa](../../index.md)
2.  [access_request_view_model](../../view_model_access_request_view_model/)
3.  [AccessScreenViewModel](../../view_model_access_request_view_model/AccessScreenViewModel-class.md)
4.  sendMembershipRequest method

##### AccessScreenViewModel class







