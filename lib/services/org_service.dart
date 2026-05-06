import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/app_logger.dart';
import 'package:talawa/utils/queries.dart';

/// Provides the Services in the context of organizations.
///
/// Services include:
/// * `getOrgMembersList` : to get all organizations members
class OrganizationService {
  // constructor
  OrganizationService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }
  late DataBaseMutationFunctions _dbFunctions;

  /// Retrieves a list of organization members.
  ///
  /// **params**:
  /// * `orgId`: The ID of the organization to fetch members from.
  ///
  /// **returns**:
  /// * `Future<List<User>>`: A promise that will be fulfilled
  /// with the list of organization members.
  Future<List<User>> getOrgMembersList(String orgId) async {
    try {
      if (appConfig.isDemoMode) return [];

      final String query = Queries().fetchUsersByOrganizationId(orgId);
      // fetching from database using graphQL query.
      final result = await _dbFunctions.gqlAuthQuery(query);

      // Some backends may return partial data with non-fatal GraphQL errors.
      // Only log the full exception when we have no usable data (avoids noisy
      // ServerException dumps when members list is still returned).
      final hasMembersData =
          result.data != null && result.data!['usersByOrganizationId'] != null;
      if (result.hasException && !hasMembersData) {
        AppLog.warn(
          'GraphQL Exception while fetching org members: ${result.exception}',
        );
      } else if (result.hasException && hasMembersData) {
        AppLog.info(
          'Org members: partial response (some fields had errors; members list used)',
        );
      }

      if (result.data == null ||
          result.data!['usersByOrganizationId'] == null) {
        AppLog.info('No data received from usersByOrganizationId query');
        return [];
      }

      final List usersResult = result.data!['usersByOrganizationId'] as List;
      AppLog.info(
        'OrganizationService: getOrgMembersList: usersResult: $usersResult',
      );

      final List<User> orgMembersList = [];

      for (final jsonElement in usersResult) {
        try {
          final User member = User.fromJson(
            jsonElement as Map<String, dynamic>,
          );
          orgMembersList.add(member);
        } catch (e) {
          AppLog.error('Failed to parse user', e);
          continue;
        }
      }

      return orgMembersList;
    } catch (e) {
      AppLog.error('getOrgMembersList failed', e);
      return [];
    }
  }
}
