import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
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
    final String query = Queries().fetchOrgDetailsById(orgId);
    // fetching from database using graphQL mutations.
    final result = await _dbFunctions.gqlAuthMutation(query);
    final organizations =
        (result as QueryResult).data?['organizations'] as List;
    final List orgMembersResult =
        (organizations[0] as Map<String, dynamic>)['members'] as List;
    final List<User> orgMembersList = [];
    orgMembersResult.forEach((jsonElement) {
      final User member =
          User.fromJson(jsonElement as Map<String, dynamic>, fromOrg: true);
      orgMembersList.add(member);
    });

    // return list
    return orgMembersList;
  }
}
