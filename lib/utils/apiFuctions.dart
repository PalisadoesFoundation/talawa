import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/GraphAPI.dart';

class ApiFunctions {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  GraphAPI _graphAPI = GraphAPI();
  String e =
      "Access Token has expired. Please refresh session.: Undefined location";

  Future<Map> gqlquery(String query) async {
    GraphQLClient _client = graphQLConfiguration.authClient();

    const int nRepositories = 0;

    final QueryOptions options = QueryOptions(
      documentNode: gql(query),
      variables: <String, dynamic>{
        // 'nRepositories': nRepositories,
      },
    );

    final QueryResult result = await _client.query(options);
    if (result.hasException && result.exception.toString().substring(16) == e) {
      _graphAPI.getNewToken();
      gqlquery(query);
    } else if (result.hasException) {
      print(result.exception);
    } else {
      return result.data;
    }
  }

  Future<dynamic> gqlmutation(String mutation) async {
    GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(mutation),
    ));

    if (result.hasException && result.exception.toString().substring(16) == e) {
      _graphAPI.getNewToken();
      gqlmutation(mutation);
    } else if (result.hasException) {
      print(result.exception);
    } else {
      return result.data;
    }
  }
}
