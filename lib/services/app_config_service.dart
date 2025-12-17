/// Service to manage app configuration and feature flags.
class AppConfigService {
  bool _isDemoMode = false;

  /// Returns whether the app is in demo mode.
  bool get isDemoMode => _isDemoMode;

  /// Sets the demo mode status.
  set isDemoMode(bool value) {
    _isDemoMode = value;
  }
}
