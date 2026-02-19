import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ViewModel for managing app theme (light/dark mode).
///
/// Responsibilities:
/// - Store and retrieve theme preference from SharedPreferences
/// - Provide current ThemeData
/// - Switch theme dynamically and notify listeners
class AppTheme extends BaseModel {
  /// Key used for storing theme preference.
  static const String _prefKey = "DynamicTheme";

  late SharedPreferences _prefs;
  bool _isDarkMode = true;

  /// Getter for dark theme status.
  bool get isDarkTheme => _isDarkMode;

  /// Getter for the current theme.
  ThemeData get theme => isDarkTheme ? TalawaTheme.darkTheme : TalawaTheme.lightTheme;

  /// Initializes theme from SharedPreferences.
  ///
  /// Should be called during app startup.
  Future<void> initialize() async {
    await _loadFromPrefs();
  }

  /// Switches the theme to the given state.
  ///
  /// **params**:
  /// - `isOn`: `true` for dark mode, `false` for light mode
  void switchTheme({required bool isOn}) {
    _isDarkMode = isOn;
    _saveToPrefs();
    notifyListeners();
  }

  /// Loads theme preference from SharedPreferences.
  Future<void> _loadFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkMode = _prefs.getBool(_prefKey) ?? true;
    notifyListeners();
  }

  /// Saves current theme preference to SharedPreferences.
  Future<void> _saveToPrefs() async {
    _prefs = _prefs ?? await SharedPreferences.getInstance();
    await _prefs.setBool(_prefKey, _isDarkMode);
  }
}
