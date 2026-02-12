import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/services/caching/offline_action_queue.dart';
import 'package:talawa/services/database_mutation_functions.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBinaryReader extends Mock implements BinaryReader {}

void main() {
  late final Box<CachedUserAction> cacheBox;
  late DataBaseMutationFunctions mockDatabaseFunctions;

  setUpAll(() {
    testSetupLocator();
    mockDatabaseFunctions = getAndRegisterDatabaseMutationFunctions();
    cacheBox = Hive.box<CachedUserAction>(OfflineActionQueue.boxName);
  });

  tearDown(() {
    reset(mockDatabaseFunctions);
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

    group('fromJson', () {
      test('should create instance from valid JSON with all fields', () {
        final Map<String, dynamic> json = {
          'id': '123',
          'operation': 'testOperation',
          'variables': {'key': 'value'},
          'timeStamp': '2024-07-12T12:34:56.000Z',
          'expiry': '2024-07-13T12:34:56.000Z',
          'status': CachedUserActionStatus.pending,
          'metaData': {'info': 'metadata'},
          'operationType': CachedOperationType.gqlAuthQuery,
        };

        final action = CachedUserAction.fromJson(json);

        expect(action.id, '123');
        expect(action.operation, 'testOperation');
        expect(action.variables, {'key': 'value'});
        expect(action.timeStamp, DateTime.parse('2024-07-12T12:34:56Z'));
        expect(action.expiry, DateTime.parse('2024-07-13T12:34:56Z'));
        expect(action.status, CachedUserActionStatus.pending);
        expect(action.metaData, {'info': 'metadata'});
        expect(action.operationType, CachedOperationType.gqlAuthQuery);
      });

      test('should create instance from JSON with nullable fields as null', () {
        final Map<String, dynamic> json = {
          'id': '123',
          'operation': 'testOperation',
          'variables': null,
          'timeStamp': '2024-07-12T12:34:56.000Z',
          'expiry': '2024-07-13T12:34:56.000Z',
          'status': CachedUserActionStatus.pending,
          'metaData': null,
          'operationType': CachedOperationType.gqlAuthQuery,
        };

        final action = CachedUserAction.fromJson(json);

        expect(action.variables, null);
        expect(action.metaData, null);
      });
    });

    group('toJson', () {
      test('should convert instance to JSON map', () {
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

        expect(json['id'], '123');
        expect(json['operation'], 'testOperation');
        expect(json['variables'], {'key': 'value'});
        expect(json['timeStamp'], '2024-07-12T12:34:56.000Z');
        expect(json['expiry'], '2024-07-13T12:34:56.000Z');
        expect(json['status'], CachedUserActionStatus.pending);
        expect(json['metaData'], {'info': 'metadata'});
        expect(json['operationType'], CachedOperationType.gqlAuthQuery);
      });

      test('should convert instance with null fields to JSON map', () {
        final action = CachedUserAction(
          id: '123',
          operation: 'testOperation',
          timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
          expiry: DateTime.parse('2024-07-13T12:34:56Z'),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthQuery,
          variables: null,
          metaData: null,
        );

        final json = action.toJson();

        expect(json['variables'], null);
        expect(json['metaData'], null);
      });
    });

    group('execute', () {
      test('should execute gqlAuthQuery operation with variables', () {
        final action = CachedUserAction(
          id: '123',
          operation: 'testQuery',
          timeStamp: DateTime.now(),
          expiry: DateTime.now().add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthQuery,
          variables: {'var': 'val'},
        );

        action.execute();

        verify(databaseFunctions
            .gqlAuthQuery('testQuery', variables: {'var': 'val'})).called(1);
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

        verify(databaseFunctions.gqlAuthMutation('testMutation',
                variables: null))
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

    group('Enums test', () {
      test('CachedUserAction Status', () async {
        CachedUserAction resultAction;

        final action = CachedUserAction(
          id: '123',
          operation: 'testOperation',
          timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
          expiry: DateTime.parse('2024-07-13T12:34:56Z'),
          status: CachedUserActionStatus.completed,
          operationType: CachedOperationType.gqlAuthQuery,
          variables: {'key': 'value'},
          metaData: {'info': 'metadata'},
        );
        await cacheBox.put(action.id, action);
        resultAction = cacheBox.get(action.id)!;
        resultAction.execute();
      });

      test('CachedUserAction Operation Type', () async {
        CachedUserAction resultAction;
        final action1 = CachedUserAction(
          id: '124',
          operation: 'testOperation',
          timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
          expiry: DateTime.parse('2024-07-13T12:34:56Z'),
          status: CachedUserActionStatus.completed,
          operationType: CachedOperationType.gqlAuthMutation,
          variables: {'key': 'value'},
          metaData: {'info': 'metadata'},
        );
        await cacheBox.put(action1.id, action1);
        resultAction = cacheBox.get(action1.id)!;

        final action2 = CachedUserAction(
          id: '125',
          operation: 'testOperation',
          timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
          expiry: DateTime.parse('2024-07-13T12:34:56Z'),
          status: CachedUserActionStatus.completed,
          operationType: CachedOperationType.gqlNonAuthQuery,
          variables: {'key': 'value'},
          metaData: {'info': 'metadata'},
        );
        await cacheBox.put(action2.id, action2);
        resultAction = cacheBox.get(action2.id)!;

        final action3 = CachedUserAction(
          id: '126',
          operation: 'testOperation',
          timeStamp: DateTime.parse('2024-07-12T12:34:56Z'),
          expiry: DateTime.parse('2024-07-13T12:34:56Z'),
          status: CachedUserActionStatus.completed,
          operationType: CachedOperationType.gqlNonAuthMutation,
          variables: {'key': 'value'},
          metaData: {'info': 'metadata'},
        );
        await cacheBox.put(action3.id, action3);
        resultAction = cacheBox.get(action3.id)!;
        print(resultAction);
        resultAction.execute();
      });
    });

    group('Test Adapters', () {
      test('equality works correctly CachedUserActionStatusAdapter', () {
        final adapter1 = CachedUserActionStatusAdapter();
        final adapter2 = CachedUserActionStatusAdapter();

        expect(adapter1, equals(adapter2));
        expect(adapter1.hashCode, equals(adapter2.hashCode));
      });

      test('equality works correctly CachedOperationTypeAdapter', () {
        final adapter1 = CachedOperationTypeAdapter();
        final adapter2 = CachedOperationTypeAdapter();

        expect(adapter1, equals(adapter2));
        expect(adapter1.hashCode, equals(adapter2.hashCode));
      });

      test('equality works correctly CachedUserActionAdapter', () {
        final adapter1 = CachedUserActionAdapter();
        final adapter2 = CachedUserActionAdapter();

        expect(adapter1, equals(adapter2));
        expect(adapter1.hashCode, equals(adapter2.hashCode));
      });
    });
  });
}
