import 'package:flutter/material.dart';
import 'package:talawa/routing_constants.dart';
import 'package:talawa/services/preferences.dart';

class GraphAPI with ChangeNotifier {
  //clears token and pages stack
  Future<void> logout(BuildContext context) async {
    await Preferences.clearUser();
    Navigator.pushNamedAndRemoveUntil(
      context,
      routes.LoginPageRoute,
      (r) => false,
    );
  }
}
