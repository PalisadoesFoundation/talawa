// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///This class provides methods to localize the application so that it can be available
///to users with different languages.
class AppLocalizations {
  AppLocalizations(
    this.locale, {
    this.isTest = false,
  });

  late Map<String, String> _localizedStrings;
  final Locale locale;
  bool isTest;

  // Helper method to keep the code in the widgets concise
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

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
  String? translate(String? key) {
    if (isTest) return key;

    // ignore: unnecessary_null_comparison
    if (key == null) {
      return '...';
    }
    return _localizedStrings[key];
  }

  // This method will be called from every widget which needs a localized text
  String strictTranslate(String key) {
    if (isTest) return key;

    // ignore: unnecessary_null_comparison
    if (key == null) {
      return '...';
    }

    final String translate = _localizedStrings[key] ?? key;
    return translate;
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
    return ['en', 'es', 'fr', 'hi', 'zh', 'de', 'ja', 'pt']
        .contains(locale.languageCode);
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
