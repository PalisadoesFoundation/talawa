//flutter packages are called here
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:talawa/services/preferences.dart';

class OrgController with ChangeNotifier {
  final Preferences _pref = Preferences();

  Future<void> setNewOrg(
      BuildContext context, String newOrgId, String newOrgName) async {
    await Preferences.removeOrg();
    await _pref.saveCurrentOrgId(newOrgId);
    await _pref.saveCurrentOrgName(newOrgName);
  }
}
