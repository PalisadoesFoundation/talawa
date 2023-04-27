// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// SignupDetailsViewModel class helps to interact with model to serve data
/// and react to user's input for Sign Up Details section.
///
/// Methods include:
/// * `signUp`
class SignupDetailsViewModel extends BaseModel {
  // variables
  final formKey = GlobalKey<FormState>();
  late List<Map<String, dynamic>> greeting;
  late OrgInfo selectedOrganization;
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  AutovalidateMode validate = AutovalidateMode.disabled;
  FocusNode confirmFocus = FocusNode();
  bool hidePassword = true;

  // initialiser
  void initialise(OrgInfo org) {
    selectedOrganization = org;
    // greeting message
    greeting = [
      {
        'text': "Let's ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': 'get ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': "you ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': 'SignUp ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24)
      },
    ];
  }

  /// This function is used to sign up the user into the application by passing the data to database query.
  /// The function uses `gqlNonAuthMutation` method provided by `databaseFunctions` services.
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
            password.text,
          ),
        );
        navigationService.pop();
        if (result != null) {
          final User signedInUser =
              User.fromJson(result.data!['signUp'] as Map<String, dynamic>);
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

                final List<OrgInfo>? joinedOrg = (result
                            .data!['joinPublicOrganization']
                        ['joinedOrganizations'] as List<dynamic>?)
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

                final OrgInfo membershipRequest = OrgInfo.fromJson(
                  result.data!['sendMembershipRequest']['organization']
                      as Map<String, dynamic>,
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
