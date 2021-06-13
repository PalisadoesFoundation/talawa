import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';

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
      databaseFunctions.init();
      databaseFunctions.login(email.text, password.text);
    }
  }
}
