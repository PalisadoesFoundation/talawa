import 'dart:async';
import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
<<<<<<< HEAD
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
=======
>>>>>>> upstream/develop

/// CustomDrawerViewModel class helps to serve the data and to react to user's input for Custom Dialog Widget.
///
/// Functions include:
/// * `switchOrg`
/// * `isPresentinSwitchableOrg`
/// * `setSelectedOrganizationName`
class CustomDrawerViewModel extends BaseModel {
<<<<<<< HEAD
  // getters

  /// Scroll controller for managing scrolling behavior.
  final ScrollController controller = ScrollController();

  /// List of TargetFocus objects used for tutorial coaching.
  final List<TargetFocus> targets = [];

  /// Instance of TutorialCoachMark responsible for providing tutorial guidance.
  late TutorialCoachMark tutorialCoachMark;
=======
  /// Scroll controller for managing scrolling behavior.
  final ScrollController controller = ScrollController();

>>>>>>> upstream/develop
  late User _currentUser;
  late List<OrgInfo> _switchAbleOrg;
  bool _disposed = false;
  OrgInfo? _selectedOrg;
<<<<<<< HEAD
  StreamSubscription? _currentOrganizationStreamSubscription;

  //// Getter method to retrieve the selected organization.
  OrgInfo? get selectedOrg => _selectedOrg;

  /// Getter method to retrieve the switchAble organization.
  // ignore: unnecessary_getters_setters
  List<OrgInfo> get switchAbleOrg => _switchAbleOrg;

  /// Setter method for switchAble organization.
  set switchAbleOrg(List<OrgInfo> switchableOrg) =>
      _switchAbleOrg = switchableOrg;

  /// initializer.
  ///
  /// **params**:
  /// * `homeModel`: instance of MainScreenViewModel.
  /// * `context`: instance of BuildContext.
=======
  StreamSubscription<OrgInfo>? _currentOrganizationStreamSubscription;

  /// Getter method to retrieve the selected organization.
  OrgInfo? get selectedOrg => _selectedOrg;

  /// Getter method to retrieve the switchable organizations.
  // ignore: unnecessary_getters_setters
  List<OrgInfo> get switchAbleOrg => _switchAbleOrg;

  /// Setter method for switchable organizations.
  set switchAbleOrg(List<OrgInfo> value) => _switchAbleOrg = value;

  /// Initializes the view model.
  ///
  /// **params**:
  /// * `homeModel`: Instance of MainScreenViewModel
  /// * `context`: BuildContext for the current widget
>>>>>>> upstream/develop
  ///
  /// **returns**:
  ///   None
  void initialize(MainScreenViewModel homeModel, BuildContext context) {
    _currentOrganizationStreamSubscription =
        userConfig.currentOrgInfoStream.listen(
      (updatedOrganization) {
        setSelectedOrganizationName(updatedOrganization);
      },
    );
<<<<<<< HEAD
=======

>>>>>>> upstream/develop
    _currentUser = userConfig.currentUser;
    _selectedOrg = userConfig.currentOrg;
    _switchAbleOrg = _currentUser.joinedOrganizations ?? [];
  }

<<<<<<< HEAD
  /// This function switches the organization to the specified `switchToOrg`.
  ///
  /// If `selectedOrg` is equal to `switchToOrg` and `switchToOrg` is present, a warning message is displayed using a custom Snackbar.
  /// Otherwise, it saves the `switchToOrg` as the current organization, updates the selected organization name,
  /// and displays an informational message using a custom Snackbar.
  ///
  /// **params**:
  /// * `switchToOrg`: The organization to switch to.
=======
  /// Switches the organization to the specified `switchToOrg`.
  ///
  /// **params**:
  /// * `switchToOrg`: The organization to switch to
>>>>>>> upstream/develop
  ///
  /// **returns**:
  ///   None
  void switchOrg(OrgInfo switchToOrg) {
<<<<<<< HEAD
    // if `selectedOrg` is equal to `switchOrg` and `switchToOrg` present or not.
    if ((selectedOrg == switchToOrg) &&
        (isPresentinSwitchableOrg(switchToOrg))) {
      // _navigationService.pop();
=======
    if ((selectedOrg == switchToOrg) && isPresentinSwitchableOrg(switchToOrg)) {
>>>>>>> upstream/develop
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

<<<<<<< HEAD
  /// This function checks `switchOrg` is present in the `switchAbleOrg`.
  ///
  /// **params**:
  /// * `switchToOrg`: `OrgInfo` type of organization want to switch into.
  ///
  /// **returns**:
  /// * `bool`: returns true if switchToOrg is in switchAbleOrg list.
  bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
    var isPresent = false;
    for (final OrgInfo orgs in switchAbleOrg) {
      if (orgs.id == switchToOrg.id) {
        isPresent = true;
      }
    }
    return isPresent;
=======
  /// Checks whether `switchToOrg` is present in the switchable organization list.
  ///
  /// **params**:
  /// * `switchToOrg`: The organization to check for presence
  ///
  /// **returns**:
  /// * `bool`: true if organization is present, false otherwise
  bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
    return _switchAbleOrg.any((org) => org.id == switchToOrg.id);
>>>>>>> upstream/develop
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

<<<<<<< HEAD
  /// returns an exit alert dialog.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `CustomAlertDialog`: returns customAlertDialogBox.
  CustomAlertDialog exitAlertDialog() {
=======
  /// Returns an exit alert dialog.
  ///
  /// **params**:
  /// * `context`: BuildContext for creating the dialog
  ///
  /// **returns**:
  /// * `CustomAlertDialog`: The configured exit alert dialog
  CustomAlertDialog exitAlertDialog(BuildContext context) {
>>>>>>> upstream/develop
    return CustomAlertDialog(
      key: const Key("Exit?"),
      reverse: true,
      dialogSubTitle: 'Are you sure you want to exit this organization?',
      successText: 'Exit',
<<<<<<< HEAD
      success: () {},
    );
  }

  /// This function switches the current organization to new organization.
  ///
  /// **params**:
  /// * `updatedOrganization`: `OrgInfo` type, new organization.
=======
      success: () {
        userConfig.exitCurrentOrg();
        navigationService.pop();
        Scaffold.of(context).closeDrawer();
      },
    );
  }

  /// Updates the selected organization.
  ///
  /// **params**:
  /// * `updatedOrganization`: The new organization to set as selected
>>>>>>> upstream/develop
  ///
  /// **returns**:
  ///   None
  void setSelectedOrganizationName(OrgInfo updatedOrganization) {
<<<<<<< HEAD
    // if current and updated organization are not same.
    if (_selectedOrg != updatedOrganization) {
      _selectedOrg = updatedOrganization;
      // update in `UserConfig` variable.
=======
    if (_disposed) return;

    if (_selectedOrg != updatedOrganization) {
      _selectedOrg = updatedOrganization;
>>>>>>> upstream/develop
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
