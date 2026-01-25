import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';

/// Wrapper around [FlutterWindowManagerPlus] to allow mocking in tests.
class WindowManagerWrapper {
  /// This function is used to add flags to the window.
  ///
  /// **params**:
  /// * `flags`: The bitmask of flags to add.
  ///
  /// **returns**:
  /// * `Future<bool>`: True if successful, false otherwise.
  Future<bool> addFlags(int flags) => FlutterWindowManagerPlus.addFlags(flags);

  /// This function is used to clear flags from the window.
  ///
  /// **params**:
  /// * `flags`: The bitmask of flags to clear.
  ///
  /// **returns**:
  /// * `Future<bool>`: True if successful, false otherwise.
  Future<bool> clearFlags(int flags) =>
      FlutterWindowManagerPlus.clearFlags(flags);
}

/// Service to handle window security flags, primarily for blocking screenshots.
class SecurityService {
  /// Constructor for [SecurityService].
  ///
  /// **params**:
  /// * `isAndroid`: Optional override for Android platform check (for testing).
  /// * `windowManager`: Optional override for [WindowManagerWrapper] (for testing).
  SecurityService({
    bool? isAndroid,
    WindowManagerWrapper? windowManager,
  })  : _isAndroid = isAndroid ?? (!kIsWeb && Platform.isAndroid),
        _windowManager = windowManager ?? WindowManagerWrapper();

  final bool _isAndroid;
  final WindowManagerWrapper _windowManager;

  /// Enables secure mode by setting the FLAG_SECURE on the window.
  ///
  /// This prevents screenshots and screen recordings on Android.
  /// This method only works on Android devices, not on Web or iOS.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> enableSecure() async {
    if (_isAndroid) {
      try {
        await _windowManager.addFlags(FlutterWindowManagerPlus.FLAG_SECURE);
      } catch (e) {
        debugPrint('Error enabling secure mode: $e');
      }
    }
  }

  /// Disables secure mode by clearing the FLAG_SECURE on the window.
  ///
  /// This allows screenshots and screen recordings again.
  /// This method only works on Android devices, not on Web or iOS.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> disableSecure() async {
    if (_isAndroid) {
      try {
        await _windowManager.clearFlags(FlutterWindowManagerPlus.FLAG_SECURE);
      } catch (e) {
        debugPrint('Error disabling secure mode: $e');
      }
    }
  }
}
