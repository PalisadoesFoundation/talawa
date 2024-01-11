import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
// import 'package:talawa/main.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/encryptor.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// LoginViewModel class helps to interact with model to serve data.
///
/// Reacts to user's input in Login View.
///
/// Methods include:
/// * `login`
class LoginViewModel extends BaseModel {
  /// GlobalKey to identify and manage the state of a form widget.
  final formKey = GlobalKey<FormState>();

  /// List of maps to store greetings..
  late List<Map<String, dynamic>> greeting;

  /// TextEditingController for handling password input field.
  TextEditingController password = TextEditingController();

  /// TextEditingController for handling email input field.
  TextEditingController email = TextEditingController();

  /// FocusNode to manage focus for the password input field.
  FocusNode passwordFocus = FocusNode();

  /// FocusNode to manage focus for the email input field.
  FocusNode emailFocus = FocusNode();

  /// Determines when to perform automatic validation of form fields.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// Toggles password visibility (true for hidden, false for visible).
  bool hidePassword = true;

  /// Initializes the greeting message.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    greeting = [
      {
        'text': "We're ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall,
      },
      {
        'text': 'Glad ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24),
      },
      {
        'text': "you're ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall,
      },
      {
        'text': 'Back ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24),
      },
    ];
  }

  /// Performs the login operation.
  ///
  /// Handles the login process by performing the following steps:
  /// 1. Unfocusing the email and password text fields.
  /// 2. Setting validation mode to `AutovalidateMode.always`.
  /// 3. Validating the email and password fields using the form key.
  /// 4. If validation is successful, disabling auto-validation mode
  ///    and initiating the login process.
  /// 5. Displaying a custom progress dialog during login.
  /// 6. Initializing database functions.
  /// 7. Performing a GraphQL mutation to login the user by providing
  ///    the email and encrypted password.
  /// 8. Handling the result of the login operation:
  ///    - Updating the current user with the received data.
  ///    - Redirecting the user based on their status in the application.
  ///    - Handling Firebase options for Android and iOS if available.
  ///    - Configuring Firebase and saving FCM token to the database.
  ///
  /// In case of any exceptions during the login process,
  /// this function catches and prints the error.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: a promise that indicates the completion
  /// of the login process.
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
        // if user found.
        if (result != null) {
          final User loggedInUser = User.fromJson(
            (result as QueryResult).data!['login'] as Map<String, dynamic>,
          );
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
        }
      } on Exception catch (e) {
        print('here');
        print(e);
      }
    }
  }
}
