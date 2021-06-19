import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;
  testLocale() {
    _appLocale = const Locale('en');
    return Null;
  }

  fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String langCode = prefs.getString('language_code') ?? 'en';
    print(langCode);
    _appLocale = Locale(langCode);
    return Null;
  }

  Future<void> changeLanguage(Locale type) async {
    final prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }

    if (type == const Locale("es")) {
      //If selected language is spanish
      _appLocale = const Locale("es");
      await prefs.setString('language_code', 'es');
      await prefs.setString('countryCode', 'ES');
    } else if (type == const Locale("fr")) {
      //If selected language is french
      _appLocale = const Locale("fr");
      await prefs.setString('language_code', 'fr');
      await prefs.setString('countryCode', 'FR');
    } else if (type == const Locale("hi")) {
      //If selected language is hindi
      _appLocale = const Locale("hi");
      await prefs.setString('language_code', 'hi');
      await prefs.setString('countryCode', 'IN');
    } else if (type == const Locale("zh")) {
      //If selected language is Chinese
      _appLocale = const Locale("zh");
      await prefs.setString('language_code', 'zh');
      await prefs.setString('countryCode', 'CN');
    } else {
      //If selected language is english
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}
