import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  late ActionHandlerService actionHandlerService;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    actionHandlerService = ActionHandlerService();
    AppConnectivity.isOnline = true;
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('ActionHandlerService Tests', () {
    group('executeApiCall', () {
      test('should return true on successful API call with valid result',
          () async {
        // Arrange
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { test }')),
          data: {'test': 'data'},
          source: QueryResultSource.network,
        );

        // Act
        final result = await actionHandlerService.executeApiCall(
          action: () async => mockResult,
        );

        // Assert
        expect(result, isTrue);
      });

      test('should return null when action returns null', () async {
        // Act
        final result = await actionHandlerService.executeApiCall(
          action: () async => null,
        );

        // Assert
        expect(result, isNull);
      });

      test('should return null when result.data is null', () async {
        // Arrange
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { test }')),
          data: null,
          source: QueryResultSource.network,
        );

        // Act
        final result = await actionHandlerService.executeApiCall(
          action: () async => mockResult,
        );

        // Assert
        expect(result, isNull);
      });

      test('should return false when action throws exception', () async {
        // Act
        final result = await actionHandlerService.executeApiCall(
          action: () async => throw Exception('Test error'),
        );

        // Assert
        expect(result, isFalse);
      });

      test('should call onValidResult for concrete non-cache results',
          () async {
        // Arrange
        bool onValidResultCalled = false;
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { test }')),
          data: {'test': 'data'},
          source: QueryResultSource.network,
        );

        // Act
        await actionHandlerService.executeApiCall(
          action: () async => mockResult,
          onValidResult: (result) async {
            onValidResultCalled = true;
          },
        );

        // Assert
        expect(onValidResultCalled, isTrue);
      });

      test('should not call onValidResult for cache results', () async {
        // Arrange
        bool onValidResultCalled = false;
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { test }')),
          data: {'test': 'data'},
          source: QueryResultSource.cache,
        );

        // Act
        await actionHandlerService.executeApiCall(
          action: () async => mockResult,
          onValidResult: (result) async {
            onValidResultCalled = true;
          },
        );

        // Assert
        expect(onValidResultCalled, isFalse);
      });

      test('should call onActionException when action throws exception',
          () async {
        // Arrange
        bool onActionExceptionCalled = false;
        Exception? caughtException;

        // Act
        await actionHandlerService.executeApiCall(
          action: () async => throw Exception('Test error'),
          onActionException: (e) async {
            onActionExceptionCalled = true;
            caughtException = e;
          },
        );

        // Assert
        expect(onActionExceptionCalled, isTrue);
        expect(caughtException, isNotNull);
        expect(caughtException.toString(), contains('Test error'));
      });

      test('should always call onActionFinally on success', () async {
        // Arrange
        bool onActionFinallyCalled = false;
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('query { test }')),
          data: {'test': 'data'},
          source: QueryResultSource.network,
        );

        // Act
        await actionHandlerService.executeApiCall(
          action: () async => mockResult,
          onActionFinally: () async {
            onActionFinallyCalled = true;
          },
        );

        // Assert
        expect(onActionFinallyCalled, isTrue);
      });

      test('should always call onActionFinally on exception', () async {
        // Arrange
        bool onActionFinallyCalled = false;

        // Act
        await actionHandlerService.executeApiCall(
          action: () async => throw Exception('Test error'),
          onActionFinally: () async {
            onActionFinallyCalled = true;
          },
        );

        // Assert
        expect(onActionFinallyCalled, isTrue);
      });

      test('should always call onActionFinally when result is null', () async {
        // Arrange
        bool onActionFinallyCalled = false;

        // Act
        await actionHandlerService.executeApiCall(
          action: () async => null,
          onActionFinally: () async {
            onActionFinallyCalled = true;
          },
        );

        // Assert
        expect(onActionFinallyCalled, isTrue);
      });
    });

    group('performAction', () {
      group('optimistic actions', () {
        test('should call updateUI before action for optimistic actions',
            () async {
          // Arrange
          final callOrder = <String>[];
          final mockResult = QueryResult(
            options: QueryOptions(document: gql('query { test }')),
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.optimistic,
            action: () async {
              callOrder.add('action');
              return mockResult;
            },
            updateUI: () {
              callOrder.add('updateUI');
            },
          );

          // Assert
          expect(callOrder, equals(['updateUI', 'action']));
          expect(
            callOrder.indexOf('updateUI') < callOrder.indexOf('action'),
            isTrue,
            reason: 'updateUI should be called before action for optimistic actions',
          );
        });


        test('should execute API call for optimistic actions', () async {
          // Arrange
          bool actionCalled = false;
          final mockResult = QueryResult(
            options: QueryOptions(document: gql('query { test }')),
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.optimistic,
            action: () async {
              actionCalled = true;
              return mockResult;
            },
          );

          // Assert
          expect(actionCalled, isTrue);
        });

        test('should call onValidResult for optimistic actions on success',
            () async {
          // Arrange
          bool onValidResultCalled = false;
          final mockResult = QueryResult(
            options: QueryOptions(document: gql('query { test }')),
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.optimistic,
            action: () async => mockResult,
            onValidResult: (result) async {
              onValidResultCalled = true;
            },
          );

          // Assert
          expect(onValidResultCalled, isTrue);
        });

        test('should call onActionException for optimistic actions on error',
            () async {
          // Arrange
          bool onActionExceptionCalled = false;

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.optimistic,
            action: () async => throw Exception('Test error'),
            onActionException: (e) async {
              onActionExceptionCalled = true;
            },
          );

          // Assert
          expect(onActionExceptionCalled, isTrue);
        });
      });

      group('critical actions - online', () {
        setUp(() {
          AppConnectivity.isOnline = true;
        });

        test('should call API before updateUI for critical actions when online',
            () async {
          // Arrange
          final callOrder = <String>[];
          final mockResult = QueryResult(
            options: QueryOptions(document: gql('query { test }')),
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async {
              callOrder.add('action');
              return mockResult;
            },
            updateUI: () {
              callOrder.add('updateUI');
            },
          );

          // Assert
          expect(callOrder, equals(['action', 'updateUI']));
        });

        test(
            'should call apiCallSuccessUpdateUI on successful critical action when online',
            () async {
          // Arrange
          bool apiCallSuccessUpdateUICalled = false;
          final mockResult = QueryResult(
            options: QueryOptions(document: gql('query { test }')),
            data: {'test': 'data'},
            source: QueryResultSource.network,
          );

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async => mockResult,
            apiCallSuccessUpdateUI: () {
              apiCallSuccessUpdateUICalled = true;
            },
          );

          // Assert
          expect(apiCallSuccessUpdateUICalled, isTrue);
        });

        test(
            'should not call apiCallSuccessUpdateUI on failed critical action when online',
            () async {
          // Arrange
          bool apiCallSuccessUpdateUICalled = false;

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async => throw Exception('Test error'),
            apiCallSuccessUpdateUI: () {
              apiCallSuccessUpdateUICalled = true;
            },
          );

          // Assert
          expect(apiCallSuccessUpdateUICalled, isFalse);
        });

        test(
            'should not call apiCallSuccessUpdateUI when result is null for critical action',
            () async {
          // Arrange
          bool apiCallSuccessUpdateUICalled = false;

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async => null,
            apiCallSuccessUpdateUI: () {
              apiCallSuccessUpdateUICalled = true;
            },
          );

          // Assert
          expect(apiCallSuccessUpdateUICalled, isFalse);
        });
      });

      group('critical actions - offline', () {
        setUp(() {
          AppConnectivity.isOnline = false;
        });

        test('should call updateUI when offline for critical actions',
            () async {
          // Arrange
          bool updateUICalled = false;

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async => throw Exception('Should not be called'),
            updateUI: () {
              updateUICalled = true;
            },
          );

          // Assert
          expect(updateUICalled, isTrue);
        });

        test('should not execute API call when offline for critical actions',
            () async {
          // Arrange
          bool actionCalled = false;

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async {
              actionCalled = true;
              return null;
            },
          );

          // Assert
          expect(actionCalled, isFalse);
        });

        test(
            'should not call apiCallSuccessUpdateUI when offline for critical actions',
            () async {
          // Arrange
          bool apiCallSuccessUpdateUICalled = false;

          // Act
          await actionHandlerService.performAction(
            actionType: ActionType.critical,
            action: () async => throw Exception('Should not be called'),
            apiCallSuccessUpdateUI: () {
              apiCallSuccessUpdateUICalled = true;
            },
          );

          // Assert
          expect(apiCallSuccessUpdateUICalled, isFalse);
        });
      });
    });
  });
}
