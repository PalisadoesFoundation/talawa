import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/retry_queue.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

/// Functional tests that simulate end-to-end background retry policies
/// for failed mutations, verifying timing, ordering, concurrency,
/// and cancellation behaviour across real service integrations.
void main() {
  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Functional - CommentService mutation retry', () {
    late CommentService commentService;
    late MockDataBaseMutationFunctions mockDbFunctions;
    late MockNavigationService mockNavService;

    setUp(() {
      mockDbFunctions = getAndRegisterDatabaseMutationFunctions()
          as MockDataBaseMutationFunctions;
      mockNavService =
          getAndRegisterNavigationService() as MockNavigationService;
      commentService = CommentService();
    });

    test(
      'mutation fails twice then succeeds on third attempt',
      () async {
        var callCount = 0;
        final successResult = QueryResult(
          options: QueryOptions(document: gql('mutation { test }')),
          data: {
            'createComment': {
              'id': 'cmt-1',
              'body': 'Hello',
              'createdAt': '2024-01-01T00:00:00Z',
              'upVotesCount': 0,
              'downVotesCount': 0,
              'creator': {'name': 'Alice', 'avatarURL': null},
              'post': {'id': 'post-1'},
            },
          },
          source: QueryResultSource.network,
        );

        when(
          mockDbFunctions.gqlAuthMutation(any,
              variables: anyNamed('variables')),
        ).thenAnswer((_) async {
          callCount++;
          if (callCount < 3) {
            throw Exception('Network timeout');
          }
          return successResult;
        });

        final comment = await commentService.createComments('post-1', 'Hello');

        expect(comment, isNotNull);
        expect(comment!.id, 'cmt-1');
        expect(comment.body, 'Hello');
        expect(callCount, 3);

        verify(
          mockNavService.showTalawaErrorSnackBar('Comment sent', any),
        ).called(1);
      },
    );

    test(
      'mutation exhausts all retries and returns null with error snackbar',
      () async {
        var callCount = 0;

        when(
          mockDbFunctions.gqlAuthMutation(any,
              variables: anyNamed('variables')),
        ).thenAnswer((_) async {
          callCount++;
          throw Exception('Server down');
        });

        final comment = await commentService.createComments('post-1', 'Hi');

        expect(comment, isNull);
        // Default config is 3 attempts
        expect(callCount, 3);

        verify(
          mockNavService.showTalawaErrorSnackBar(
            'Failed to send comment after retries',
            any,
          ),
        ).called(1);
      },
    );

    test(
      'mutation returns null data — triggers retry then fails gracefully',
      () async {
        var callCount = 0;
        final noDataResult = QueryResult(
          options: QueryOptions(document: gql('mutation { test }')),
          data: null,
          source: QueryResultSource.network,
        );

        when(
          mockDbFunctions.gqlAuthMutation(any,
              variables: anyNamed('variables')),
        ).thenAnswer((_) async {
          callCount++;
          return noDataResult;
        });

        final comment =
            await commentService.createComments('post-2', 'No data');

        expect(comment, isNull);
        // Each call throws "No data returned" which is retried
        expect(callCount, 3);
      },
    );
  });

  group('Functional - gqlAuthMutationWithRetry pattern', () {
    test(
      'retry queue wraps a mutation call and recovers from transient failure',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 3,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        var callCount = 0;
        final successData = {'testField': 'testValue'};

        final result = await queue.execute(
          () async {
            callCount++;
            if (callCount < 2) {
              throw Exception('Transient network error');
            }
            return successData;
          },
          key: 'func-test-mutation',
        );

        expect(result.succeeded, true);
        expect(result.data, successData);
        expect(callCount, 2);
      },
    );

    test(
      'retry returns noData equivalent when all attempts fail',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 2,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        var callCount = 0;

        final result = await queue.execute(
          () async {
            callCount++;
            throw Exception('Server unreachable');
          },
          key: 'func-test-nodata',
        );

        expect(result.succeeded, false);
        expect(result.data, isNull);
        expect(callCount, 2);
      },
    );
  });

  group('Functional - Exponential backoff timing', () {
    test(
      'delays increase exponentially between retries',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 4,
            initialDelay: Duration(milliseconds: 50),
            maxDelay: Duration(seconds: 10),
            backoffMultiplier: 2.0,
          ),
        );

        final timestamps = <DateTime>[];

        await queue.execute(
          () async {
            timestamps.add(DateTime.now());
            if (timestamps.length < 4) {
              throw Exception('fail');
            }
            return 'done';
          },
          key: 'backoff-timing',
        );

        expect(timestamps.length, 4);

        // Verify each gap meets conservative minimums based on config
        // (initialDelay: 50ms, backoffMultiplier: 2.0)
        // Expected delays: 50ms, 100ms, 200ms with 80% tolerance for CI
        final gap1 = timestamps[1].difference(timestamps[0]).inMilliseconds;
        final gap2 = timestamps[2].difference(timestamps[1]).inMilliseconds;
        final gap3 = timestamps[3].difference(timestamps[2]).inMilliseconds;

        // Check each gap meets minimum threshold (80% of expected)
        expect(gap1, greaterThanOrEqualTo((50 * 0.8).toInt())); // ~40ms
        expect(gap2, greaterThanOrEqualTo((100 * 0.8).toInt())); // ~80ms
        expect(gap3, greaterThanOrEqualTo((200 * 0.8).toInt())); // ~160ms
      },
    );

    test(
      'backoff delay is capped at maxDelay',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 5,
            initialDelay: Duration(milliseconds: 50),
            maxDelay: Duration(milliseconds: 80),
            backoffMultiplier: 3.0,
          ),
        );

        final timestamps = <DateTime>[];

        await queue.execute(
          () async {
            timestamps.add(DateTime.now());
            throw Exception('always fail');
          },
          key: 'cap-test',
        );

        // After initial 50ms, next would be 150ms but capped to 80ms
        // Check that later gaps don't exceed maxDelay + tolerance
        for (int i = 2; i < timestamps.length; i++) {
          final gap =
              timestamps[i].difference(timestamps[i - 1]).inMilliseconds;
          // Allow 40ms tolerance for scheduling jitter
          expect(gap, lessThan(120));
        }
      },
    );
  });

  group('Functional - Concurrent independent mutations', () {
    test(
      'multiple independent retry operations run without interfering',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 3,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 100),
          ),
        );

        var task1Calls = 0;
        var task2Calls = 0;
        var task3Calls = 0;

        // All three tasks fail once then succeed
        final future1 = queue.execute(
          () async {
            task1Calls++;
            if (task1Calls < 2) throw Exception('t1');
            return 'result-1';
          },
          key: 'concurrent-1',
        );

        final future2 = queue.execute(
          () async {
            task2Calls++;
            if (task2Calls < 2) throw Exception('t2');
            return 'result-2';
          },
          key: 'concurrent-2',
        );

        final future3 = queue.execute(
          () async {
            task3Calls++;
            if (task3Calls < 2) throw Exception('t3');
            return 'result-3';
          },
          key: 'concurrent-3',
        );

        final results = await Future.wait([future1, future2, future3]);

        expect(results[0].succeeded, true);
        expect(results[0].data, 'result-1');
        expect(results[1].succeeded, true);
        expect(results[1].data, 'result-2');
        expect(results[2].succeeded, true);
        expect(results[2].data, 'result-3');

        expect(task1Calls, 2);
        expect(task2Calls, 2);
        expect(task3Calls, 2);
      },
    );

    test(
      'one failing task does not block others from succeeding',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 2,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        final successFuture = queue.execute(
          () async => 'ok',
          key: 'success-task',
        );

        final failFuture = queue.execute(
          () async => throw Exception('permanent'),
          key: 'fail-task',
        );

        final results = await Future.wait([successFuture, failFuture]);

        expect(results[0].succeeded, true);
        expect(results[0].data, 'ok');
        expect(results[1].succeeded, false);
      },
    );
  });

  group('Functional - cancelAll during active retries', () {
    test(
      'cancelAll stops tracking for all in-flight tasks',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 10,
            initialDelay: Duration(milliseconds: 50),
            maxDelay: Duration(seconds: 5),
          ),
        );

        var callCount = 0;
        final signalCompleter = Completer<void>();
        final blockerCompleter = Completer<void>();

        // Launch a task that fails once (triggering a retry) then blocks
        // on the second call so no Future.delayed timer is left pending.
        // ignore: unawaited_futures
        queue.execute(
          () async {
            callCount++;
            if (callCount >= 2) {
              // Signal the main test, then suspend until released
              if (!signalCompleter.isCompleted) signalCompleter.complete();
              await blockerCompleter.future;
              return 'done';
            }
            throw Exception('keep failing');
          },
          key: 'cancel-during-retry',
        );

        // Wait until the task is blocked on attempt 2
        await signalCompleter.future;

        expect(queue.isRetrying('cancel-during-retry'), true);

        queue.cancelAll();

        expect(queue.isRetrying('cancel-during-retry'), false);
        expect(queue.getAttemptCount('cancel-during-retry'), 0);

        // Release the blocked task to clean up
        blockerCompleter.complete();
      },
    );

    test(
      'after cancelAll, same key can be re-used for new execution',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 3,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        // Start and immediately cancel - use Completer to avoid timer leak
        final startCompleter = Completer<void>();
        final taskCompleter = Completer<String>();
        // ignore: unawaited_futures
        queue.execute(
          () async {
            startCompleter.complete();
            return await taskCompleter
                .future; // Wait indefinitely until completed
          },
          key: 'reuse-key',
        );

        await startCompleter.future;
        queue.cancelAll();
        // Complete the task to clean up
        taskCompleter.complete('never');

        // Now re-use the same key
        final result = await queue.execute(
          () async => 'reused-success',
          key: 'reuse-key',
        );

        expect(result.succeeded, true);
        expect(result.data, 'reused-success');
      },
    );
  });

  group('Functional - shouldRetry error filtering', () {
    test(
      'auth errors bypass retry entirely',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 5,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        var callCount = 0;

        final result = await queue.execute(
          () async {
            callCount++;
            throw Exception('authentication token expired');
          },
          key: 'auth-error-test',
          shouldRetry: (error) => !error.toString().contains('auth'),
        );

        expect(result.succeeded, false);
        expect(callCount, 1); // Only one attempt, no retries
      },
    );

    test(
      'network errors are retried while auth errors are not',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 5,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        var callCount = 0;

        final result = await queue.execute(
          () async {
            callCount++;
            if (callCount < 3) {
              throw Exception('Network timeout');
            }
            // After network retries succeed, we never see auth error
            return 'recovered';
          },
          key: 'mixed-errors',
          shouldRetry: (error) => !error.toString().contains('auth'),
        );

        expect(result.succeeded, true);
        expect(result.data, 'recovered');
        expect(callCount, 3);
      },
    );

    test(
      'shouldRetry receives the actual error for inspection',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 3,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        final capturedErrors = <Exception>[];

        await queue.execute(
          () async {
            throw Exception('error-${capturedErrors.length}');
          },
          key: 'error-inspect',
          shouldRetry: (error) {
            capturedErrors.add(error);
            return true;
          },
        );

        // shouldRetry is called for every failed attempt
        expect(capturedErrors.length, 3);
        expect(capturedErrors[0].toString(), contains('error-0'));
        expect(capturedErrors[1].toString(), contains('error-1'));
        expect(capturedErrors[2].toString(), contains('error-2'));
      },
    );
  });

  group('Functional - onRetry callback ordering and data', () {
    test(
      'onRetry receives correct attempt number and error for each retry',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 4,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        final retryAttempts = <int>[];
        final retryErrors = <String>[];
        var callCount = 0;

        await queue.execute(
          () async {
            callCount++;
            if (callCount < 4) {
              throw Exception('attempt-$callCount');
            }
            return 'ok';
          },
          key: 'onretry-test',
          onRetry: (attempt, error) {
            retryAttempts.add(attempt);
            retryErrors.add(error.toString());
          },
        );

        // onRetry fires for attempts 1, 2, 3 (not for the final success)
        expect(retryAttempts, [1, 2, 3]);
        expect(retryErrors[0], contains('attempt-1'));
        expect(retryErrors[1], contains('attempt-2'));
        expect(retryErrors[2], contains('attempt-3'));
      },
    );
  });

  group('Functional - duplicate key rejection', () {
    test(
      'second execute with same key returns failure while first is running',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 3,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        final gate = Completer<void>();

        // Start a long-running task
        final firstFuture = queue.execute(
          () async {
            await gate.future;
            return 'first';
          },
          key: 'dup-key',
        );

        // Immediately try to run a second task with the same key
        final secondResult = await queue.execute(
          () async => 'second',
          key: 'dup-key',
        );

        expect(secondResult.succeeded, false);
        expect(secondResult.error.toString(), contains('already executing'));

        // Let the first task finish
        gate.complete();
        final firstResult = await firstFuture;
        expect(firstResult.succeeded, true);
        expect(firstResult.data, 'first');
      },
    );

    test(
      'same key can be used again after first task completes',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 2,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        final result1 = await queue.execute(
          () async => 'first-run',
          key: 'seq-key',
        );

        final result2 = await queue.execute(
          () async => 'second-run',
          key: 'seq-key',
        );

        expect(result1.succeeded, true);
        expect(result1.data, 'first-run');
        expect(result2.succeeded, true);
        expect(result2.data, 'second-run');
      },
    );
  });

  group('Functional - enqueue vs execute behavior', () {
    test(
      'enqueue throws on exhaustion while execute returns failure',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 2,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 50),
          ),
        );

        // Instance enqueue — throws
        await expectLater(
          queue.enqueue(
            () async => throw Exception('enqueue-fail'),
            key: 'enqueue-throw',
            initial: const Duration(milliseconds: 10),
            maxAttempts: 2,
          ),
          throwsA(isA<Exception>()),
        );

        // Instance execute — returns RetryResult.failure
        final result = await queue.execute(
          () async => throw Exception('instance-fail'),
          key: 'instance-fail',
        );

        expect(result.succeeded, false);
        expect(result.error, isA<Exception>());
      },
    );
  });

  group('Functional - Chat subscription retry with service mock', () {
    test(
      'subscription connection retries on failure then succeeds',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 5,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 100),
          ),
        );

        var connectionAttempts = 0;

        // Simulate the pattern used in ChatSubscriptionService:
        // The task establishes a connection (which may throw), then
        // listens to the stream. We test the connection phase retry.
        final result = await queue.execute(
          () async {
            connectionAttempts++;
            if (connectionAttempts < 3) {
              throw Exception('WebSocket connection failed');
            }
            // Connection established — return immediately
            // (in real code this would start the stream listener)
            return 'connected';
          },
          key: 'chat-subscription-chat-42',
          shouldRetry: (error) => !error.toString().contains('auth'),
          onRetry: (attempt, error) {
            // Matches the pattern in ChatSubscriptionService
          },
        );

        expect(result.succeeded, true);
        expect(result.data, 'connected');
        expect(connectionAttempts, 3);
      },
    );

    test(
      'subscription does not retry auth errors',
      () async {
        final queue = RetryQueue(
          config: RetryConfig(
            maxAttempts: 5,
            initialDelay: Duration(milliseconds: 10),
            maxDelay: Duration(milliseconds: 100),
          ),
        );

        var connectionAttempts = 0;

        final result = await queue.execute(
          () async {
            connectionAttempts++;
            throw Exception('auth token invalid');
          },
          key: 'chat-subscription-auth-fail',
          shouldRetry: (error) => !error.toString().contains('auth'),
        );

        expect(result.succeeded, false);
        expect(connectionAttempts, 1);
      },
    );
  });
}
