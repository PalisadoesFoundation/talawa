import 'package:flutter/material.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

class SignupDetailsViewModel extends BaseModel {
  final databaseService = locator<DataBaseMutationFunctions>();
  final navigatorService = locator<NavigationService>();
  final userConfig = locator<UserConfig>();
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
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'get ',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': "you ",
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'SignUp ',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24)
      },
    ];
  }

  next() async {
    FocusScope.of(navigatorService.navigatorKey.currentContext!).unfocus();
    setState(ViewState.busy);
    validate = AutovalidateMode.always;
    setState(ViewState.idle);
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      databaseService.init();
      final bool signUpSuccess = await databaseService.signup(
          firstName.text, lastName.text, email.text, password.text);
      if (signUpSuccess) {
        if (selectedOrganization.isPublic!) {
          final bool successJoin =
              await databaseService.joinPublicOrg(selectedOrganization.id!);
          if (successJoin) {
            userConfig.currentUser.print();
            userConfig.saveCurrentOrgInHive(
                userConfig.currentUser.joinedOrganizations![0]);
            navigatorService.removeAllAndPush('/mainScreen', '/');
          } else {
            navigatorService.showSnackBar('SomeThing went wrong');
          }
        } else {
          final bool successRequest = await databaseService
              .sendMembershipRequest(selectedOrganization.id!);
          if (successRequest) {
            userConfig.currentUser.print();
            navigatorService.removeAllAndPush('/waiting', '/');
          } else {
            navigatorService.showSnackBar('SomeThing went wrong');
          }
        }
      }
    }
  }
}
