import 'dart:async';
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
  bool _disposed = false;
  OrgInfo? _selectedOrg;
  StreamSubscription? _currentOrganizationStreamSubscription;
  OrgInfo? get selectedOrg => _selectedOrg;
  Future<StreamSubscription?> get currentOrganizationStreamSubscription async =>
      _currentOrganizationStreamSubscription;
  // ignore: unnecessary_getters_setters
  List<OrgInfo> get switchAbleOrg => _switchAbleOrg;
  set switchAbleOrg(List<OrgInfo> switchableOrg) =>
      _switchAbleOrg = switchableOrg;

  initialize(MainScreenViewModel homeModel, BuildContext context) {
    _currentOrganizationStreamSubscription =
        userConfig.currentOrfInfoStream.listen(
      (updatedOrganization) {
        setSelectedOrganizationName(updatedOrganization);
      },
    );
    _currentUser = userConfig.currentUser;
    _selectedOrg = userConfig.currentOrg;
    _switchAbleOrg = _currentUser.joinedOrganizations!;
  }

  switchOrg(OrgInfo switchToOrg) {
    if (selectedOrg == switchToOrg && isPresentinSwitchableOrg(switchToOrg)) {
      // _navigationService.pop();
      navigationService.showSnackBar('${switchToOrg.name} already selected');
    } else {
      userConfig.saveCurrentOrgInHive(switchToOrg);
      setSelectedOrganizationName(switchToOrg);
      navigationService.showSnackBar('Switched to ${switchToOrg.name}');
    }
    navigationService.pop();
  }

  bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
    var isPresent = false;
    for (final OrgInfo orgs in switchAbleOrg) {
      if (orgs.id == switchToOrg.id) {
        isPresent = true;
      }
    }
    return isPresent;
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  setSelectedOrganizationName(OrgInfo updatedOrganization) {
    if (_selectedOrg != updatedOrganization) {
      _selectedOrg = updatedOrganization;
      userConfig.currentOrgInfoController.add(_selectedOrg!);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    print("temp");
    _disposed = true;
    _currentOrganizationStreamSubscription?.cancel();
    super.dispose();
  }
}
