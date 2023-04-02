// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';

/// GraphQL is a query language for APIs and a runtime for fulfilling those queries with your existing data.
/// Talawa uses graphQL for the integrating with the API's.
/// You can go through talawa-api, [here](https://github.com/PalisadoesFoundation/talawa-api).
/// GraphqlConfig class provides service to configure graph ql API with talawa mobile-app.
class GraphqlConfig {
  // variable declaration
  static const imageUrlKey = "imageUrl";
  static const urlKey = "url";
  static String? orgURI = ' ';
  static String? token;
  late HttpLink httpLink;
  late WebSocketLink webSocketLink;

//prefix route for showing images
  String? displayImgRoute;

  /// This function is used to get user the access token.
  Future getToken() async {
    final authToken = userConfig.currentUser.authToken;
    token = authToken;
    getOrgUrl();
    return true;
  }

  /// This function is used to get the organization URL.
  void getOrgUrl() {
    final box = Hive.box('url');
    final String? url = box.get(urlKey) as String?;
    final String? imgUrl = box.get(imageUrlKey) as String?;
    orgURI = url ?? ' ';
    displayImgRoute = imgUrl ?? ' ';
    httpLink = HttpLink(orgURI!);
    clientToQuery();
    authClient();
  }

  GraphQLClient clientToQuery() {
    //TODO: Implement websocket link from OrgUrl
    // final link = Link.split(
    //     (request) => request.isSubscription, webSocketLink, httpLink);
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: httpLink,
    );
  }

  GraphQLClient authClient() {
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
    final Link finalAuthLink = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: finalAuthLink,
    );
  }

  void test() {
    httpLink = HttpLink(
      'https://talawa-graphql-api.herokuapp.com/graphql',
      httpClient: MockHttpClient(),
    );
  }
}

/// A mock HTTP client designed for use when testing code that uses BaseClient.
class MockHttpClient extends Mock implements http.Client {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest? request) =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(
        Invocation.method(#send, [request]),
        returnValue: Future.value(
          http.StreamedResponse(
            Stream.fromIterable(const [<int>[]]),
            500,
          ),
        ),
      ) as Future<http.StreamedResponse>;
}
