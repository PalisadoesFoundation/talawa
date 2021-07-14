import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

class LoginViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();
  late List<Map<String, dynamic>> greeting;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  AutovalidateMode validate = AutovalidateMode.disabled;
  bool hidePassword = true;

  initialize() {
    greeting = [
      {
        'text': "We're ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'Glad ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24)
      },
      {
        'text': "you're ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'Back ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24)
      },
    ];
  }

  login() async {
    emailFocus.unfocus();
    passwordFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      navigationService
          .pushDialog(const CustomProgressDialog(key: Key('LoginProgress')));
      databaseFunctions.init();
      try {
        final result = await databaseFunctions
            .gqlNonAuthMutation(queries.loginUser(email.text, password.text));
        navigationService.pop();
        if (result != null) {
          final User loggedInUser =
              User.fromJson(result.data!['login'] as Map<String, dynamic>);
          userConfig.updateUser(loggedInUser);
          if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
            navigationService.removeAllAndPush('/waiting', '/');
          } else {
            userConfig.saveCurrentOrgInHive(
                userConfig.currentUser.joinedOrganizations![0]);
            navigationService.removeAllAndPush('/mainScreen', '/');
          }
        }
      } on Exception catch (e) {
        print('here');
        print(e);
      }
    }
  }
}
