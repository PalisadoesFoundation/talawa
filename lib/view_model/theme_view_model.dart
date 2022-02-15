import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/view_model/base_view_model.dart';

class AppTheme extends BaseModel {
  final String key = "DynamicTheme";

  late SharedPreferences _pref;
  late bool _isDarkMode;
  bool get isdarkTheme => _isDarkMode;

  initialize() {
    _isDarkMode = true;
    _loadFromPrefs();
  }

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
