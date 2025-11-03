// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_profile_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    testSetupLocator();
    getAndRegisterDatabaseMutationFunctions();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('UserProfileService Tests', () {
    late UserProfileService userProfileService;

    setUp(() {
      userProfileService = UserProfileService();
    });

    group('updateUserProfile', () {
      test('should call gqlAuthMutation with correct parameters', () async {
        // Arrange
        final variables = {
          'name': 'John Doe',
          'emailAddress': 'john@example.com'
        };
        final mockResult = QueryResult(
          options:
              QueryOptions(document: gql('mutation { updateUserProfile }')),
          data: {
            'updateUserProfile': {'id': '123', 'name': 'John Doe'}
          },
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.updateUserProfile(variables);

        // Assert
        verify(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).called(1);
        expect(result, equals(mockResult));
      });

      test('should handle null variables', () async {
        // Arrange
        final mockResult = QueryResult(
          options:
              QueryOptions(document: gql('mutation { updateUserProfile }')),
          data: {
            'updateUserProfile': {'id': '123'}
          },
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: null,
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.updateUserProfile(null);

        // Assert
        verify(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: null,
        )).called(1);
        expect(result, equals(mockResult));
      });

      test('should handle empty variables map', () async {
        // Arrange
        final variables = <String, dynamic>{};
        final mockResult = QueryResult(
          options:
              QueryOptions(document: gql('mutation { updateUserProfile }')),
          data: {
            'updateUserProfile': {'id': '123'}
          },
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.updateUserProfile(variables);

        // Assert
        verify(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).called(1);
        expect(result, equals(mockResult));
      });

      test('should propagate exceptions from database functions', () {
        // Arrange
        final variables = {'name': 'John Doe'};
        final exception = Exception('Network error');

        when(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).thenThrow(exception);

        // Act & Assert
        expect(
          () => userProfileService.updateUserProfile(variables),
          throwsA(exception),
        );
      });

      test('should handle variables with avatar file', () async {
        // Arrange
        final variables = {
          'name': 'John Doe',
          'emailAddress': 'john@example.com',
          'avatar': 'file_data'
        };
        final mockResult = QueryResult(
          options:
              QueryOptions(document: gql('mutation { updateUserProfile }')),
          data: {
            'updateUserProfile': {
              'id': '123',
              'name': 'John Doe',
              'avatarURL': 'https://example.com/avatar.png'
            }
          },
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.updateUserProfile(variables);

        // Assert
        verify(databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        )).called(1);
        expect(result, equals(mockResult));
        expect(result.data?['updateUserProfile']?['avatarURL'],
            'https://example.com/avatar.png');
      });
    });

    group('getUserProfileInfo', () {
      test('should call gqlAuthQuery with correct parameters', () async {
        // Arrange
        final user = User(id: 'user123', name: 'John Doe');
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { user }')),
          data: {
            'user': {
              'id': 'user123',
              'name': 'John Doe',
              'email': 'john@example.com',
            }
          },
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': user.id},
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.getUserProfileInfo(user);

        // Assert
        verify(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': user.id},
        )).called(1);
        expect(result, equals(mockResult));
      });

      test('should handle user with null id', () async {
        // Arrange
        final user = User(id: null, name: 'John Doe');
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { user }')),
          data: null,
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': null},
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.getUserProfileInfo(user);

        // Assert
        verify(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': null},
        )).called(1);
        expect(result, equals(mockResult));
      });

      test('should propagate exceptions from database functions', () {
        // Arrange
        final user = User(id: 'user123', name: 'John Doe');
        final exception = Exception('Network error');

        when(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': user.id},
        )).thenThrow(exception);

        // Act & Assert
        expect(
          () => userProfileService.getUserProfileInfo(user),
          throwsA(exception),
        );
      });

      test('should handle empty user id', () async {
        // Arrange
        final user = User(id: '', name: 'John Doe');
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { user }')),
          data: null,
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': ''},
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.getUserProfileInfo(user);

        // Assert
        verify(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': ''},
        )).called(1);
        expect(result, equals(mockResult));
      });

      test('should handle successful user info retrieval', () async {
        // Arrange
        final user = User(id: 'user123', name: 'John Doe');
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { user }')),
          data: {
            'user': {
              'id': 'user123',
              'name': 'John Doe Updated',
              'emailAddress': 'john.updated@example.com',
              'avatarURL': 'https://example.com/new-avatar.png',
              'organizationsWhereMember': {
                'edges': [
                  {
                    'node': {
                      'id': 'org1',
                      'name': 'Test Org',
                    }
                  }
                ]
              }
            }
          },
          source: QueryResultSource.network,
        );

        when(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': user.id},
        )).thenAnswer((_) async => mockResult);

        // Act
        final result = await userProfileService.getUserProfileInfo(user);

        // Assert
        expect(result.hasException, isFalse);
        expect(result.data?['user']?['name'], 'John Doe Updated');
        expect(
            result.data?['user']?['emailAddress'], 'john.updated@example.com');
        verify(databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: {'id': user.id},
        )).called(2);
      });
    });
  });
}
