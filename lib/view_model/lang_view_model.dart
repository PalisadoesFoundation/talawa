import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';

class AppLanguage extends BaseModel {
  AppLanguage({this.isTest = false});
  final bool isTest;

  Locale _appLocale = const Locale('en');
  Locale get appLocal => _appLocale;

  initialize() {
    fetchLocale();
  }

  fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String langCode = prefs.getString('language_code') ?? 'en';
    _appLocale = Locale(langCode);
    notifyListeners();
    return Null;
  }

  Future<void> changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }

    if (isTest) {
      _appLocale = type;
    } else {
      final prefs = await SharedPreferences.getInstance();
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
    }

    notifyListeners();
  }

  Future<void> appLanguageQuery() async {
    try {
      await databaseFunctions.gqlAuthQuery(queries.userLanguage());
    } catch (e) {
      print(e);
    }
  }

  Future<void> userLanguageQuery(String userId) async {
    try {
      await databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId));
    } catch (e) {
      print(e);
    }
  }
}
