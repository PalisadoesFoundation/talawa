import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

class SignupDetailsViewModel extends BaseModel {
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

  initialise(OrgInfo org) {
    selectedOrganization = org;
    greeting = [
      {
        'text': "Let's ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'get ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': "you ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'SignUp ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24)
      },
    ];
  }

  signUp() async {
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
                firstName.text, lastName.text, email.text, password.text));
        if (result != null) {
          final User signedInUser =
              User.fromJson(result.data!['signUp'] as Map<String, dynamic>);
          final bool userSaved = await userConfig.updateUser(signedInUser);
          final bool tokenRefreshed = await graphqlConfig.getToken() as bool;
          if (userSaved && tokenRefreshed) {
            if (selectedOrganization.isPublic!) {
              try {
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(
                            queries.joinOrgById(selectedOrganization.id!))
                        as QueryResult;

                final List<OrgInfo>? joinedOrg = (result
                            .data!['joinPublicOrganization']
                        ['joinedOrganizations'] as List<dynamic>?)
                    ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
                    .toList();
                userConfig.updateUserJoinedOrg(joinedOrg!);
                userConfig.saveCurrentOrgInHive(
                    userConfig.currentUser.joinedOrganizations![0]);
                navigationService.removeAllAndPush('/mainScreen', '/');
              } on Exception catch (e) {
                print(e);
                navigationService.showSnackBar('SomeThing went wrong');
              }
            } else {
              try {
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(queries
                            .sendMembershipRequest(selectedOrganization.id!))
                        as QueryResult;

                final OrgInfo membershipRequest = OrgInfo.fromJson(
                    result.data!['sendMembershipRequest']['organization']
                        as Map<String, dynamic>);
                userConfig.updateUserMemberRequestOrg([membershipRequest]);
                navigationService.pop();
                navigationService.removeAllAndPush('/waiting', '/');
              } on Exception catch (e) {
                print(e);
                navigationService.showSnackBar('SomeThing went wrong');
              }
            }
          }
        }
      } on Exception catch (e) {
        print(e);
        navigationService.showSnackBar('SomeThing went wrong');
      }
    }
  }
}
