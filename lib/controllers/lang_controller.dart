import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');
  final Preferences _pref = Preferences();

  Locale get appLocal => _appLocale ?? const Locale("en");

  /// For test cases
  testLocale() {
    _appLocale = const Locale('en');
    return Null;
  }

  /// Fetch last session language
  Future<void> fetchLocale() async {
    final String langCode = await _pref.getCurrentLanguage();

    if (langCode == null) {
      _appLocale = const Locale('en');
      //notifyListeners();
    }
    _appLocale = Locale(langCode);
    //notifyListeners();
  }

  /// Change App Language
  Future<void> changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }

    if (type == const Locale("es")) {
      //If selected language is spanish
      _appLocale = const Locale("es");
      await _pref.saveLanguage('es', 'ES');
    } else if (type == const Locale("fr")) {
      //If selected language is french
      _appLocale = const Locale("fr");
      await _pref.saveLanguage('fr', 'FR');
    } else if (type == const Locale("hi")) {
      //If selected language is hindi
      _appLocale = const Locale("hi");
      await _pref.saveLanguage('hi', 'IN');
    } else if (type == const Locale("zh")) {
      //If selected language is Chinese
      _appLocale = const Locale("zh");
      await _pref.saveLanguage('zh', 'CN');
    } else {
      //If selected language is english
      _appLocale = const Locale("en");
      await _pref.saveLanguage('en', 'US');
    }
    notifyListeners();
  }
}
