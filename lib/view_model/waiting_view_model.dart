import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// WaitingViewModel class helps to interact with model to serve data and react to user's input for Waiting section.
///
/// Methods include:
/// * `initialise`
/// * `settingPageNavigation`
/// * `getOrgInfo`
/// * `joinOrg`
class WaitingViewModel extends BaseModel {
  /// List of organization IDs for which the user's membership requests are pending.
  late List<String> pendingRequestOrg;

  /// initialiser.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    pendingRequestOrg = userConfig.currentUser.membershipRequests ?? [];
  }

  /// This function ends the session for the user or logout the user from the application.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void settingPageNavigation() {
    navigationService.pushScreen(
      Routes.appSettings,
    );
  }

  /// This function fetches the organization information based on the provided organization ID.
  ///
  /// **params**:
  /// * `orgId`: The ID of the organization to fetch information for.
  ///
  /// **returns**:
  /// * `Future<OrgInfo?>`: object containing the organization's information if found, otherwise `null`.
  Future<OrgInfo?> getOrgInfo(String orgId) async {
    try {
      final QueryResult joinedOrgData =
          await databaseFunctions.gqlAuthQuery(queries.fetchOrgById(orgId));

      if (joinedOrgData.hasException || joinedOrgData.data == null) {
        throw Exception(
            'Failed to fetch organization: ${joinedOrgData.exception}');
      }

      final OrgInfo orgInfo = OrgInfo.fromJson(
        joinedOrgData.data!['organization'] as Map<String, dynamic>,
      );
      return orgInfo;
    } on Exception catch (e) {
      debugPrint('Error fetching org info: $e');
      navigationService.showTalawaErrorSnackBar(
        'Some error occurred. Please try again later.',
        MessageType.error,
      );
    }
    return null;
  }

  /// This function navigates the user to the join organization screen.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void joinOrg() {
    navigationService.pushScreen(Routes.joinOrg, arguments: '-1');
  }
}
