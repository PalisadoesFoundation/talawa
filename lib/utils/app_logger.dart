import 'package:flutter/foundation.dart';

/// Minimal level-gated logger.
///
/// `info` is silenced by default to keep `flutter run` output focused on
/// warnings and errors. Lower [_minLevel] when debugging.
class AppLog {
  static const int _info = 0;
  static const int _warn = 1;
  static const int _error = 2;

  /// Minimum level that gets emitted. Set to [_info] for verbose output.
  static const int _minLevel = _warn;

  /// Emit an informational message (silenced unless [_minLevel] is lowered).
  ///
  /// **params**:
  /// * `message`: Text to log.
  ///
  /// **returns**:
  ///   None
  static void info(String message) {
    if (_minLevel <= _info) {
      debugPrint(message);
    }
  }

  /// Emit a warning message prefixed with `WARN:`.
  ///
  /// **params**:
  /// * `message`: Text to log.
  ///
  /// **returns**:
  ///   None
  static void warn(String message) {
    if (_minLevel <= _warn) {
      debugPrint('WARN: $message');
    }
  }

  /// Emit an error message prefixed with `ERROR:` plus optional context.
  ///
  /// **params**:
  /// * `message`: Text to log.
  /// * `error`: Optional caught exception or error value to append.
  /// * `stack`: Optional stack trace to print after the message.
  ///
  /// **returns**:
  ///   None
  static void error(String message, [Object? error, StackTrace? stack]) {
    if (_minLevel > _error) return;
    debugPrint('ERROR: $message${error != null ? ' | $error' : ''}');
    if (stack != null) debugPrint(stack.toString());
  }
}
