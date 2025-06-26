import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/org_service.dart';

import '../helpers/test_helpers.dart';

/// Tests org_service.dart.
void main() {
  registerServices();

  group('Test OrganizationService', () {
    final OrganizationService organizationService = OrganizationService();
    final dbFunctions = locator<DataBaseMutationFunctions>();

    test('Test getOrgMembersList', () async {
      const String orgId = '123';
      const String query = '''
    query {
      usersByOrganizationId(organizationId: "$orgId") {
        id
        name
        avatarURL
        description
      }
    }
    ''';

      final List<Map<String, dynamic>> userJsonList = [
        {
          'id': 'user_id_1',
          'name': 'Some Name',
          'avatarURL': 'https://example.com/avatar1.jpg',
          'description': 'Test user 1',
        },
        {
          'id': 'user_id_2',
          'name': 'Name Some',
          'avatarURL': 'https://example.com/avatar2.jpg',
          'description': 'Test user 2',
        },
      ];

      final QueryResult queryResult = QueryResult.internal(
        parserFn: (map) => '123',
        source: null,
        data: {
          'usersByOrganizationId': userJsonList,
        },
      );
      when(dbFunctions.gqlAuthQuery(query))
          .thenAnswer((realInvocation) async => queryResult);

      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 2);
      expect(result[0].id, 'user_id_1');
      expect(result[0].firstName, 'Some'); // First part of the name
      expect(result[0].lastName, 'Name'); // Rest of the name
      expect(result[0].image, 'https://example.com/avatar1.jpg');
      expect(result[0].authToken, null); // No auth token in org user data
      expect(result[0].refreshToken, null); // No refresh token in org user data

      expect(result[1].id, 'user_id_2');
      expect(result[1].firstName, 'Name');
      expect(result[1].lastName, 'Some');
      expect(result[1].image, 'https://example.com/avatar2.jpg');
    });

    test('Test getOrgMembersList with GraphQL exception', () async {
      const String orgId = '123';
      const String query = '''
    query {
      usersByOrganizationId(organizationId: "$orgId") {
        id
        name
        avatarURL
        description
      }
    }
    ''';

      final QueryResult queryResult = QueryResult.internal(
        parserFn: (map) => '123',
        source: null,
        data: null,
        exception: OperationException(
          graphqlErrors: [
            const GraphQLError(message: 'Test error'),
          ],
        ),
      );
      when(dbFunctions.gqlAuthQuery(query))
          .thenAnswer((realInvocation) async => queryResult);

      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 0); // Should return empty list on error
    });

    test('Test getOrgMembersList with null data', () async {
      const String orgId = '123';
      const String query = '''
    query {
      usersByOrganizationId(organizationId: "$orgId") {
        id
        name
        avatarURL
        description
      }
    }
    ''';

      final QueryResult queryResult = QueryResult.internal(
        parserFn: (map) => '123',
        source: null,
        data: null,
      );
      when(dbFunctions.gqlAuthQuery(query))
          .thenAnswer((realInvocation) async => queryResult);

      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 0); // Should return empty list when data is null
    });
  });
}
