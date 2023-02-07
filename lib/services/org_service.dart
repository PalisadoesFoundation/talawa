import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/queries.dart';

/// OrganizationService class provides the in the context of organizations.
///
/// Services include:
/// * `getOrgMembersList` : to get all organizations members
class OrganizationService {
  // constructor
  OrganizationService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }
  late DataBaseMutationFunctions _dbFunctions;

  /// This function fetch and returns the list of organization members.
  ///
  /// params:
  /// * [orgId] : id of the organization for which members list need be fetched.
  Future<List<User>> getOrgMembersList(String orgId) async {
    final String _query = Queries().fetchOrgDetailsById(orgId);
    // fetching from database using graphQL mutations.
    final result = await _dbFunctions.gqlAuthMutation(_query);
    final List _orgMembersResult =
        result.data['organizations'][0]['members'] as List;
    final List<User> _orgMembersList = [];
    _orgMembersResult.forEach((jsonElement) {
      final User member =
          User.fromJson(jsonElement as Map<String, dynamic>, fromOrg: true);
      _orgMembersList.add(member);
    });

    // return list
    return _orgMembersList;
  }
}
