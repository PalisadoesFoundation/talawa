import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// SelectContactViewModel class have different functions to interact with model.
///
/// Functions include:
/// * `getCurrentOrgUsersList` : to get all users of current organization.
class SelectContactViewModel extends BaseModel {
  late OrganizationService _organizationService;

  /// orgMembersList is used to store all users of current organization.
  late List<User> orgMembersList = [];

  /// This function initializes the [SelectContactViewModel] class.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    _organizationService = locator<OrganizationService>();
  }

  /// function to get all users of current organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> getCurrentOrgUsersList() async {
    try {
      setState(ViewState.busy);
      if (orgMembersList.isEmpty) {
        orgMembersList = await _organizationService
            .getOrgMembersList(userConfig.currentOrg.id!);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error fetching organization users: $e');
      // Set empty list on error
      orgMembersList = [];
    } finally {
      setState(ViewState.idle);
      notifyListeners();
    }
  }
}
