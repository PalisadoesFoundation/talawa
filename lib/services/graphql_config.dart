import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
  static const defaultGraphqlUrl = 'https://api-test.talawa.io/graphql';
  static const defaultImageRoute = 'https://api-test.talawa.io/graphql/talawa/';
  static String? orgURI = defaultGraphqlUrl;
  static String? token;
  HttpLink? _httpLink;

  /// Lazily-initialized HTTP link. Defaults to [defaultGraphqlUrl] so callers
  /// can build a client before [getOrgUrl] runs (avoids LateInitializationError
  /// when subscribers fire before login).
  HttpLink get httpLink => _httpLink ??= HttpLink(defaultGraphqlUrl);
  set httpLink(HttpLink link) => _httpLink = link;

  WebSocketLink? webSocketLink;

//prefix route for showing images
  String? displayImgRoute;

  /// This function is used to get user the access token.
  void getToken() {
    final authToken = userConfig.currentUser.authToken;
    token = authToken;
    getOrgUrl();
  }

  /// This function is used to initialize the GraphQL client for testing.
  void initializeForTesting(String apiUrl) {
    httpLink = HttpLink(apiUrl);
    orgURI = apiUrl;
  }

  /// This function is used to get the organization URL.
  void getOrgUrl() {
    // Force a single backend endpoint to avoid stale local URL state.
    orgURI = defaultGraphqlUrl;
    displayImgRoute = defaultImageRoute;
    httpLink = HttpLink(orgURI!);
    _initializeWebSocketLink();
  }

  /// Initialize WebSocket link for GraphQL subscriptions
  void _initializeWebSocketLink() {
    try {
      // Derive socket URL from orgURI by replacing http with ws
      String socketUrl;
      final trimmedOrg = orgURI?.trim();
      if (trimmedOrg != null && trimmedOrg.isNotEmpty) {
        socketUrl = trimmedOrg.replaceFirst('http://', 'ws://').replaceFirst('https://', 'wss://');
      } else {
        // Fallback to environment variable or default
        socketUrl = dotenv.env['SOCKET_URL'] ??
            (kReleaseMode ? 'wss://api-test.talawa.io/graphql' : 'ws://localhost:4000/graphql');
      }

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
      'https://api-test.talawa.io/graphql',
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
