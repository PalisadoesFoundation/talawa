import 'dart:async';
import 'package:flutter/foundation.dart';

/// Type definition for retry tasks.
typedef Task<T> = Future<T> Function();

/// Configuration for retry behavior.
///
/// This class provides the following configuration options:
/// * `maxAttempts` : Maximum number of retry attempts.
/// * `initialDelay` : Initial delay before first retry.
/// * `maxDelay` : Maximum delay between retries.
/// * `backoffMultiplier` : Multiplier for exponential backoff.
class RetryConfig {
  /// Creates a RetryConfig with the specified parameters.
  ///
  /// **params**:
  /// * `maxAttempts`: Maximum number of retry attempts (default: 3).
  /// * `initialDelay`: Initial delay before first retry (default: 300ms).
  /// * `maxDelay`: Maximum delay between retries (default: 30s).
  /// * `backoffMultiplier`: Multiplier for exponential backoff (default: 2.0).
  RetryConfig({
    this.maxAttempts = 3,
    this.initialDelay = const Duration(milliseconds: 300),
    this.maxDelay = const Duration(seconds: 30),
    this.backoffMultiplier = 2.0,
  })  : assert(maxAttempts >= 1, 'maxAttempts must be at least 1'),
        assert(initialDelay.inMicroseconds >= 0,
            'initialDelay cannot be negative'),
        assert(maxDelay.inMicroseconds >= 0, 'maxDelay cannot be negative'),
        assert(maxDelay.inMicroseconds >= initialDelay.inMicroseconds,
            'maxDelay must be >= initialDelay'),
        assert(backoffMultiplier > 0.0, 'backoffMultiplier must be positive');

  /// Maximum number of retry attempts.
  final int maxAttempts;

  /// Initial delay before first retry.
  final Duration initialDelay;

  /// Maximum delay between retries.
  final Duration maxDelay;

  /// Multiplier for exponential backoff.
  final double backoffMultiplier;
}

/// Result wrapper for retry operations.
///
/// This is a discriminated union with two variants:
/// * `RetryResultSuccess<T>` : Successful result with guaranteed non-null data.
/// * `RetryResultFailure<T>` : Failed result with error information.
sealed class RetryResult<T> {
  const RetryResult();

  /// Creates a successful result with data.
  ///
  /// **params**:
  /// * `data`: The result data (non-null).
  factory RetryResult.success(T data) = RetryResultSuccess<T>;

  /// Creates a failure result with error.
  ///
  /// **params**:
  /// * `error`: The error that occurred.
  factory RetryResult.failure(Exception error) = RetryResultFailure<T>;

  /// Boolean indicating success or failure.
  bool get succeeded => this is RetryResultSuccess<T>;

  /// Get data if successful (null if failed).
  T? get data => switch (this) {
        RetryResultSuccess<T>(data: final d) => d,
        RetryResultFailure<T>() => null,
      };

  /// Get error if failed (null if successful).
  Exception? get error => switch (this) {
        RetryResultSuccess<T>() => null,
        RetryResultFailure<T>(error: final e) => e,
      };
}

/// Successful retry result with guaranteed non-null data.
final class RetryResultSuccess<T> extends RetryResult<T> {
  const RetryResultSuccess(this.data);

  /// The result data (guaranteed non-null).
  @override
  final T data;
}

/// Failed retry result with error information.
final class RetryResultFailure<T> extends RetryResult<T> {
  const RetryResultFailure(this.error);

  /// The error that occurred.
  @override
  final Exception error;
}

/// Service for handling retries with exponential backoff.
///
/// This class provides the following functionalities:
/// * `enqueue` : Method to enqueue and execute task with retry logic.
/// * `execute` : Method to execute task with full result wrapper.
/// * `isRetrying` : Check if a task is currently being retried.
/// * `getAttemptCount` : Get current attempt count for a task.
/// * `cancel` : Cancel a pending retry operation.
/// * `cancelAll` : Cancel all pending operations.
class RetryQueue {
  /// Creates a RetryQueue with the specified configuration.
  ///
  /// **params**:
  /// * `config`: The retry configuration (default: RetryConfig()).
  RetryQueue({RetryConfig? config}) : config = config ?? RetryConfig();

  /// The retry configuration.
  final RetryConfig config;

  /// Map of pending tasks.
  final Map<String, Task<dynamic>> _q = {};

  /// Map of attempt counts.
  final Map<String, int> _attemptCounts = {};

  /// Check if a task is currently being retried.
  ///
  /// **params**:
  /// * `key`: The unique key for the task.
  ///
  /// **returns**:
  /// * `bool`: True if the task is being retried.
  bool isRetrying(String key) => _q.containsKey(key);

  /// Get current attempt count for a task.
  ///
  /// **params**:
  /// * `key`: The unique key for the task.
  ///
  /// **returns**:
  /// * `int`: The current attempt count.
  int getAttemptCount(String key) => _attemptCounts[key] ?? 0;

  /// Enqueue and execute task with retry logic (instance method).
  ///
  /// This is a thin wrapper around execute() that unwraps the RetryResult.
  ///
  /// **params**:
  /// * `task`: The task to execute.
  /// * `key`: Unique key for the task.
  /// * `initial`: Initial delay before first retry (default: 300ms).
  /// * `maxAttempts`: Maximum number of retry attempts (default: 3).
  ///
  /// **returns**:
  /// * `Future<T>`: The result of the task.
  Future<T> enqueue<T>(
    Task<T> task, {
    required String key,
    Duration initial = const Duration(milliseconds: 300),
    int maxAttempts = 3,
  }) async {
    // Create custom config from parameters
    // Ensure maxDelay is at least as large as initialDelay
    final effectiveMaxDelay =
        config.maxDelay.inMicroseconds >= initial.inMicroseconds
            ? config.maxDelay
            : initial;

    final customConfig = RetryConfig(
      maxAttempts: maxAttempts,
      initialDelay: initial,
      maxDelay: effectiveMaxDelay,
      backoffMultiplier: config.backoffMultiplier,
    );

    // Call execute and unwrap the result
    final result = await execute<T>(
      task,
      key: key,
      customConfig: customConfig,
    );

    // Unwrap RetryResult using pattern matching: return data on success, throw error on failure
    return switch (result) {
      RetryResultSuccess<T>(data: final data) => data,
      RetryResultFailure<T>(error: final error) => throw error,
    };
  }

  /// Execute task with full result wrapper.
  ///
  /// **params**:
  /// * `task`: The task to execute.
  /// * `key`: Unique key for the task.
  /// * `customConfig`: Optional custom retry configuration.
  /// * `onRetry`: Optional callback called on each retry attempt.
  /// * `shouldRetry`: Optional callback to determine if error should be retried.
  ///
  /// **returns**:
  /// * `Future<RetryResult<T>>`: The result wrapper.
  Future<RetryResult<T>> execute<T>(
    Task<T> task, {
    required String key,
    RetryConfig? customConfig,
    void Function(int attempt, Exception error)? onRetry,
    bool Function(Exception)? shouldRetry,
  }) async {
    final cfg = customConfig ?? config;
    if (_q.containsKey(key)) {
      return RetryResult.failure(Exception('Task $key already executing'));
    }

    _q[key] = task;
    _attemptCounts[key] = 0;
    Duration currentDelay = cfg.initialDelay;
    Exception? lastError;

    try {
      for (int attempt = 1; attempt <= cfg.maxAttempts; attempt++) {
        _attemptCounts[key] = attempt;

        // Check for cancellation before each attempt
        if (!_q.containsKey(key)) {
          return RetryResult.failure(Exception('Task $key was cancelled'));
        }

        try {
          final result = await task();
          _cleanup(key);
          return RetryResult.success(result);
        } catch (e) {
          lastError = e is Exception ? e : Exception(e.toString());
          final canRetry = shouldRetry?.call(lastError) ?? true;
          if (!canRetry || attempt >= cfg.maxAttempts) break;

          onRetry?.call(attempt, lastError);
          debugPrint(
            'RetryQueue: Attempt $attempt failed for $key, '
            'retrying in $currentDelay',
          );
          await Future.delayed(currentDelay);

          // Check for cancellation after delay
          if (!_q.containsKey(key)) {
            return RetryResult.failure(Exception('Task $key was cancelled'));
          }

          currentDelay = Duration(
            milliseconds:
                (currentDelay.inMilliseconds * cfg.backoffMultiplier).toInt(),
          );
          if (currentDelay > cfg.maxDelay) currentDelay = cfg.maxDelay;
        }
      }
    } finally {
      // Ensure cleanup only if task is still registered
      if (_q.containsKey(key)) {
        _cleanup(key);
      }
    }
    return RetryResult.failure(lastError ?? Exception('Unknown error'));
  }

  /// Clean up task from maps.
  ///
  /// **params**:
  /// * `key`: The unique key for the task.
  ///
  /// **returns**:
  ///   None
  void _cleanup(String key) {
    _q.remove(key);
    _attemptCounts.remove(key);
  }

  /// Cancel a pending retry operation.
  ///
  /// **params**:
  /// * `key`: The unique key for the task.
  ///
  /// **returns**:
  ///   None
  void cancel(String key) => _cleanup(key);

  /// Cancel all pending operations.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void cancelAll() {
    _q.clear();
    _attemptCounts.clear();
  }
}
