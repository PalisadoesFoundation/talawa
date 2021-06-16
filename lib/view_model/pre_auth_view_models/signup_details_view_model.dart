import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

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

  next() async {
    FocusScope.of(navigationService.navigatorKey.currentContext!).unfocus();
    setState(ViewState.busy);
    validate = AutovalidateMode.always;
    setState(ViewState.idle);
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      databaseFunctions.init();
      final bool signUpSuccess = await databaseFunctions.signup(
          firstName.text, lastName.text, email.text, password.text);
      if (signUpSuccess) {
        if (selectedOrganization.isPublic!) {
          final bool successJoin =
              await databaseFunctions.joinPublicOrg(selectedOrganization.id!);
          if (successJoin) {
            userConfig.currentUser.print();
            userConfig.saveCurrentOrgInHive(
                userConfig.currentUser.joinedOrganizations![0]);
            navigationService.removeAllAndPush('/mainScreen', '/');
          } else {
            navigationService.showSnackBar('SomeThing went wrong');
          }
        } else {
          final bool successRequest = await databaseFunctions
              .sendMembershipRequest(selectedOrganization.id!);
          if (successRequest) {
            userConfig.currentUser.print();
            navigationService.removeAllAndPush('/waiting', '/');
          } else {
            navigationService.showSnackBar('SomeThing went wrong');
          }
        }
      }
    }
  }
}
