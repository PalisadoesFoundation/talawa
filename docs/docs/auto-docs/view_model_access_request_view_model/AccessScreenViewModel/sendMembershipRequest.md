




sendMembershipRequest method - AccessScreenViewModel class - access\_request\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/access\_request\_view\_model.dart](../../view_model_access_request_view_model/view_model_access_request_view_model-library.html)
3. [AccessScreenViewModel](../../view_model_access_request_view_model/AccessScreenViewModel-class.html)
4. sendMembershipRequest method

sendMembershipRequest


dark\_mode

light\_mode




# sendMembershipRequest method


Future<void>
sendMembershipRequest()

Sending member ship request function.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> sendMembershipRequest() async {
  //TODO: Implement Message arg for below function
  final result = await databaseFunctions.gqlAuthMutation(
    queries.sendMembershipRequest(selectedOrganization.id!),
  );
  if (result.data != null) {
    final OrgInfo membershipRequest = OrgInfo.fromJson(
      ((result.data!)['sendMembershipRequest']
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

 


1. [talawa](../../index.html)
2. [access\_request\_view\_model](../../view_model_access_request_view_model/view_model_access_request_view_model-library.html)
3. [AccessScreenViewModel](../../view_model_access_request_view_model/AccessScreenViewModel-class.html)
4. sendMembershipRequest method

##### AccessScreenViewModel class





talawa
1.0.0+1






