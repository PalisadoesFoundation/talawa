


# userLoggedIn method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> userLoggedIn
()





<p>This function is used to log in the user.</p>



## Implementation

```dart
Future<bool> userLoggedIn() async {
  initialiseStream();
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
  graphqlConfig.getToken().then((value) async {
    databaseFunctions.init();
    try {
      final QueryResult result = await databaseFunctions.gqlAuthQuery(
        queries.fetchUserInfo,
        variables: {'id': currentUser.id},
      ) as QueryResult;
      final User userInfo = User.fromJson(
        result.data!['users'][0] as Map<String, dynamic>,
        fromOrg: true,
      );
      userInfo.authToken = userConfig.currentUser.authToken;
      userInfo.refreshToken = userConfig.currentUser.refreshToken;
      userConfig.updateUser(userInfo);
      _currentOrg ??= _currentUser!.joinedOrganizations![0];
      _currentOrgInfoController.add(_currentOrg!);

      saveUserInHive();
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







