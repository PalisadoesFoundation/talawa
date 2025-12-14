import 'dart:async';
import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

/// CustomDrawerViewModel class helps to serve the data and to react to user's input
/// for Custom Dialog Widget.
///
/// Functions include:
/// * `switchOrg`
/// * `isPresentinSwitchableOrg`
/// * `setSelectedOrganizationName`
class CustomDrawerViewModel extends BaseModel {
  /// Scroll controller for managing scrolling behavior.
  final ScrollController controller = ScrollController();

  late User _currentUser;
  late List<OrgInfo> _switchAbleOrg;
  bool _disposed = false;
  OrgInfo? _selectedOrg;
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
  /// * `homeModel`: instance of MainScreenViewModel.
  /// * `context`: instance of BuildContext.
  void initialize(MainScreenViewModel homeModel, BuildContext context) {
    _currentOrganizationStreamSubscription =
        userConfig.currentOrgInfoStream.listen(
      (updatedOrganization) {
        setSelectedOrganizationName(updatedOrganization);
      },
    );

    _currentUser = userConfig.currentUser;
    _selectedOrg = userConfig.currentOrg;
    _switchAbleOrg = _currentUser.joinedOrganizations ?? [];
  }

  /// Switches the organization to the specified `switchToOrg`.
  void switchOrg(OrgInfo switchToOrg) {
    if ((selectedOrg == switchToOrg) && isPresentinSwitchableOrg(switchToOrg)) {
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

  /// Checks whether `switchToOrg` is present in the switchable organization list.
  bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
    return _switchAbleOrg.any((org) => org.id == switchToOrg.id);
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  /// Returns an exit alert dialog.
  CustomAlertDialog exitAlertDialog(BuildContext context) {
    return CustomAlertDialog(
      key: const Key("Exit?"),
      reverse: true,
      dialogSubTitle: 'Are you sure you want to exit this organization?',
      successText: 'Exit',
      success: () {
        userConfig.exitCurrentOrg();
        navigationService.pop();
        Scaffold.of(context).closeDrawer();
      },
    );
  }

  /// Updates the selected organization.
  void setSelectedOrganizationName(OrgInfo updatedOrganization) {
    if (_disposed) return;

    if (_selectedOrg != updatedOrganization) {
      _selectedOrg = updatedOrganization;
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
