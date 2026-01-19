import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

/// Service to handle window security flags, primarily for blocking screenshots.
class SecurityService {
  final bool _isAndroid;

  SecurityService({bool? isAndroid})
      : _isAndroid = isAndroid ?? (!kIsWeb && Platform.isAndroid);

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
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
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
      await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }
}
