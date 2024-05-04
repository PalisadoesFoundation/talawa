import 'dart:async';

import 'package:talawa/locator.dart';

/// Manages user sessions and periodically refreshes access tokens.
class SessionManager {
  SessionManager() {
    initializeSessionRefresher();
  }

  /// returns refresh interval of Session Manager.
  int get refreshInterval => _refreshInterval;

  /// refresh interval in seconds.
  static const int _refreshInterval = 600;

  /// Initializes as session refresher.
  ///
  /// Invokes [refreshSession] periodically at regular
  /// refresh intervals.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Timer`: refresh timer.
  Timer initializeSessionRefresher() {
    return Timer.periodic(
      const Duration(seconds: _refreshInterval),
      (Timer timer) async {
        refreshSession();
      },
    );
  }

  /// Asynchronously refreshes the user session.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: indicates if session refresh was
  /// successful.
  Future<bool> refreshSession() async {
    if (userConfig.loggedIn && userConfig.currentUser.refreshToken != null) {
      final refreshed = await databaseFunctions
          .refreshAccessToken(userConfig.currentUser.refreshToken!);
      return refreshed;
    }
    return false;
  }
}
