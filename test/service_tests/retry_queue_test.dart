import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/retry_queue.dart';

void main() {
  group('RetryConfig', () {
    test('should have correct default values', () {
      const config = RetryConfig();

      expect(config.maxAttempts, 3);
      expect(config.initialDelay, const Duration(milliseconds: 300));
      expect(config.maxDelay, const Duration(seconds: 30));
      expect(config.backoffMultiplier, 2.0);
    });

    test('should accept custom values', () {
      const config = RetryConfig(
        maxAttempts: 5,
        initialDelay: Duration(milliseconds: 100),
        maxDelay: Duration(seconds: 60),
        backoffMultiplier: 3.0,
      );

      expect(config.maxAttempts, 5);
      expect(config.initialDelay, const Duration(milliseconds: 100));
      expect(config.maxDelay, const Duration(seconds: 60));
      expect(config.backoffMultiplier, 3.0);
    });
  });

  group('RetryResult', () {
    test('success constructor sets correct values', () {
      final result = RetryResult<String>.success('test data');

      expect(result.succeeded, true);
      expect(result.data, 'test data');
      expect(result.error, null);
    });

    test('failure constructor sets correct values', () {
      final exception = Exception('test error');
      final result = RetryResult<String>.failure(exception);

      expect(result.succeeded, false);
      expect(result.data, null);
      expect(result.error, exception);
    });
  });

  group('RetryQueue', () {
    late RetryQueue retryQueue;

    setUp(() {
      retryQueue = RetryQueue(
        config: const RetryConfig(
          maxAttempts: 3,
          initialDelay: Duration(milliseconds: 10),
          maxDelay: Duration(milliseconds: 100),
        ),
      );
    });

    test('successful task returns immediately', () async {
      int callCount = 0;
      final result = await retryQueue.execute(
        () async {
          callCount++;
          return 'success';
        },
        key: 'test-1',
      );

      expect(result.succeeded, true);
      expect(result.data, 'success');
      expect(callCount, 1);
    });

    test('retries on failure and succeeds', () async {
      int callCount = 0;
      final result = await retryQueue.execute(
        () async {
          callCount++;
          if (callCount < 3) {
            throw Exception('Temporary error');
          }
          return 'success';
        },
        key: 'test-2',
      );

      expect(result.succeeded, true);
      expect(result.data, 'success');
      expect(callCount, 3);
    });

    test('fails after max attempts exceeded', () async {
      int callCount = 0;
      final result = await retryQueue.execute(
        () async {
          callCount++;
          throw Exception('Permanent error');
        },
        key: 'test-3',
      );

      expect(result.succeeded, false);
      expect(result.error, isA<Exception>());
      expect(callCount, 3);
    });

    test('respects shouldRetry callback returning false', () async {
      int callCount = 0;
      final result = await retryQueue.execute(
        () async {
          callCount++;
          throw Exception('No retry error');
        },
        key: 'test-4',
        shouldRetry: (_) => false,
      );

      expect(result.succeeded, false);
      expect(callCount, 1);
    });

    test('respects shouldRetry callback returning true', () async {
      int callCount = 0;
      final result = await retryQueue.execute(
        () async {
          callCount++;
          if (callCount < 2) {
            throw Exception('Retry this error');
          }
          return 'success';
        },
        key: 'test-5',
        shouldRetry: (_) => true,
      );

      expect(result.succeeded, true);
      expect(callCount, 2);
    });

    test('calls onRetry callback on each retry', () async {
      final attempts = <int>[];
      final errors = <Exception>[];

      await retryQueue.execute(
        () async {
          if (attempts.length < 2) {
            throw Exception('Error ${attempts.length}');
          }
          return 'ok';
        },
        key: 'test-6',
        onRetry: (attempt, error) {
          attempts.add(attempt);
          errors.add(error);
        },
      );

      expect(attempts, [1, 2]);
      expect(errors.length, 2);
    });

    test('prevents duplicate executions with same key', () async {
      final completer = Completer<void>();

      // Start a task that won't complete until we signal it
      final future1 = retryQueue.execute(
        () async {
          await completer.future;
          return 'first';
        },
        key: 'dup-test',
      );

      // Try to start another task with the same key
      final result2 = await retryQueue.execute(
        () async => 'second',
        key: 'dup-test',
      );

      // Second task should fail immediately
      expect(result2.succeeded, false);
      expect(result2.error.toString(), contains('already executing'));

      // Complete the first task
      completer.complete();
      final result1 = await future1;
      expect(result1.succeeded, true);
      expect(result1.data, 'first');
    });

    test('isRetrying tracks execution state correctly', () async {
      final completer = Completer<void>();

      expect(retryQueue.isRetrying('state-key'), false);

      final future = retryQueue.execute(
        () async {
          await completer.future;
          return 'done';
        },
        key: 'state-key',
      );

      expect(retryQueue.isRetrying('state-key'), true);

      completer.complete();
      await future;

      expect(retryQueue.isRetrying('state-key'), false);
    });

    test('getAttemptCount returns correct count during execution', () async {
      int maxAttemptSeen = 0;

      await retryQueue.execute(
        () async {
          maxAttemptSeen = retryQueue.getAttemptCount('count-key');
          if (maxAttemptSeen < 2) {
            throw Exception('Need more attempts');
          }
          return 'done';
        },
        key: 'count-key',
      );

      expect(maxAttemptSeen, 2);
    });

    test('getAttemptCount returns 0 for non-existent key', () {
      expect(retryQueue.getAttemptCount('non-existent'), 0);
    });

    test('cancel removes task from queue', () async {
      final completer = Completer<void>();

      // ignore: unawaited_futures
      retryQueue.execute(
        () async {
          await completer.future;
          return 'done';
        },
        key: 'cancel-key',
      );

      expect(retryQueue.isRetrying('cancel-key'), true);

      retryQueue.cancel('cancel-key');

      expect(retryQueue.isRetrying('cancel-key'), false);

      // Complete to avoid pending future issues
      completer.complete();
      // Note: The task may still complete since cancel only clears tracking
    });

    test('cancelAll removes all tasks', () async {
      final completer1 = Completer<void>();
      final completer2 = Completer<void>();

      // ignore: unawaited_futures
      retryQueue.execute(
        () async {
          await completer1.future;
          return 'task1';
        },
        key: 'cancel-all-1',
      );

      // ignore: unawaited_futures
      retryQueue.execute(
        () async {
          await completer2.future;
          return 'task2';
        },
        key: 'cancel-all-2',
      );

      expect(retryQueue.isRetrying('cancel-all-1'), true);
      expect(retryQueue.isRetrying('cancel-all-2'), true);

      retryQueue.cancelAll();

      expect(retryQueue.isRetrying('cancel-all-1'), false);
      expect(retryQueue.isRetrying('cancel-all-2'), false);

      // Complete to avoid pending future issues
      completer1.complete();
      completer2.complete();
    });

    test('respects custom config override', () async {
      int callCount = 0;
      final result = await retryQueue.execute(
        () async {
          callCount++;
          throw Exception('Error');
        },
        key: 'custom-config',
        customConfig: const RetryConfig(
          maxAttempts: 5,
          initialDelay: Duration(milliseconds: 5),
        ),
      );

      expect(result.succeeded, false);
      expect(callCount, 5); // Should use custom maxAttempts
    });

    test('handles non-Exception errors gracefully', () async {
      final result = await retryQueue.execute(
        () async {
          throw 'String error'; // Not an Exception
        },
        key: 'string-error',
      );

      expect(result.succeeded, false);
      expect(result.error, isA<Exception>());
    });

    test('exponential backoff respects maxDelay', () async {
      // This test verifies the delay capping logic works
      // We use a short config to speed up the test
      final fastQueue = RetryQueue(
        config: const RetryConfig(
          maxAttempts: 5,
          initialDelay: Duration(milliseconds: 50),
          maxDelay: Duration(milliseconds: 100),
          backoffMultiplier: 3.0,
        ),
      );

      final stopwatch = Stopwatch()..start();
      int callCount = 0;

      await fastQueue.execute(
        () async {
          callCount++;
          throw Exception('Error');
        },
        key: 'backoff-test',
      );

      stopwatch.stop();

      // With 5 attempts, delays would be: 50, 150 (capped to 100), 300 (capped to 100), 900 (capped to 100)
      // Total delay should be around 350ms (50 + 100 + 100 + 100)
      expect(callCount, 5);
      // Verify minimum elapsed time to ensure backoff occurred (with margin)
      expect(stopwatch.elapsed, greaterThanOrEqualTo(const Duration(milliseconds: 300)));
    });
  });

  group('RetryQueue.enqueue (instance method)', () {
    late RetryQueue retryQueue;

    setUp(() {
      retryQueue = RetryQueue(
        config: const RetryConfig(
          maxAttempts: 3,
          initialDelay: Duration(milliseconds: 10),
          maxDelay: Duration(milliseconds: 100),
        ),
      );
    });

    test('successful execution returns result', () async {
      int count = 0;
      final result = await retryQueue.enqueue(
        () async {
          count++;
          return 'enqueue-success';
        },
        key: 'enqueue-test-1',
      );

      expect(result, 'enqueue-success');
      expect(count, 1);
    });

    test('retries and succeeds', () async {
      int count = 0;
      final result = await retryQueue.enqueue(
        () async {
          count++;
          if (count < 2) throw Exception('Temp');
          return 'success';
        },
        key: 'enqueue-test-2',
        initial: const Duration(milliseconds: 10),
      );

      expect(result, 'success');
      expect(count, 2);
    });

    test('throws after max retries', () async {
      expect(
        () async => retryQueue.enqueue(
          () async {
            throw Exception('Always fail');
          },
          key: 'enqueue-test-3',
          initial: const Duration(milliseconds: 10),
          maxAttempts: 3,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('respects custom maxAttempts', () async {
      int count = 0;

      try {
        await retryQueue.enqueue(
          () async {
            count++;
            throw Exception('Fail');
          },
          key: 'enqueue-test-4',
          initial: const Duration(milliseconds: 5),
          maxAttempts: 5,
        );
      } catch (_) {
        // Expected
      }

      expect(count, 5);
    });
  });
}
