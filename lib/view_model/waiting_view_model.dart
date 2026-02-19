import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ViewModel for the "Waiting" section.
///
/// Responsibilities:
/// - Track pending organization membership requests
/// - Navigate to settings or join organization screens
/// - Fetch organization info from backend
class WaitingViewModel extends BaseModel {
  /// List of organization IDs for which the user's membership requests are pending.
  late List<String> pendingRequestOrg;

  /// Initializes the ViewModel.
  ///
  /// Loads the user's pending organization requests.
  void initialise() {
    pendingRequestOrg = userConfig.currentUser.membershipRequests ?? [];
  }

  /// Navigates to the app settings page.
  void settingPageNavigation() {
    navigationService.pushScreen(Routes.appSettings);
  }

  /// Fetches organization information by its ID.
  ///
  /// **params**:
  /// - `orgId`: ID of the organization
  ///
  /// **returns**:
  /// - `Future<OrgInfo?>`: Returns `OrgInfo` if successful, otherwise `null`
  Future<OrgInfo?> getOrgInfo(String orgId) async {
    try {
      final QueryResult result =
          await databaseFunctions.gqlAuthQuery(queries.fetchOrgById(orgId));

      if (result.hasException) {
        debugPrint('GraphQL exception: ${result.exception.toString()}');
        navigationService.showTalawaErrorSnackBar(
          'Failed to fetch organization info. Please try again later.',
          MessageType.error,
        );
        return null;
      }

      final orgData = result.data?['organization'] as Map<String, dynamic>?;

      if (orgData == null) return null;

      return OrgInfo.fromJson(orgData);
    } catch (e) {
      debugPrint('Error fetching org info: $e');
      navigationService.showTalawaErrorSnackBar(
        'Some error occurred. Please try again later.',
        MessageType.error,
      );
      return null;
    }
  }

  /// Navigates to the join organization screen.
  void joinOrg() {
    navigationService.pushScreen(
      Routes.joinOrg,
      arguments: '-1',
    );
  }
}
