import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';

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
      if (MainScreenViewModel.demoMode) return [];

      final String query = Queries().fetchUsersByOrganizationId(orgId);
      // fetching from database using graphQL query.
      final result = await _dbFunctions.gqlAuthQuery(query);

      // Check if there are any errors
      if (result.hasException) {
        debugPrint('GraphQL Exception: ${result.exception}');
        return [];
      }

      // Check if data exists and is not null
      if (result.data == null ||
          result.data!['usersByOrganizationId'] == null) {
        debugPrint('No data received from usersByOrganizationId query');
        return [];
      }

      final List usersResult = result.data!['usersByOrganizationId'] as List;
      debugPrint(
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
          debugPrint('Error parsing user data: $e');
          // Continue with other users even if one fails
          continue;
        }
      }

      return orgMembersList;
    } catch (e) {
      debugPrint('Error in getOrgMembersList: $e');
      return [];
    }
  }
}
