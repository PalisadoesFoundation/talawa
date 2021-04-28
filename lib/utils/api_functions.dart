import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';

class ApiFunctions {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final AuthController _authController = AuthController();

  String userAuthError = "User is not authenticated: Undefined location";

  //this is the query used to get the token
  // ignore: missing_return
  Future<Map> gqlquery(String query) async {
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryOptions options = QueryOptions(
      documentNode: gql(query),
      variables: <String, dynamic>{},
    );

    final QueryResult result = await _client.query(options);
    if (result.hasException &&
        result.exception.toString().contains(accessTokenException)) {
      _authController.getNewToken();
      gqlquery(query);
    } else if (result.hasException &&
        result.exception
            .toString()
            .contains(refreshAccessTokenExpiredException)) {
      _authController.getNewToken();
      gqlquery(query);
    } else if (result.hasException) {
      print(result.exception);
      String message = "";
      if (result.exception.clientException != null) {
        message = result.exception.clientException.message;
      } else {
        message = result.exception.graphqlErrors.first.message;
      }

      return {"exception": message};
    } else {
      return result.data as Map<String, dynamic>;
    }
  }

  //function to mutate the query
  Future<dynamic> gqlmutation(String mutation) async {
    final GraphQLClient _client = graphQLConfiguration.authClient();
    final QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(mutation),
    ));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return gqlmutation(mutation);
    } else if (result.hasException &&
        result.exception
            .toString()
            .contains(refreshAccessTokenExpiredException)) {
      _authController.getNewToken();
      return gqlmutation(mutation);
    } else if (result.hasException) {
      print(result.exception);
    } else {
      return result.data;
    }
  }

  Future<dynamic> sendLogs(String filePath) async {
    //TODO: Add the Url and uncomment the block
    // var request = http.MultipartRequest('POST', Uri.parse(''));
    // request.files.add(
    //   http.MultipartFile(
    //     'zip',
    //     File(filePath).readAsBytes().asStream(),
    //     File(filePath).lengthSync(),
    //     filename: filePath.split("/").last,
    //   ),
    // );
    // var res = await request.send();
    // return res.statusCode;
  }
}
