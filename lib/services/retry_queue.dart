import 'dart:async';
import 'package:flutter/material.dart';

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
  const RetryConfig({
    this.maxAttempts = 3,
    this.initialDelay = const Duration(milliseconds: 300),
    this.maxDelay = const Duration(seconds: 30),
    this.backoffMultiplier = 2.0,
  });

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
/// This class wraps the result of a retry operation, providing:
/// * `data` : The result data if successful.
/// * `error` : The error if failed.
/// * `succeeded` : Boolean indicating success or failure.
class RetryResult<T> {
  /// Creates a successful result with data.
  ///
  /// **params**:
  /// * `data`: The result data.
  RetryResult.success(this.data)
      : error = null,
        succeeded = true;

  /// Creates a failure result with error.
  ///
  /// **params**:
  /// * `error`: The error that occurred.
  RetryResult.failure(this.error)
      : data = null,
        succeeded = false;

  /// The result data if successful.
  final T? data;

  /// The error if failed.
  final Exception? error;

  /// Boolean indicating success or failure.
  final bool succeeded;
}

/// Service for handling retries with exponential backoff.
///
/// This class provides the following functionalities:
/// * `enqueue` : Static method to enqueue and execute task with retry logic.
/// * `execute` : Instance method to execute task with full result wrapper.
/// * `isRetrying` : Check if a task is currently being retried.
/// * `getAttemptCount` : Get current attempt count for a task.
/// * `cancel` : Cancel a pending retry operation.
/// * `cancelAll` : Cancel all pending operations.
class RetryQueue {
  /// Creates a RetryQueue with the specified configuration.
  ///
  /// **params**:
  /// * `config`: The retry configuration (default: RetryConfig()).
  RetryQueue({this.config = const RetryConfig()});

  /// The retry configuration.
  final RetryConfig config;

  /// Map of pending tasks.
  static final Map<String, Task<dynamic>> _q = {};

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

  /// Enqueue and execute task with retry logic (static method).
  ///
  /// This method matches the starter code signature from the issue.
  ///
  /// **params**:
  /// * `task`: The task to execute.
  /// * `key`: Unique key for the task.
  /// * `initial`: Initial delay before first retry (default: 300ms).
  /// * `maxAttempts`: Maximum number of retry attempts (default: 3).
  ///
  /// **returns**:
  /// * `Future<T>`: The result of the task.
  static Future<T> enqueue<T>(
    Task<T> task, {
    required String key,
    Duration initial = const Duration(milliseconds: 300),
    int maxAttempts = 3,
  }) async {
    _q[key] = task;
    var delay = initial;
    for (var i = 0; i < maxAttempts; i++) {
      try {
        final r = await task();
        _q.remove(key);
        return r;
      } catch (_) {
        if (i < maxAttempts - 1) {
          await Future.delayed(delay);
          delay *= 2;
        }
      }
    }
    _q.remove(key);
    throw Exception('Max retries exceeded for task: $key');
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

          currentDelay = Duration(
            milliseconds:
                (currentDelay.inMilliseconds * cfg.backoffMultiplier).toInt(),
          );
          if (currentDelay > cfg.maxDelay) currentDelay = cfg.maxDelay;
        }
      }
    } finally {
      _cleanup(key);
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
