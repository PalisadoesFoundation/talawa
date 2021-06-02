import 'package:flutter/material.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../locator.dart';

class SignupDetailsViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  final formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode confirmFocus = FocusNode();
  bool hidePassword = true;
  AutovalidateMode validate = AutovalidateMode.disabled;

  initialise() {
    greeting = [
      {
        'text': "Let's ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'get ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': "you ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'SignUp ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24)
      },
    ];
  }

  next() {
    FocusScope.of(locator<NavigationService>().navigatorKey.currentContext!)
        .unfocus();
    setState(ViewState.busy);
    validate = AutovalidateMode.always;
    setState(ViewState.idle);
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      print('tapped');
      locator<DataBaseMutationFunctions>()
          .signup(firstName.text, lastName.text, email.text, password.text);
    }
  }
}
