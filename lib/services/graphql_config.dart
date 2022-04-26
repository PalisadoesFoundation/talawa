import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';

class GraphqlConfig {
  static const imageUrlKey = "imageUrl";
  static const urlKey = "url";
  static String? orgURI = ' ';
  static String? token;
  late HttpLink httpLink;
  late WebSocketLink webSocketLink;

//prefix route for showing images
  String? displayImgRoute;

  Future getToken() async {
    final _token = userConfig.currentUser.authToken;
    token = _token;
    getOrgUrl();
    return true;
  }

  getOrgUrl() {
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

  test() {
    httpLink = HttpLink(
      'https://talawa-graphql-api.herokuapp.com/graphql',
      httpClient: MockHttpClient(),
    );
  }
}

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
