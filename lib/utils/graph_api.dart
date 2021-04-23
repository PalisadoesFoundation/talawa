import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';

class GraphAPI with ChangeNotifier {
  //clears token and pages stack
  Future<void> logout(BuildContext context) async {
    await Preferences.clearUser();
    Navigator.pushNamedAndRemoveUntil(
        context, UIData.loginPageRoute, (r) => false);
  }
}
