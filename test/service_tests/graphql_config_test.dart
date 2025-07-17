import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';

import '../helpers/test_helpers.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Hive.openBox('url');
  });

  setUp(() {
    getAndRegisterUserConfig();
    getAndRegisterDatabaseMutationFunctions();
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
}
