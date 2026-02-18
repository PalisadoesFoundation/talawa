import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';

/// Service class for handling user profile operations, including updating and retrieving user profile information.
class UserProfileService {
  /// Updates the user profile using a GraphQL mutation.
  ///
  /// **params**:
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///   If `null`, the mutation is performed without additional variables.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.
  Future<QueryResult<Object?>> updateUserProfile(
    Map<String, dynamic>? variables,
  ) {
    return databaseFunctions.gqlAuthMutation(
      queries.updateUserProfile(),
      variables: variables,
    );
  }

  /// Retrieves user profile information using a GraphQL query.
  ///
  /// **params**:
  /// * `user`: An instance of `User` representing the user whose profile information is to be fetched.
  ///   The user's ID is used as a variable for the GraphQL query.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL query.
  Future<QueryResult<Object?>> getUserProfileInfo(User user) async {
    final QueryResult result = await databaseFunctions.gqlAuthQuery(
      queries.fetchUserInfo(),
      variables: {'id': user.id},
    );
    return result;
  }
}
