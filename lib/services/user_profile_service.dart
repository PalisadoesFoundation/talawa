import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';

class UserProfileService {
  Future<QueryResult<Object?>> updateUserProfile(
      Map<String, dynamic>? variables) {
    return databaseFunctions.gqlAuthMutation(
      queries.updateUserProfile(),
      variables: variables,
    );
  }

  Future<QueryResult<Object?>> getUserProfileInfo(User user) async {
    final QueryResult result = await databaseFunctions.gqlAuthQuery(
      queries.fetchUserInfo,
      variables: {'id': user.id},
    );
    return result;
  }
}
