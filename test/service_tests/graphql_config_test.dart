import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/services/graphql_config.dart';
import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    registerServices();
  });
  group('Testing Graphql Config', () {
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
      expect(
        response.data,
        isNull,
      );
    });
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
}
