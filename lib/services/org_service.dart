import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/queries.dart';

class OrganizationService {
  OrganizationService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }
  late DataBaseMutationFunctions _dbFunctions;

  Future<List<User>> getOrgMembersList(String orgId) async {
    final String _query = Queries().fetchOrgDetailsById(orgId);
    final result = await _dbFunctions.gqlAuthMutation(_query);
    final List _orgMembersResult =
        result.data['organizations'][0]['members'] as List;
    final List<User> _orgMembersList = [];
    _orgMembersResult.forEach((jsonElement) {
      final User member =
          User.fromJson(jsonElement as Map<String, dynamic>, fromOrg: true);
      _orgMembersList.add(member);
    });

    return _orgMembersList;
  }
}
