
<div>

# userLoggedIn method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




This function is used to log in the user.

**params**: None

**returns**:

-   `Future<bool>`: returns future of bool type.



## Implementation

``` language-dart
Future<bool>  async {
  ;
  final boxUser = Hive.box<User>('currentUser');
  final boxOrg = Hive.box<OrgInfo>('currentOrg');
  _currentOrg =
      boxOrg.get('org') ?? OrgInfo(name: 'Organization Name', id: 'null');
  _currentOrgInfoController.add(_currentOrg!);

  _currentUser = boxUser.get('user');

  // if there is not currentUser then returns false.
  if (_currentUser == null) {
    _currentUser = User(id: 'null', authToken: 'null');
    return false;
  }
  // generate access token
  graphqlConfig..then((value) async {
    try {
      databaseFunctions.;
      await sessionManager.;
      databaseFunctions.;
      final QueryResult result = await databaseFunctions.gqlAuthQuery(
        queries.fetchUserInfo,
        variables: {'id': currentUser.id},
      );
      final List users = result.data!['users'] as List;
      final User userInfo = User.fromJson(
        users[0] as Map<String, dynamic>,
        fromOrg: false,
      );
      userInfo.authToken = userConfig.currentUser.authToken;
      userInfo.refreshToken = userConfig.currentUser.refreshToken;
      userConfig.updateUser(userInfo);
      _currentOrg ??= _currentUser!.joinedOrganizations![0];
      _currentOrgInfoController.add(_currentOrg!);
      ;
      return true;
    } on Exception catch (e) {
      print(e);
      navigationService.showTalawaErrorSnackBar(
        "Couldn't update User details",
        MessageType.error,
      );
    }
  });
  return true;
}
```







1.  [talawa](../../index.md)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.md)
4.  userLoggedIn method

##### UserConfig class







