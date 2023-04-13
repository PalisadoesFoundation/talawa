// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// CustomDrawerViewModel class helps to serve the data and
/// to react to user's input for Custom Dialog Widget.
///
/// Functions include:
/// * `switchOrg`
/// * `isPresentinSwitchableOrg`
/// * `setSelectedOrganizationName`
class CustomDrawerViewModel extends BaseModel {
  // getters
  final ScrollController controller = ScrollController();
  final List<TargetFocus> targets = [];
  late TutorialCoachMark tutorialCoachMark;
  late User _currentUser;
  late List<OrgInfo> _switchAbleOrg;
  bool _disposed = false;
  OrgInfo? _selectedOrg;
  StreamSubscription? _currentOrganizationStreamSubscription;
  OrgInfo? get selectedOrg => _selectedOrg;
  // ignore: unnecessary_getters_setters
  List<OrgInfo> get switchAbleOrg => _switchAbleOrg;
  set switchAbleOrg(List<OrgInfo> switchableOrg) =>
      _switchAbleOrg = switchableOrg;

  // initializer
  void initialize(MainScreenViewModel homeModel, BuildContext context) {
    _currentOrganizationStreamSubscription =
        userConfig.currentOrgInfoStream.listen(
      (updatedOrganization) {
        setSelectedOrganizationName(updatedOrganization);
      },
    );
    _currentUser = userConfig.currentUser;
    _selectedOrg = userConfig.currentOrg;
    _switchAbleOrg = _currentUser.joinedOrganizations!;
  }

  /// This function switch the current organization to another organization,
  /// if the organization(want switch to) is present.
  void switchOrg(OrgInfo switchToOrg) {
    // if `selectedOrg` is equal to `switchOrg` and `switchToOrg` present or not.
    if (selectedOrg == switchToOrg && isPresentinSwitchableOrg(switchToOrg)) {
      // _navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        '${switchToOrg.name} already selected',
        MessageType.warning,
      );
    } else {
      userConfig.saveCurrentOrgInHive(switchToOrg);
      setSelectedOrganizationName(switchToOrg);
      navigationService.showTalawaErrorSnackBar(
        'Switched to ${switchToOrg.name}',
        MessageType.info,
      );
    }
    navigationService.pop();
  }

  /// This function checks `switchOrg` is present in the `switchAbleOrg`.
  ///
  /// params:
  /// * [switchToOrg] : `OrgInfo` type of organization want to switch into.
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

  /// This function switches the current organization to new organization.
  ///
  /// params:
  /// * [updatedOrganization] : `OrgInfo` type, new organization.
  void setSelectedOrganizationName(OrgInfo updatedOrganization) {
    // if current and updated organization are not same.
    if (_selectedOrg != updatedOrganization) {
      _selectedOrg = updatedOrganization;
      // update in `UserConfig` variable.
      userConfig.currentOrgInfoController.add(_selectedOrg!);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _currentOrganizationStreamSubscription?.cancel();
    super.dispose();
  }
}
