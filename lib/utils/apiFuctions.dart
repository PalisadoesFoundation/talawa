import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/utils/GQLClient.dart';

class ApiFunctions {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  Future<Map> gqlquery(String querry) async {
    GraphQLClient _client = graphQLConfiguration.authClient();

    const int nRepositories = 0;

    final QueryOptions options = QueryOptions(
      documentNode: gql(querry),
      variables: <String, dynamic>{
        // 'nRepositories': nRepositories,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    } 
      return result.data;
    
  }

  Future<dynamic> gqlmutation(String mutation) async {
    GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result =
        await _client.mutate(MutationOptions(documentNode: gql(mutation),
        
        ));
    if (result.hasException) {
      print(result.exception);
    } else {
      return result.data;
    }
  }
}
