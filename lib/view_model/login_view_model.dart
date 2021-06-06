import 'package:flutter/material.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/locator.dart';

class LoginViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  AutovalidateMode validate = AutovalidateMode.disabled;

  initialize() {
    greeting = [
      {
        'text': "We're ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'Glad ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24)
      },
      {
        'text': "you're ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'Back ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
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
      final bool loginSuccess = await locator<DataBaseMutationFunctions>()
          .login(email.text, password.text);
      if (loginSuccess) {
        if (locator<UserConfig>().currentUser!.joinedOrganizations!.isEmpty) {
          locator<NavigationService>().removeAllAndPush('/waiting', '/');
        } else {
          locator<NavigationService>().removeAllAndPush('/mainScreen', '/');
        }
      }
    }
  }
}
