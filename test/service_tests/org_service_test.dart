import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/app_config_service.dart';
import 'package:talawa/services/org_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';

/// Tests org_service.dart.
void main() {
  late MockDataBaseMutationFunctions mockDbFunctions;

  setUp(() {
    testSetupLocator();
    if (!locator.isRegistered<AppConfigService>()) {
      locator.registerSingleton(AppConfigService());
    }
    registerServices();
    mockDbFunctions = getAndRegisterDatabaseMutationFunctions()
        as MockDataBaseMutationFunctions;
  });

  tearDown(() {
    unregisterServices();
  });

  // Helper for creating QueryResult
  QueryResult membersResult(List<Map<String, dynamic>> users) =>
      QueryResult.internal(
        source: QueryResultSource.network,
        data: {
          'usersByOrganizationId': users,
        },
        parserFn: (map) => '123',
      );

  group('Test OrganizationService', () {
    test('Test getOrgMembersList', () async {
      const String orgId = '123';

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

      when(mockDbFunctions.gqlAuthQuery(
        argThat(contains('usersByOrganizationId')),
        variables: anyNamed('variables'),
      )).thenAnswer((_) async => membersResult(userJsonList));

      final OrganizationService organizationService = OrganizationService();
      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 2);
      expect(result[0].id, 'user_id_1');
      expect(result[0].firstName, 'Some'); // First part of the name
      expect(result[0].lastName, 'Name'); // Rest of the name
      expect(result[0].image, 'https://example.com/avatar1.jpg');
      expect(result[0].authToken, null); // No auth token in org user data

      expect(result[1].id, 'user_id_2');
      expect(result[1].firstName, 'Name');
      expect(result[1].lastName, 'Some');
      expect(result[1].image, 'https://example.com/avatar2.jpg');
    });

    test('Test getOrgMembersList with GraphQL exception', () async {
      const String orgId = '123';

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

      when(mockDbFunctions.gqlAuthQuery(
        argThat(contains('usersByOrganizationId')),
        variables: anyNamed('variables'),
      )).thenAnswer((_) async => queryResult);

      final OrganizationService organizationService = OrganizationService();
      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 0); // Should return empty list on error
    });

    test('Test getOrgMembersList with null data', () async {
      const String orgId = '123';

      final QueryResult queryResult = QueryResult.internal(
        parserFn: (map) => '123',
        source: null,
        data: null,
      );

      when(mockDbFunctions.gqlAuthQuery(
        argThat(contains('usersByOrganizationId')),
        variables: anyNamed('variables'),
      )).thenAnswer((_) async => queryResult);

      final OrganizationService organizationService = OrganizationService();
      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 0); // Should return empty list when data is null
    });

    test('Test getOrgMembersList with malformed user data', () async {
      const String orgId = '123';

      // Mix of valid and invalid user data to test error handling
      final List<Map<String, dynamic>> mixedUserJsonList = [
        {
          'id': 'user_id_1',
          'name': 'Valid User',
          'avatarURL': 'https://example.com/avatar1.jpg',
          'description': 'Test user 1',
        },
        // Invalid data that will cause parsing error
        {
          'id': null, // Invalid ID
          'name': 123, // Invalid name type
          'avatarURL': true, // Invalid URL type
        },
        {
          'id': 'user_id_3',
          'name': 'Another Valid User',
          'avatarURL': 'https://example.com/avatar3.jpg',
          'description': 'Test user 3',
        },
      ];

      when(mockDbFunctions.gqlAuthQuery(
        argThat(contains('usersByOrganizationId')),
        variables: anyNamed('variables'),
      )).thenAnswer((_) async => membersResult(mixedUserJsonList));

      final OrganizationService organizationService = OrganizationService();
      final result = await organizationService.getOrgMembersList(orgId);

      // Should return only the valid users, skipping the malformed one
      expect(result.length, 2);
      expect(result[0].id, 'user_id_1');
      expect(result[0].firstName, 'Valid');
      expect(result[0].lastName, 'User');
      expect(result[1].id, 'user_id_3');
      expect(result[1].firstName, 'Another');
      expect(result[1].lastName, 'Valid User');
    });

    test('Test getOrgMembersList in demo mode', () async {
      try {
        appConfig.isDemoMode = true;
        final OrganizationService organizationService = OrganizationService();
        final result = await organizationService.getOrgMembersList('123');
        expect(result, isEmpty);
        verifyNever(mockDbFunctions.gqlAuthQuery(
          argThat(contains('usersByOrganizationId')),
          variables: anyNamed('variables'),
        ));
      } finally {
        appConfig.isDemoMode = false; // Reset
      }
    });
  });
}
