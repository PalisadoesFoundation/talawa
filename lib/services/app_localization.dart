import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(
    this.locale, {
    this.isTest = false,
  });
  final Locale locale;
  bool isTest;

  // Helper method to keep the code in the widgets concise
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<AppLocalizations> loadTest(Locale locale) async {
    return AppLocalizations(locale);
  }

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    final String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    if (isTest) return key;

    if (key == null) {
      return '...';
    }
    return _localizedStrings[key];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate({
    this.isTest = false,
  });
  final bool isTest;

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es', 'fr', 'hi', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    final AppLocalizations localizations =
        AppLocalizations(locale, isTest: isTest);
    if (isTest) {
      await localizations.loadTest(locale);
    } else {
      await localizations.load();
    }

    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
