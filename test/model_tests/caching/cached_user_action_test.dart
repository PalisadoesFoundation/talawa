import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUpAll(() async {
    testSetupLocator();
    getAndRegisterDatabaseMutationFunctions();
  });

  group('CachedUserAction', () {
    test('should create an instance of CachedUserAction', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testOperation',
        timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
        expiry: DateTime.parse('2024-07-13T12:34:56Z'),
        status: CachedUserActionStatus.pending,
        operationType: CachedOperationType.gqlAuthQuery,
      );

      expect(action.id, '123');
      expect(action.operation, 'testOperation');
      expect(action.timeStamp, DateTime.parse('2024-07-12T12:34:56Z'));
      expect(action.expiry, DateTime.parse('2024-07-13T12:34:56Z'));
      expect(action.status, CachedUserActionStatus.pending);
      expect(action.operationType, CachedOperationType.gqlAuthQuery);
    });

    test('should execute gqlAuthQuery operation', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testQuery',
        timeStamp: DateTime.now(),
        expiry: DateTime.now().add(const Duration(days: 1)),
        status: CachedUserActionStatus.pending,
        operationType: CachedOperationType.gqlAuthQuery,
      );

      action.execute();

      verify(databaseFunctions.gqlAuthQuery('testQuery', variables: null))
          .called(1);
    });

    test('should execute gqlAuthMutation operation', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testMutation',
        timeStamp: DateTime.now(),
        expiry: DateTime.now().add(const Duration(days: 1)),
        status: CachedUserActionStatus.pending,
        operationType: CachedOperationType.gqlAuthMutation,
      );

      action.execute();

      verify(databaseFunctions.gqlAuthMutation('testMutation', variables: null))
          .called(1);
    });

    test('should execute gqlNonAuthQuery operation', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testQuery',
        timeStamp: DateTime.now(),
        expiry: DateTime.now().add(const Duration(days: 1)),
        status: CachedUserActionStatus.pending,
        operationType: CachedOperationType.gqlNonAuthQuery,
      );

      action.execute();

      verify(databaseFunctions.gqlNonAuthQuery('testQuery', variables: null))
          .called(1);
    });

    test('should execute gqlNonAuthMutation operation', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testMutation',
        timeStamp: DateTime.now(),
        expiry: DateTime.now().add(const Duration(days: 1)),
        status: CachedUserActionStatus.pending,
        operationType: CachedOperationType.gqlNonAuthMutation,
      );

      action.execute();

      verify(
        databaseFunctions.gqlNonAuthMutation(
          'testMutation',
          variables: null,
        ),
      ).called(1);
    });

    test('should handle unsupported operation type in execute', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testOperation',
        timeStamp: DateTime.now(),
        expiry: DateTime.now().add(const Duration(days: 1)),
        status: CachedUserActionStatus.pending,
        operationType:
            CachedOperationType.gqlAuthQuery, // Unsupported operation type
      );

      expect(() => action.execute(), returnsNormally);
    });

    test('should provide correct string representation', () {
      final action = CachedUserAction(
        id: '123',
        operation: 'testOperation',
        timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
        expiry: DateTime.parse('2024-07-13T12:34:56Z'),
        status: CachedUserActionStatus.pending,
        operationType: CachedOperationType.gqlAuthQuery,
        variables: {'key': 'value'},
        metaData: {'info': 'metadata'},
      );

      final json = action.toJson();
      CachedUserAction.fromJson(json);

      final stringRepresentation = action.toString();

      expect(stringRepresentation, '''
      CachedUserAction(
        id: 123,
        operation: testOperation,
        variables: {key: value},
        timeStamp: 2024-07-12 12:34:56.000Z,
        expiry: 2024-07-13 12:34:56.000Z,
        status: CachedUserActionStatus.pending,
        metaData: {info: metadata},
        operationType: CachedOperationType.gqlAuthQuery,
      )
    ''');
    });
  });
}
