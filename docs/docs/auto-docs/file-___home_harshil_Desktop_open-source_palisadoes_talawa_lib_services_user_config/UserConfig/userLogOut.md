




userLogOut method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. userLogOut method

userLogOut


dark\_mode

light\_mode




# userLogOut method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
userLogOut()

Logs out the current user.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> userLogOut() async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToLogout,
    action: () async {
      navigationService.pop();
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('LogoutProgress'),
        ),
      );
      return await databaseFunctions.gqlAuthMutation(queries.logout());
    },
    onValidResult: (result) async {
      if (result.data != null && result.data!['logout'] == true) {
        // throw StateError('error');

        final user = Hive.box<User>('currentUser');
        final url = Hive.box('url');
        final organisation = Hive.box<OrgInfo>('currentOrg');
        // final androidFirebaseOptionsBox = Hive.box('androidFirebaseOptions');
        // final iosFirebaseOptionsBox = Hive.box('iosFirebaseOptions');
        await user.clear();
        await url.clear();
        await organisation.clear();
        // androidFirebaseOptionsBox.clear();
        // iosFirebaseOptionsBox.clear();
        // try {
        //   Firebase.app()
        //       .delete(); // Deleting app will stop all Firebase plugins
        // } catch (e) {
        //   debugPrint("ERROR: Unable to delete firebase app $e");
        // }
        _currentUser = User(id: 'null', authToken: 'null');
      }
    },
    onActionException: (e) async {
      navigationService.pushDialog(
        const TalawaErrorDialog(
          'Unable to logout, please try again.',
          key: Key('TalawaError'),
          messageType: MessageType.error,
        ),
      );
    },
    updateUI: () {
      navigationService.pop();
    },
    apiCallSuccessUpdateUI: () {
      navigationService.removeAllAndPush(
        Routes.setUrlScreen,
        Routes.splashScreen,
        arguments: '',
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. userLogOut method

##### UserConfig class





talawa
1.0.0+1






