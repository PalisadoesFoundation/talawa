::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/pre_auth_view_models/login_view_model.dart](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  login method

::: self-name
login
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_login_view_model/LoginViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [login]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[login]{.name}()
:::

::: {.section .desc .markdown}
Performs the login operation.

Handles the login process by performing the following steps:

1.  Unfocusing the email and password text fields.
2.  Setting validation mode to `AutovalidateMode.always`.
3.  Validating the email and password fields using the form key.
4.  If validation is successful, disabling auto-validation mode and
    initiating the login process.
5.  Displaying a custom progress dialog during login.
6.  Initializing database functions.
7.  Performing a GraphQL mutation to login the user by providing the
    email and encrypted password.
8.  Handling the result of the login operation:
    -   Updating the current user with the received data.
    -   Redirecting the user based on their status in the application.
    -   Handling Firebase options for Android and iOS if available.
    -   Configuring Firebase and saving FCM token to the database.

In case of any exceptions during the login process, this function
catches and prints the error.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  login method

##### LoginViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
