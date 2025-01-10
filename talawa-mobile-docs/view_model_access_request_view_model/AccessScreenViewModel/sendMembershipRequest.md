


# sendMembershipRequest method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> sendMembershipRequest
()








## Implementation

```dart
Future<void> sendMembershipRequest() async {
  //TODO: Implement Message arg for below function
  final result = await databaseFunctions.gqlAuthMutation(
    queries.sendMembershipRequest(selectedOrganization.id!),
  );
  if (result != null) {
    final OrgInfo membershipRequest = OrgInfo.fromJson(
      (((result as QueryResult).data!)['sendMembershipRequest']
          as Map<String, dynamic>)['organization'] as Map<String, dynamic>,
    );
    userConfig.updateUserMemberRequestOrg([membershipRequest]);
    if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
      navigationService.removeAllAndPush(
        Routes.waitingScreen,
        Routes.splashScreen,
      );
    } else {
      navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        'Join in request sent to ${selectedOrganization.name} successfully',
        MessageType.info,
      );
    }
  }
}
```







