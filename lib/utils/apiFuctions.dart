import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';

class ApiFunctions {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  AuthController _authController = AuthController();

  String userAuthError = "User is not authenticated: Undefined location";


  //this is the query used to get the token
  // ignore: missing_return
  Future<Map> gqlquery(String query) async {
    GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryOptions options = QueryOptions(
      documentNode: gql(query),
      variables: <String, dynamic>{
      },
    );

    final QueryResult result = await _client.query(options);
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      gqlquery(query);
    } else if (result.hasException) {
      print(result.exception);
    } else {
      return result.data;
    }
  }


  //function to mutate the query
  Future<dynamic> gqlmutation(String mutation) async {
    GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(mutation),
    ));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
     return gqlmutation(mutation);
    } else if (result.hasException) {
      print(result.exception);
    } else {
      return result.data;
    }
  }
}
