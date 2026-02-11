import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/services/caching/offline_action_queue.dart';

import '../../helpers/test_helpers.dart';

void main() {
  late OfflineActionQueue queue;

  getAndRegisterDatabaseMutationFunctions();

  queue = OfflineActionQueue();
  group('OfflineActionQueue', () {
    final CachedUserAction action = CachedUserAction(
      id: '123',
      operation: 'testOperation',
      timeStamp: DateTime.now(),
      expiry: DateTime.now().add(const Duration(days: 1)),
      status: CachedUserActionStatus.pending,
      operationType: CachedOperationType.gqlAuthQuery,
    );
    group('success', () {
      test('addAction success', () async {
        final result = await queue.addAction(action);

        expect(result, true);
      });

      test('getActions success', () {
        final now = DateTime.now();
        final CachedUserAction validAction = CachedUserAction(
          id: '123',
          operation: 'testOperation',
          timeStamp: now,
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthQuery,
        );
        final CachedUserAction expiredAction = CachedUserAction(
          id: '456',
          operation: 'expiredOperation',
          timeStamp: now,
          expiry: now.subtract(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthQuery,
        );

        queue.addAction(validAction);
        queue.addAction(expiredAction);

        final actions = queue.getActions();

        expect(actions, [validAction]);
      });

      test('removeAction success', () async {
        final result = await queue.removeAction('123');

        expect(result, true);
      });

      test('clearActions success', () async {
        final result = await queue.clearActions();

        expect(result, true);
      });

      test('_removeExpiredActions success', () async {
        final result = await queue.removeExpiredActions();

        expect(result, true);
      });

      test('getPendingActions filters by status and expiry, returns FIFO', () async {
        // Clear any existing actions
        await queue.clearActions();

        final now = DateTime.now();

        // Create actions with different timestamps
        final oldAction = CachedUserAction(
          id: 'old-1',
          operation: 'oldOp',
          timeStamp: now.subtract(const Duration(hours: 2)),
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        final newAction = CachedUserAction(
          id: 'new-1',
          operation: 'newOp',
          timeStamp: now.subtract(const Duration(hours: 1)),
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        final expiredAction = CachedUserAction(
          id: 'expired-1',
          operation: 'expiredOp',
          timeStamp: now.subtract(const Duration(hours: 3)),
          expiry: now.subtract(const Duration(hours: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        final completedAction = CachedUserAction(
          id: 'completed-1',
          operation: 'completedOp',
          timeStamp: now.subtract(const Duration(hours: 1)),
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.completed,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        // Add in random order
        await queue.addAction(newAction);
        await queue.addAction(expiredAction);
        await queue.addAction(oldAction);
        await queue.addAction(completedAction);

        final pending = queue.getPendingActions();

        // Should only return non-expired pending actions, sorted oldest first (FIFO)
        expect(pending.length, 2);
        expect(pending[0].id, 'old-1'); // Oldest first
        expect(pending[1].id, 'new-1');
      });

      test('getPendingCount returns correct count', () async {
        // Clear any existing actions
        await queue.clearActions();

        final now = DateTime.now();

        // Add 3 pending, 1 expired, 1 completed
        await queue.addAction(
          CachedUserAction(
            id: 'pending-1',
            operation: 'op1',
            timeStamp: now,
            expiry: now.add(const Duration(days: 1)),
            status: CachedUserActionStatus.pending,
            operationType: CachedOperationType.gqlAuthMutation,
          ),
        );

        await queue.addAction(
          CachedUserAction(
            id: 'pending-2',
            operation: 'op2',
            timeStamp: now,
            expiry: now.add(const Duration(days: 1)),
            status: CachedUserActionStatus.pending,
            operationType: CachedOperationType.gqlAuthMutation,
          ),
        );

        await queue.addAction(
          CachedUserAction(
            id: 'pending-3',
            operation: 'op3',
            timeStamp: now,
            expiry: now.add(const Duration(days: 1)),
            status: CachedUserActionStatus.pending,
            operationType: CachedOperationType.gqlAuthMutation,
          ),
        );

        await queue.addAction(
          CachedUserAction(
            id: 'expired',
            operation: 'expiredOp',
            timeStamp: now,
            expiry: now.subtract(const Duration(hours: 1)),
            status: CachedUserActionStatus.pending,
            operationType: CachedOperationType.gqlAuthMutation,
          ),
        );

        await queue.addAction(
          CachedUserAction(
            id: 'completed',
            operation: 'completedOp',
            timeStamp: now,
            expiry: now.add(const Duration(days: 1)),
            status: CachedUserActionStatus.completed,
            operationType: CachedOperationType.gqlAuthMutation,
          ),
        );

        final count = queue.getPendingCount();

        // Should only count non-expired pending actions
        expect(count, 3);
        expect(count, queue.getPendingActions().length);
      });

      test('markCompleted removes action from queue', () async {
        // Clear any existing actions
        await queue.clearActions();

        final now = DateTime.now();
        final testAction = CachedUserAction(
          id: 'mark-completed-test',
          operation: 'testOp',
          timeStamp: now,
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        await queue.addAction(testAction);

        // Verify action exists
        expect(queue.getPendingCount(), 1);

        // Mark as completed
        final result = await queue.markCompleted('mark-completed-test');

        expect(result, true);
        expect(queue.getPendingCount(), 0);
        expect(queue.getActions(), isEmpty);
      });

      test('updateAction updates existing action', () async {
        // Clear any existing actions
        await queue.clearActions();

        final now = DateTime.now();
        final originalAction = CachedUserAction(
          id: 'update-test',
          operation: 'originalOp',
          timeStamp: now,
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        await queue.addAction(originalAction);

        // Update with new data
        final updatedAction = CachedUserAction(
          id: 'update-test',
          operation: 'updatedOp',
          timeStamp: now,
          expiry: now.add(const Duration(days: 1)),
          status: CachedUserActionStatus.pending,
          operationType: CachedOperationType.gqlAuthMutation,
        );

        final result = await queue.updateAction(updatedAction);

        expect(result, true);

        final actions = queue.getPendingActions();
        expect(actions.length, 1);
        expect(actions[0].operation, 'updatedOp');
      });
    });

    group('failure', () {
      setUpAll(() async {
        await Hive.close();
      });
      test('addAction failure', () async {
        final result = await queue.addAction(action);

        expect(result, false);
      });
      test('getActions failure', () {
        final actions = queue.getActions();

        expect(actions, []);
      });
      test('removeAction failure', () async {
        final result = await queue.removeAction('123');

        expect(result, false);
      });
      test('clearActions failure', () async {
        final result = await queue.clearActions();

        expect(result, false);
      });
      test('_removeExpiredActions failure', () async {
        final result = await queue.removeExpiredActions();

        expect(result, false);
      });
    });
  });
}
