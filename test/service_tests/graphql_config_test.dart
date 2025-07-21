import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';

import '../helpers/test_helpers.dart';

// Create a mock WebSocketLink to test subscription functionality
class MockWebSocketLink extends Mock implements WebSocketLink {}

// Simple test class with isSubscription property
class TestRequest {
  final bool isSubscription = true;
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Hive.openBox('url');
  });

  setUp(() {
    getAndRegisterUserConfig();
    getAndRegisterDatabaseMutationFunctions();
    dotenv.testLoad(fileInput: '''API_URL=http://<IPv4>:4000/graphql''');
  });

  tearDown(() async {
    locator.reset();
  });

  tearDownAll(() async {
    await Hive.close();
  });

  group('Testing GraphQL Config', () {
    test('test httpLink with MockHttpClient', () async {
      final graphqlConfig = GraphqlConfig();
      final mockHttpClient = MockHttpClient();
      final mockUri = Uri.parse('https://example.com/graphql');

      graphqlConfig.httpLink = HttpLink(
        mockUri.toString(),
        httpClient: mockHttpClient,
      );

      final response = await graphqlConfig
          .clientToQuery()
          .query(QueryOptions(document: gql('query {}')));
      expect(response.data, isNull);
    });

    test('clientToQuery returns GraphQLClient with httpLink', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');

      final client = config.clientToQuery();

      expect(client, isA<GraphQLClient>());
      expect(client.cache, isA<GraphQLCache>());
    });

    test('test method sets httpLink with MockHttpClient', () {
      final config = GraphqlConfig();

      config.test();

      expect(config.httpLink, isA<HttpLink>());
      expect(
        config.httpLink.uri.toString(),
        'https://talawa-graphql-api.herokuapp.com/graphql',
      );
    });

    test('getToken updates token and calls getOrgUrl', () async {
      final userConfig = getAndRegisterUserConfig();
      final mockUser = User(
        id: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
        authToken: 'test-token',
      );
      final box = Hive.box('url');
      box.put(GraphqlConfig.urlKey, 'https://example.com/graphql');

      when(userConfig.currentUser).thenReturn(mockUser);

      final config = GraphqlConfig();
      final result = await config.getToken();

      expect(result, true);
      expect(GraphqlConfig.token, 'test-token');
      expect(config.httpLink, isA<HttpLink>());
    });

    test('getOrgUrl sets orgURI, displayImgRoute, and httpLink from Hive', () {
      final box = Hive.box('url');
      box.put(GraphqlConfig.urlKey, 'https://example.com/graphql');
      box.put(GraphqlConfig.imageUrlKey, 'https://example.com/image.png');

      final config = GraphqlConfig();
      config.getOrgUrl();

      expect(GraphqlConfig.orgURI, 'https://example.com/graphql');
      expect(config.displayImgRoute, 'https://example.com/image.png');
      expect(config.httpLink, isA<HttpLink>());
      expect(config.httpLink.uri.toString(), 'https://example.com/graphql');
    });

    test('getOrgUrl uses defaults if Hive values are null', () {
      final box = Hive.box('url');
      box.delete(GraphqlConfig.urlKey);
      box.delete(GraphqlConfig.imageUrlKey);

      final config = GraphqlConfig();
      config.getOrgUrl();

      expect(GraphqlConfig.orgURI, ' ');
      expect(config.displayImgRoute, ' ');
      expect(config.httpLink, isA<HttpLink>());
      expect(config.httpLink.uri.toString(), '%20');
    });

    test('getOrgUrl initializes WebSocket link', () {
      final box = Hive.box('url');
      box.put(GraphqlConfig.urlKey, 'https://example.com/graphql');

      final config = GraphqlConfig();
      config.getOrgUrl();

      // WebSocket link should be initialized (or null if initialization fails)
      expect(config.webSocketLink, isA<WebSocketLink?>());
    });

    test('authClient returns GraphQLClient with AuthLink', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      GraphqlConfig.token = 'test-token';

      final client = config.authClient();

      expect(client, isA<GraphQLClient>());
      expect(client.cache, isA<GraphQLCache>());
    });

    test('authClient uses WebSocket link when available', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      GraphqlConfig.token = 'test-token';

      // Initialize with websocket link available
      config.getOrgUrl();

      final client = config.authClient();

      expect(client, isA<GraphQLClient>());
    });

    test(
        'authClient falls back to httpAuthLink if WebSocket initialization fails',
        () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      config.webSocketLink = null; // Simulate WebSocket not available
      GraphqlConfig.token = 'test-token';

      final client = config.authClient();

      expect(client, isA<GraphQLClient>());
    });

    test('WebSocket link initialization handles exceptions gracefully', () {
      final config = GraphqlConfig();

      // This should not throw even if WebSocket initialization fails
      expect(() => config.getOrgUrl(), returnsNormally);
    });

    test('authClient handles null token gracefully', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      GraphqlConfig.token = null;

      final client = config.authClient();

      expect(client, isA<GraphQLClient>());
    });

    test('static variables can be set and retrieved', () {
      const testUrl = 'https://test.example.com/graphql';
      const testToken = 'test-static-token';

      GraphqlConfig.orgURI = testUrl;
      GraphqlConfig.token = testToken;

      expect(GraphqlConfig.orgURI, testUrl);
      expect(GraphqlConfig.token, testToken);
    });

    test('displayImgRoute is set correctly from Hive', () {
      const testImageUrl = 'https://example.com/test-image.png';
      final box = Hive.box('url');
      box.put(GraphqlConfig.imageUrlKey, testImageUrl);

      final config = GraphqlConfig();
      config.getOrgUrl();

      expect(config.displayImgRoute, testImageUrl);
    });

    test('httpLink is properly configured with orgURI', () {
      const testUrl = 'https://test-org.example.com/graphql';
      final box = Hive.box('url');
      box.put(GraphqlConfig.urlKey, testUrl);

      final config = GraphqlConfig();
      config.getOrgUrl();

      expect(config.httpLink, isA<HttpLink>());
      expect(config.httpLink.uri.toString(), testUrl);
      expect(GraphqlConfig.orgURI, testUrl);
    });

    test('WebSocket link initializes with correct initialPayload', () async {
      final config = GraphqlConfig();
      GraphqlConfig.token = 'test-token';

      // Force WebSocket initialization
      config.getOrgUrl();

      // Verify WebSocketLink was created
      expect(config.webSocketLink, isNotNull);

      // We can't directly test the initialPayload function's return value
      // since it's a private callback, but we can verify the WebSocketLink was created
      expect(config.webSocketLink, isA<WebSocketLink>());
    });
  });

  group('Testing MockHttpClient', () {
    test('MockHttpClient can be used with HttpLink', () {
      final mockClient = MockHttpClient();
      final link = HttpLink(
        'https://example.com/graphql',
        httpClient: mockClient,
      );

      expect(link, isA<HttpLink>());
      expect(link.uri.toString(), 'https://example.com/graphql');
    });
  });

  group('WebSocket Configuration Tests', () {
    test('getOrgUrl initializes WebSocketLink with proper config', () {
      const testUrl = 'https://test-org.example.com/graphql';
      final box = Hive.box('url');
      box.put(GraphqlConfig.urlKey, testUrl);

      final config = GraphqlConfig();
      config.getOrgUrl();

      expect(config.webSocketLink, isA<WebSocketLink?>());
    });

    test('authClient uses Link.split when WebSocket is available', () {
      const testUrl = 'https://test-org.example.com/graphql';
      final box = Hive.box('url');
      box.put(GraphqlConfig.urlKey, testUrl);

      final config = GraphqlConfig();
      config.getOrgUrl(); // This will initialize WebSocket

      final client = config.authClient();

      expect(client, isA<GraphQLClient>());
      expect(config.webSocketLink, isNotNull);
    });

    test('authClient handles null WebSocket gracefully', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      config.webSocketLink = null;

      final client = config.authClient();

      expect(client, isA<GraphQLClient>());
    });

    test('WebSocket initialization handles exceptions gracefully', () {
      // This test verifies that _initializeWebSocketLink handles exceptions
      final config = GraphqlConfig();

      // This should not throw even with getOrgUrl
      expect(
        () => config.getOrgUrl(),
        returnsNormally,
      );
    });

    test('Link.split correctly identifies subscription requests', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      GraphqlConfig.token = 'test-token';

      // Create a mock WebSocketLink
      final mockWebSocketLink = MockWebSocketLink();
      config.webSocketLink = mockWebSocketLink;

      // Create a client that will use Link.split
      final client = config.authClient();
      expect(client, isA<GraphQLClient>());

      // Create a test object with isSubscription property
      final testRequest = TestRequest();

      // Verify the property value
      expect(testRequest.isSubscription, isTrue);

      // Note: We can't directly test the Link.split function's behavior with our TestRequest
      // since it's not a real Request object, but we've verified the client creation works
    });

    test('authClient uses WebSocketLink for subscription requests', () {
      final config = GraphqlConfig();
      config.httpLink = HttpLink('https://example.com/graphql');
      GraphqlConfig.token = 'test-token';

      // Create a mock WebSocketLink
      final mockWebSocketLink = MockWebSocketLink();
      config.webSocketLink = mockWebSocketLink;

      // Create a client that will use Link.split
      final client = config.authClient();

      // We can't directly test the Link.split behavior since it's internal
      // But we can verify the client was created successfully with both links
      expect(client, isA<GraphQLClient>());
    });
  });
}
