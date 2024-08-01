import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/services/caching/offline_action_queue.dart';

import '../../helpers/test_helpers.dart';

void main() async {
  late OfflineActionQueue queue;

  getAndRegisterDatabaseMutationFunctions();

  queue = OfflineActionQueue();
  await queue.initialize();

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
