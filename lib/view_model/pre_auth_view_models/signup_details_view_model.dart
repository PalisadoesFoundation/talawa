import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/url_update_service.dart';
import 'package:talawa/utils/encryptor.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// SignupDetailsViewModel class helps to interact with model to serve data and react to user's input for Sign Up Details section.
///
/// Methods include:
/// * `signUp`
class SignupDetailsViewModel extends BaseModel {
  /// GlobalKey to identify and manage the state of a form widget.
  final formKey = GlobalKey<FormState>();

  /// List of maps to store greeting information, where each greeting is represented by a map with String keys and dynamic values.
  late List<Map<String, dynamic>> greeting;

  /// Represents information about the selected organization.
  late OrgInfo? selectedOrganization;

  /// Secure local storage instance.
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  /// TextEditingController for handling confirmation password input field.
  TextEditingController confirmPassword = TextEditingController();

  /// TextEditingController for handling first name input field.
  TextEditingController firstName = TextEditingController();

  /// TextEditingController for handling last name input field.
  TextEditingController lastName = TextEditingController();

  /// TextEditingController for handling password input field.
  TextEditingController password = TextEditingController();

  /// TextEditingController for handling email input field.
  TextEditingController email = TextEditingController();

  /// AutovalidateMode to determine when to perform automatic validation of form fields.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// FocusNode to manage focus for the confirmation password input field.
  FocusNode confirmFocus = FocusNode();

  /// Boolean to toggle password visibility (true for hidden, false for visible).
  bool hidePassword = true;

  /// TextEditingController for handling server URL input field.
  TextEditingController urlController = TextEditingController();

  /// FocusNode to manage focus for the URL input field.
  FocusNode urlFocus = FocusNode();

  /// Controls visibility of the server URL input field.
  bool showUrlField = false;

  /// Initializes the greeting message for a selected organization.and loads the current server URL.
  ///
  /// **params**:
  /// * `org`: OrgInfo - the organization information to set as selected.
  ///
  /// **returns**:
  ///   None
  void initialise(OrgInfo? org) {
    selectedOrganization = org;
    // greeting message
    greeting = [
      {
        'text': "Let's ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall,
      },
      {
        'text': 'get ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall,
      },
      {
        'text': "you ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall,
      },
      {
        'text': 'SignUp ',
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
    return locator<UrlUpdateService>().updateServerUrl(newUrl);
  }

  /// Initiates the sign-up process.
  ///
  /// Handles the sign-up process by performing the following steps:
  /// 1. Unfocusing the current focus scope.
  /// 2. Setting the view state to `ViewState.busy`.
  /// 3. Setting validation mode to `AutovalidateMode.always`.
  /// 4. Setting the view state to `ViewState.idle`.
  /// 5. Validating the form using the form key.
  /// 6. If validation is successful, disabling auto-validation mode and
  ///    initiating the sign-up.
  /// 7. Displaying a custom progress dialog during sign-up.
  /// 8. Initializing database functions.
  /// 9. Performing a GraphQL mutation to register the user with provided
  ///    details (first name, last name, email, password).
  /// 10. Handling the result of the sign-up operation:
  ///     - Updating the current user with the received data.
  ///     - Refreshing the access token.
  ///     - Joining a public organization or sending a membership request
  ///       based on the selected organization.
  ///
  /// In case of any exceptions during the sign-up process, this function
  /// catches and prints the error
  /// and displays a Talawa error snackbar with a corresponding message.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> signUp() async {
    FocusScope.of(navigationService.navigatorKey.currentContext!).unfocus();
    setState(ViewState.busy);
    validate = AutovalidateMode.always;
    setState(ViewState.idle);
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      await actionHandlerService.performAction(
        actionType: ActionType.critical,
        criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToSignUp,
        action: () async {
          navigationService.pushDialog(
            const CustomProgressDialog(
              key: Key('SignUpProgress'),
            ),
          );
          databaseFunctions.init();
          print("heelo");
          print(selectedOrganization?.id);
          final String query;
          if (selectedOrganization != null) {
            query = queries.registerUser(
              firstName.text,
              lastName.text,
              email.text,
              Encryptor.encryptString(
                password.text,
              ),
              selectedOrganization?.id,
            );
          } else {
            query = queries.registerUser(
              firstName.text,
              lastName.text,
              email.text,
              Encryptor.encryptString(
                password.text,
              ),
              null,
            );
          }

          final result = await databaseFunctions.gqlNonAuthMutation(query);
          navigationService.pop();
          return result;
        },
        onValidResult: (result) async {
          if (result.data != null) {
            final User signedInUser = User.fromJson(
              result.data!['signUp'] as Map<String, dynamic>,
            );
            final bool userSaved = await userConfig.updateUser(signedInUser);
            final bool tokenRefreshed = await graphqlConfig.getToken() as bool;
            // if user successfully saved and access token is also generated.
            if (userSaved && tokenRefreshed) {
              // if the selected organization userRegistration not required.
              if (selectedOrganization?.id == '-1') {
                navigationService.removeAllAndPush(
                  Routes.mainScreen,
                  Routes.splashScreen,
                  arguments: MainScreenArgs(
                    mainScreenIndex: 0,
                    fromSignUp: false,
                  ),
                );
                await storingCredentialsInSecureStorage();
              } else {
                // the query here will be changes according to if and else once memebership function available
                final query = queries.joinOrgById(selectedOrganization!.id!);
                print(query);
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(
                  query,
                );
                final joinPublicOrganization = result
                    .data!['joinPublicOrganization'] as Map<String, dynamic>;
                final List<OrgInfo>? joinedOrg = (joinPublicOrganization[
                        'joinedOrganizations'] as List<dynamic>?)
                    ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
                    .toList();
                await userConfig.updateUserJoinedOrg(joinedOrg!);
                userConfig.saveCurrentOrgInHive(
                  userConfig.currentUser.joinedOrganizations![0],
                );
                navigationService.removeAllAndPush(
                  Routes.mainScreen,
                  Routes.splashScreen,
                  arguments:
                      MainScreenArgs(mainScreenIndex: 0, fromSignUp: true),
                );
                // if (selectedOrganization!.userRegistrationRequired!) {

                // } else {
                //   final QueryResult result =
                //       await databaseFunctions.gqlAuthMutation(
                //     queries.sendMembershipRequest(selectedOrganization!.id!),
                //   );
                //   final sendMembershipRequest = result
                //       .data!['sendMembershipRequest'] as Map<String, dynamic>;
                //   final OrgInfo membershipRequest = OrgInfo.fromJson(
                //     sendMembershipRequest['organization']
                //         as Map<String, dynamic>,
                //   );
                //   userConfig.updateUserMemberRequestOrg([membershipRequest]);
                //   navigationService.pop();
                //   navigationService.removeAllAndPush(
                //     Routes.waitingScreen,
                //     Routes.splashScreen,
                //   );
                // }
                await storingCredentialsInSecureStorage();
              }
            }
          }
        },
        onActionException: (e) async {
          print(e);
          navigationService.showTalawaErrorSnackBar(
            'Something went wrong',
            MessageType.error,
          );
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

  @override
  void dispose() {
    urlController.dispose();
    urlFocus.dispose();
    confirmPassword.dispose();
    confirmFocus.dispose();
    firstName.dispose();
    lastName.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
