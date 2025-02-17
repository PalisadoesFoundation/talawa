
<div>

# userLogOut method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Logs out the current user.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToLogout,
    action: () async {
      navigationService.;
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('LogoutProgress'),
        ),
      );
      return await databaseFunctions.gqlAuthMutation(queries.);
    },
    onValidResult: (result) async {
      if (result.data != null && result.data!['logout'] == true) {
        // throw StateError('error');

        final user = Hive.box<User>('currentUser');
        final url = Hive.box('url');
        final organisation = Hive.box<OrgInfo>('currentOrg');
        // final androidFirebaseOptionsBox = Hive.box('androidFirebaseOptions');
        // final iosFirebaseOptionsBox = Hive.box('iosFirebaseOptions');
        await user.;
        await url.;
        await organisation.;
        // androidFirebaseOptionsBox.;
        // iosFirebaseOptionsBox.;
        // try {
        //   Firebase.
        //       .; // Deleting app will stop all Firebase plugins
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
      navigationService.;
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







1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  userLogOut method

##### UserConfig class







