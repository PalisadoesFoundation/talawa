import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/app_strings.dart';

import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';

import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/url_update_service.dart';
import 'package:talawa/utils/encryptor.dart';
import 'package:talawa/utils/validators.dart';
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

  /// This field store previous user Email.
  String? prevUserEmail;

  /// This field store previous user Password.
  String? prevUserPassword;

  /// Secure local storage instance.
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

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

  /// TextEditingController for handling server URL input field.
  TextEditingController urlController = TextEditingController();

  /// FocusNode to manage focus for the URL input field.
  FocusNode urlFocus = FocusNode();

  /// Controls visibility of the server URL input field.
  bool showUrlField = false;

  /// Key constants for Hive storage.
  static const String urlKey = "url";
  static const String imageUrlKey = "imageUrl";

  /// Initializes the greeting message.and loads the current server URL.
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
    loadCurrentUrl();
  }

  /// Loads the current server URL from Hive storage.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void loadCurrentUrl() {
    final box = Hive.box('url');
    final String? currentUrl = box.get(urlKey) as String?;
    if (currentUrl != null && currentUrl.trim().isNotEmpty) {
      urlController.text = currentUrl;
    }
  }

  /// Toggles the visibility of the server URL input field.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void toggleUrlField() {
    showUrlField = !showUrlField;
    notifyListeners();
  }

  /// Updates the server URL in Hive storage and GraphQL config.
  ///
  /// **params**:
  /// * `newUrl`: The new server URL to save
  ///
  /// **returns**:
  /// * `Future<bool>`: Returns true if URL is valid and saved successfully
  Future<bool> updateServerUrl(String newUrl) async {
    final urlUpdateService = UrlUpdateService();
    return await urlUpdateService.updateServerUrl(newUrl);
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
  ///   None
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
              result.data!['signIn'] as Map<String, dynamic>,
            );
            userConfig.updateUser(loggedInUser);
          }
        },
        apiCallSuccessUpdateUI: () async {
          // if user has not already joined any organization.
          if (userConfig.currentUser.joinedOrganizations == null) {
            navigationService.removeAllAndPush(
              Routes.mainScreen,
              Routes.splashScreen,
              arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
            );
          } else if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
            navigationService.removeAllAndPush(
              Routes.mainScreen,
              Routes.splashScreen,
              arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
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

  /// Storing credentials in secure storage.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> storingCredentialsInSecureStorage() async {
    try {
      await secureStorage.write(
        key: "userEmail",
        value: this.email.text,
      );
      await secureStorage.write(
        key: "userPassword",
        value: this.password.text,
      );
    } catch (e) {
      // Handle secure storage write failure
      print("Failed to save credentials: $e");
    }
  }

  /// Fetch the previous user credentials.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchPrevUser() async {
    try {
      prevUserEmail = await secureStorage.read(key: "userEmail");
      prevUserPassword = await secureStorage.read(key: "userPassword");
    } catch (e) {
      print("Error decrypting previous values $e");
    }
  }
}
