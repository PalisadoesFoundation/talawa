


# logout method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> logout
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)





<p>This method destroys the user's session or sign out the user from app.
The function asks for the confimation in Custom Alert Dialog.</p>



## Implementation

```dart
Future<void> logout(BuildContext context) async {
  // push custom alert dialog with the confirmation message.
  navigationService.pushDialog(
    CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to logout?',
      successText: 'Logout',
      success: () async {
        try {
          final result = await databaseFunctions
              .gqlAuthMutation(queries.logout()) as QueryResult?;
          if (result != null && result.data!['logout'] == true) {
            navigationService.pop();
            navigationService.pushDialog(
              const CustomProgressDialog(
                key: Key('LogoutProgress'),
              ),
            );
            Future.delayed(const Duration(seconds: 1)).then((value) {
              user = Hive.box<User>('currentUser');
              url = Hive.box('url');
              final androidFirebaseOptionsBox =
                  Hive.box('androidFirebaseOptions');
              final iosFirebaseOptionsBox = Hive.box('iosFirebaseOptions');
              organisation = Hive.box<OrgInfo>('currentOrg');
              user.clear();
              url.clear();
              androidFirebaseOptionsBox.clear();
              iosFirebaseOptionsBox.clear();
              try {
                Firebase.app()
                    .delete(); // Deleting app will stop all Firebase plugins
              } catch (e) {
                debugPrint("ERROR: Unable to delete firebase app $e");
              }
              organisation.clear();
              navigationService.pop();
              navigationService.removeAllAndPush(
                '/selectLang',
                '/',
                arguments: '0',
              );
            });
          }
        } catch (e) {
          print(e);
        }
      },
    ),
  );
}
```







