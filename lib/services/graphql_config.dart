import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  WebSocketLink? webSocketLink;

//prefix route for showing images
  String? displayImgRoute;

  /// This function is used to get user the access token.
  Future getToken() async {
    final authToken = userConfig.currentUser.authToken;
    token = authToken;
    getOrgUrl();
    return true;
  }

  /// This function is used to initialize the GraphQL client for testing.
  void initializeForTesting(String apiUrl) {
    httpLink = HttpLink(apiUrl);
    orgURI = apiUrl;
  }

  /// This function is used to get the organization URL.
  void getOrgUrl() {
    final box = Hive.box('url');
    final String? url = box.get(urlKey) as String?;
    final String? imgUrl = box.get(imageUrlKey) as String?;
    orgURI = url ?? ' ';
    displayImgRoute = imgUrl ?? ' ';
    httpLink = HttpLink(orgURI!);
    _initializeWebSocketLink();
  }

  /// Initialize WebSocket link for GraphQL subscriptions
  void _initializeWebSocketLink() {
    try {
      // Get socket URL from environment variables
      // TODO: Update SOCKET_URL in .env file for production
      final socketUrl = dotenv.env['SOCKET_URL'] ??
          (kReleaseMode
              ? 'wss://production-server/graphql'
              : 'ws://localhost:4000/graphql');

      webSocketLink = WebSocketLink(
        socketUrl,
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: const Duration(minutes: 30),
          headers: {
            'Authorization': 'Bearer $token',
          },
          initialPayload: getInitialPayload,
        ),
      );
    } catch (e, stackTrace) {
      // Log the failure for diagnostics
      debugPrint('WebSocket initialization failed: $e');
      debugPrint('Stack trace:\n$stackTrace');
      // TODO: disable real-time subscriptions or use a production SOCKET_URL fallback
    }
  }

  /// Get the initial payload for WebSocket connection
  Future<Map<String, String>> getInitialPayload() async {
    return {
      'Authorization': 'Bearer $token',
    };
  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: httpLink,
    );
  }

  GraphQLClient authClient() {
    final AuthLink authLink = AuthLink(getToken: () => 'Bearer $token');

    // Create HTTP link with authentication for queries and mutations
    final Link httpAuthLink = authLink.concat(httpLink);

    // If WebSocket link is available, use split link for subscriptions
    Link finalLink;
    try {
      if (webSocketLink != null) {
        // Use WebSocket for subscriptions, HTTP for queries/mutations
        finalLink = Link.split(
          isSubscriptionRequest,
          webSocketLink!,
          httpAuthLink,
        );
      } else {
        finalLink = httpAuthLink;
      }
    } catch (e) {
      finalLink = httpAuthLink;
    }

    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: finalLink,
    );
  }

  /// Check if a request is a subscription
  bool isSubscriptionRequest(Request request) {
    return request.isSubscription;
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
