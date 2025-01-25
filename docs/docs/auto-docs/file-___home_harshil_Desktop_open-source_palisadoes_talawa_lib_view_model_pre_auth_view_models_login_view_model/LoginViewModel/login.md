




login method - LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. [LoginViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. login method

login


dark\_mode

light\_mode




# login method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
login()

Performs the login operation.

Handles the login process by performing the following steps:

1. Unfocusing the email and password text fields.
2. Setting validation mode to `AutovalidateMode.always`.
3. Validating the email and password fields using the form key.
4. If validation is successful, disabling auto-validation mode
   and initiating the login process.
5. Displaying a custom progress dialog during login.
6. Initializing database functions.
7. Performing a GraphQL mutation to login the user by providing
   the email and encrypted password.
8. Handling the result of the login operation:
   * Updating the current user with the received data.
   * Redirecting the user based on their status in the application.
   * Handling Firebase options for Android and iOS if available.
   * Configuring Firebase and saving FCM token to the database.

In case of any exceptions during the login process,
this function catches and prints the error.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> login() async {
  emailFocus.unfocus();
  passwordFocus.unfocus();
  validate = AutovalidateMode.always;
  // if the email and password are not empty.
  if (formKey.currentState!.validate()) {
    validate = AutovalidateMode.disabled;
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToLogin,
      action: () async {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('LoginProgress'),
          ),
        );
        databaseFunctions.init();
        // run the graph QL query to login the user,
        // passing `email` and `password`.
        final result = await databaseFunctions.gqlNonAuthMutation(
          queries.loginUser(
            email.text,
            Encryptor.encryptString(
              password.text,
            ),
          ),
        );
        navigationService.pop();

        return result;
      },
      onValidResult: (result) async {
        // if user found.
        if (result.data != null) {
          final User loggedInUser = User.fromJson(
            result.data!['login'] as Map<String, dynamic>,
          );
          userConfig.updateUser(loggedInUser);
        }
      },
      apiCallSuccessUpdateUI: () async {
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
        await storingCredentialsInSecureStorage();
      },
      onActionException: (e) async {
        print('here');
        print(e);
      },
    );
  }
}
```

 


1. [talawa](../../index.html)
2. [login\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. [LoginViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. login method

##### LoginViewModel class





talawa
1.0.0+1






