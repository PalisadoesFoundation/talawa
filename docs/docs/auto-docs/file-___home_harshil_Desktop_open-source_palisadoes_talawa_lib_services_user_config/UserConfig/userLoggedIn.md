




userLoggedIn method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. userLoggedIn method

userLoggedIn


dark\_mode

light\_mode




# userLoggedIn method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
userLoggedIn()

This function is used to log in the user.

**params**:
None

**returns**:

* `Future<bool>`: returns future of bool type.

## Implementation

```
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
    try {
      databaseFunctions.init();
      await sessionManager.refreshSession();
      databaseFunctions.init();
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

 


1. [talawa](../../index.html)
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. userLoggedIn method

##### UserConfig class





talawa
1.0.0+1






