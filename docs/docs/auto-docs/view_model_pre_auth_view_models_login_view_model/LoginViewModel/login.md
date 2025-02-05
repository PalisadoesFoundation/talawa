


# login method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> login
()





<p>This function is used to sign-in the user into application.</p>



## Implementation

```dart
Future<void> login() async {
  emailFocus.unfocus();
  passwordFocus.unfocus();
  validate = AutovalidateMode.always;
  // if the email and password are not empty.
  if (formKey.currentState!.validate()) {
    validate = AutovalidateMode.disabled;
    navigationService
        .pushDialog(const CustomProgressDialog(key: Key('LoginProgress')));
    databaseFunctions.init();
    try {
      // run the graph QL query to login the user, passing `email` and `password`.
      final result = await databaseFunctions
          .gqlNonAuthMutation(queries.loginUser(email.text, password.text));
      navigationService.pop();
      // if user found.
      if (result != null) {
        final User loggedInUser =
            User.fromJson(result.data!['login'] as Map<String, dynamic>);
        userConfig.updateUser(loggedInUser);
        // if user has not already joined any organization.
        if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
          navigationService.removeAllAndPush(
            Routes.waitingScreen,
            Routes.splashScreen,
          );
        } else {
          userConfig.saveCurrentOrgInHive(
            userConfig.currentUser.joinedOrganizations![0],
          );
          navigationService.removeAllAndPush(
            Routes.mainScreen,
            Routes.splashScreen,
            arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
          );
        }
        final loginResult = result.data['login'] as Map<String, dynamic>;
        androidFirebaseOptions =
            loginResult['androidFirebaseOptions'] as Map<String, dynamic>;
        iosFirebaseOptions =
            loginResult['iosFirebaseOptions'] as Map<String, dynamic>;
        if (androidFirebaseOptions['apiKey'] != null ||
            iosFirebaseOptions['apiKey'] != null) {
          await setUpFirebase();

          final token = await FirebaseMessaging.instance.getToken();
          await databaseFunctions.gqlAuthMutation(
            queries.saveFcmToken(token),
          );

          await setUpFirebaseMessaging();

          final androidFirebaseOptionsBox =
              await Hive.openBox('androidFirebaseOptions');
          androidFirebaseOptionsBox.put(
            'androidFirebaseOptions',
            androidFirebaseOptions,
          );

          final iosFirebaseOptionsBox =
              await Hive.openBox('iosFirebaseOptions');
          iosFirebaseOptionsBox.put(
            'iosFirebaseOptions',
            iosFirebaseOptions,
          );
        }
      }
    } on Exception catch (e) {
      print('here');
      print(e);
    }
  }
}
```







