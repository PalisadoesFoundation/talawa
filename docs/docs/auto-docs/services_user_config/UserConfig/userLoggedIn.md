::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/user_config.dart](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  userLoggedIn method

::: self-name
userLoggedIn
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [userLoggedIn]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[userLoggedIn]{.name}()
:::

::: {.section .desc .markdown}
This function is used to log in the user.

**params**: None

**returns**:

-   `Future<bool>`: returns future of bool type.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  userLoggedIn method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
