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

  /// Initializes session refresher.
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

  // Guard to prevent concurrent refresh attempts.
  bool _isRefreshing = false;

  /// Asynchronously refreshes the user session.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: success status.
  Future<bool> refreshSession() async {
    if (_isRefreshing) return false;

    if (userConfig.loggedIn &&
        userConfig.currentUser.refreshToken != null &&
        userConfig.currentUser.refreshToken!.isNotEmpty) {
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
            // If it's the last attempt, clear tokens
            if (attempt == 2) {
              await _clearTokens();
              return false;
            }
            // Exponential backoff: 100ms, 200ms, 400ms
            await Future.delayed(Duration(milliseconds: 100 * (1 << attempt)));
          }
        }
      } finally {
        _isRefreshing = false;
      }
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
    // Clear tokens in secure storage and update user config
    await userConfig.updateAccessToken(accessToken: '', refreshToken: '');
    try {
      final userBox = Hive.box<User>('currentUser');
      final orgBox = Hive.box<OrgInfo>('currentOrg');
      final urlBox = Hive.box('url');

      await userBox.clear();
      await orgBox.clear();
      await urlBox.clear();
    } catch (_) {
      // Ignore errors during cleanup
    }
    userConfig.currentUser = User(id: 'null', authToken: 'null');
    userConfig.currentOrg = OrgInfo(name: 'Organization Name', id: 'null');
  }
}
