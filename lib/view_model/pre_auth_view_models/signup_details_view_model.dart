import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
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
  late OrgInfo selectedOrganization;

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

  /// Initializes the greeting message for a selected organization.
  ///
  /// **params**:
  /// * `org`: OrgInfo - the organization information to set as selected.
  ///
  /// **returns**:
  ///   None
  void initialise(OrgInfo org) {
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
  }

  /// Initiates the sign-up process.
  ///
  /// Handles the sign-up process by performing the following steps:
  /// 1. Unfocusing the current focus scope.
  /// 2. Setting the view state to `ViewState.busy`.
  /// 3. Setting validation mode to `AutovalidateMode.always`.
  /// 4. Setting the view state to `ViewState.idle`.
  /// 5. Validating the form using the form key.
  /// 6. If validation is successful, disabling auto-validation mode and initiating the sign-up.
  /// 7. Displaying a custom progress dialog during sign-up.
  /// 8. Initializing database functions.
  /// 9. Performing a GraphQL mutation to register the user with provided details (first name, last name, email, password).
  /// 10. Handling the result of the sign-up operation:
  ///     - Updating the current user with the received data.
  ///     - Refreshing the access token.
  ///     - Joining a public organization or sending a membership request based on the selected organization.
  ///
  /// In case of any exceptions during the sign-up process, this function catches and prints the error
  /// and displays a Talawa error snackbar with a corresponding message.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: a promise that indicates the completion of the sign-up process.
  Future<void> signUp() async {
    FocusScope.of(navigationService.navigatorKey.currentContext!).unfocus();
    setState(ViewState.busy);
    validate = AutovalidateMode.always;
    setState(ViewState.idle);
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      navigationService
          .pushDialog(const CustomProgressDialog(key: Key('SignUpProgress')));
      databaseFunctions.init();
      try {
        final result = await databaseFunctions.gqlNonAuthMutation(
          queries.registerUser(
            firstName.text,
            lastName.text,
            email.text,
            Encryptor.encryptString(
              password.text,
            ),
          ),
        );
        navigationService.pop();
        if (result != null) {
          final User signedInUser = User.fromJson(
            (result as QueryResult).data!['signUp'] as Map<String, dynamic>,
          );
          final bool userSaved = await userConfig.updateUser(signedInUser);
          final bool tokenRefreshed = await graphqlConfig.getToken() as bool;
          // if user successfully saved and access token is also generated.
          if (userSaved && tokenRefreshed) {
            // if the selected organization is public.
            if (selectedOrganization.isPublic!) {
              try {
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(
                  queries.joinOrgById(selectedOrganization.id!),
                ) as QueryResult;

                final joinPublicOrganization = result
                    .data!['joinPublicOrganization'] as Map<String, dynamic>;
                final List<OrgInfo>? joinedOrg = (joinPublicOrganization[
                        'joinedOrganizations'] as List<dynamic>?)
                    ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
                    .toList();
                userConfig.updateUserJoinedOrg(joinedOrg!);
                userConfig.saveCurrentOrgInHive(
                  userConfig.currentUser.joinedOrganizations![0],
                );
                navigationService.removeAllAndPush(
                  Routes.mainScreen,
                  Routes.splashScreen,
                  arguments:
                      MainScreenArgs(mainScreenIndex: 0, fromSignUp: true),
                );
              } on Exception catch (e) {
                print(e);
                navigationService.showTalawaErrorSnackBar(
                  'SomeThing went wrong',
                  MessageType.error,
                );
              }
            } else {
              try {
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(
                  queries.sendMembershipRequest(selectedOrganization.id!),
                ) as QueryResult;

                final sendMembershipRequest = result
                    .data!['sendMembershipRequest'] as Map<String, dynamic>;
                final OrgInfo membershipRequest = OrgInfo.fromJson(
                  sendMembershipRequest['organization'] as Map<String, dynamic>,
                );
                userConfig.updateUserMemberRequestOrg([membershipRequest]);
                navigationService.pop();
                navigationService.removeAllAndPush(
                  Routes.waitingScreen,
                  Routes.splashScreen,
                );
              } on Exception catch (e) {
                print(e);
                navigationService.showTalawaErrorSnackBar(
                  'SomeThing went wrong',
                  MessageType.error,
                );
              }
            }
          }
        }
      } on Exception catch (e) {
        print(e);
        navigationService.showTalawaErrorSnackBar(
          'SomeThing went wrong',
          MessageType.error,
        );
      }
    }
  }
}
