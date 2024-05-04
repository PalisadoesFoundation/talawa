import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/graphql_config.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  testSetupLocator();

  setUp(() {
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
}
