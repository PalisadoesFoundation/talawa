import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CustomDrawerViewModel extends BaseModel {
  final ScrollController controller = ScrollController();
  final List<TargetFocus> targets = [];
  late TutorialCoachMark tutorialCoachMark;
  late User _currentUser;
  late List<OrgInfo> _switchAbleOrg;
  late OrgInfo _selectedOrg;
  late StreamSubscription _currentOrganizationStreamSubscription;
  OrgInfo get selectedOrg => _selectedOrg;
  List<OrgInfo> get switchAbleOrg => _switchAbleOrg;

  initialize(MainScreenViewModel homeModel, BuildContext context) {
    _currentOrganizationStreamSubscription = userConfig.currentOrfInfoStream
        .listen((updatedOrganization) =>
            setSelectedOrganizationName(updatedOrganization));
    _currentUser = userConfig.currentUser;
    _selectedOrg = userConfig.currentOrg;
    _switchAbleOrg = _currentUser.joinedOrganizations!;
  }

  switchOrg(OrgInfo switchToOrg) {
    if (selectedOrg == switchToOrg) {
      // _navigationService.pop();
      navigationService.showSnackBar('${switchToOrg.name} already selected');
    } else {
      userConfig.saveCurrentOrgInHive(switchToOrg);
      navigationService.showSnackBar('Switched to ${switchToOrg.name}');
    }
    navigationService.pop();
  }

  setSelectedOrganizationName(OrgInfo updatedOrganization) {
    _selectedOrg = updatedOrganization;
    notifyListeners();
  }

  @override
  void dispose() {
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }
}
