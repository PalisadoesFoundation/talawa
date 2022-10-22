import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// AppTheme class is a type of View Model to serve data from modal to views in the context of App Themes.
///
/// Methods include:
/// * `switchTheme`
class AppTheme extends BaseModel {
  final String key = "DynamicTheme";

  late SharedPreferences _pref;
  late bool _isDarkMode;
  bool get isdarkTheme => _isDarkMode;

  // initializer
  initialize() {
    _isDarkMode = true;
    _loadFromPrefs();
  }

  /// This function switches the app theme.
  ///
  /// * `Dart` -> `Light`
  /// * `Light` -> `Dark`
  switchTheme({required bool isOn}) {
    _isDarkMode = isOn;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isDarkMode = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _isDarkMode);
  }
}
