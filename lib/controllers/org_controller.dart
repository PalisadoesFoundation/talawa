import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';

class OrgController with ChangeNotifier {
  Preferences _pref = Preferences();

  void setNewOrg(BuildContext context, String newOrgId) async {
    await Preferences.removeOrg();
    await _pref.saveCurrentOrgId(newOrgId);
    Navigator.pushNamedAndRemoveUntil(
        context, UIData.profilePage, (r) => false);
  }
}
