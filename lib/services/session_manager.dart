import 'dart:async';

import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// Manages user sessions and periodically refreshes access tokens.
class SessionManager {
  SessionManager() {
    initializeSessionRefresher();
  }

  /// returns refresh interval of Session Manager.
  int get refreshInterval => _refreshInterval;

  /// refresh interval in seconds.
  static const int _refreshInterval = 600;

  /// Guard to prevent concurrent refresh attempts
  bool _isRefreshing = false;

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
      (Timer timer) {
        refreshSession();
      },
    );
  }

  /// Asynchronously refreshes the user session with retries and error handling.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: indicates if session refresh was
  /// successful.
  Future<bool> refreshSession() async {
    if (_isRefreshing) return false;

    if (!userConfig.loggedIn || userConfig.currentUser.refreshToken == null) {
      return false;
    }

    _isRefreshing = true;

    try {
      for (var attempt = 0; attempt < 3; attempt++) {
        try {
          final refreshed = await databaseFunctions
              .refreshAccessToken(userConfig.currentUser.refreshToken!);

          if (refreshed) {
            return true;
          } else {
            throw Exception('Failed to refresh token');
          }
        } catch (e) {
          await Future.delayed(Duration(milliseconds: 100 * (1 << attempt)));

          if (attempt == 2) {
            await _clearTokens();
            return false;
          }
        }
      }
    } finally {
      _isRefreshing = false;
    }
    return false;
  }

  /// Clears user tokens and session data on unrecoverable errors.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _clearTokens() async {
    try {
      final userBox = Hive.box<User>('currentUser');
      final orgBox = Hive.box<OrgInfo>('currentOrg');

      await userBox.clear();
      await orgBox.clear();

      userConfig.currentUser = User(id: null, authToken: null);
      userConfig.currentOrg = OrgInfo(name: 'Organization Name', id: null);
    } catch (_) {}
  }
}
