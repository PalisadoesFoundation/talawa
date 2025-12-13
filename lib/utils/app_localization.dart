import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Provides methods to localize the application, making it available to users with different languages.
class AppLocalizations {
  /// Creates an [AppLocalizations] instance with the given [locale].
  ///
  /// **params**:
  /// * `locale`: The locale for localization
  /// * `isTest`: Whether this is being used in a test environment
  ///
  /// **returns**:
  ///   None
  AppLocalizations(
    this.locale, {
    this.isTest = false,
  });

  Map<String, String> _localizedStrings = {};

  /// The locale for localization.
  final Locale locale;

  /// Whether this is being used in a test environment.
  bool isTest;

  /// Helper method to keep the code in the widgets concise.
  ///
  /// **params**:
  /// * `context`: The build context
  ///
  /// **returns**:
  /// * `AppLocalizations?`: The AppLocalizations instance or null
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Static member to have a simple access to the delegate from the MaterialApp.
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  /// Loads localization for testing purposes.
  ///
  /// **params**:
  /// * `locale`: The locale to load for testing
  ///
  /// **returns**:
  ///   None
  Future<void> loadTest(Locale locale) async {
    isTest = true;
  }

  /// Loads the language JSON file from the "lang" folder.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: True if loading was successful
  Future<bool> load() async {
    final String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    if (jsonString.isEmpty) {
      _localizedStrings = {};
      return true;
    }
    final Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  /// Translates the given key to a localized string.
  ///
  /// **params**:
  /// * `key`: The translation key
  ///
  /// **returns**:
  /// * `String?`: The translated string or null
  String? translate(String? key) {
    if (key == null) {
      return '...';
    }
    if (isTest) return key;

    return _localizedStrings[key];
  }

  /// Translates the given key to a localized string, returning the key if not found.
  ///
  /// **params**:
  /// * `key`: The translation key
  ///
  /// **returns**:
  /// * `String`: The translated string or the key itself
  String strictTranslate(String key) {
    if (isTest) return key;

    final String translate = _localizedStrings[key] ?? key;
    return translate;
  }
}

/// Delegate for loading AppLocalizations.
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// Creates an [AppLocalizationsDelegate] instance.
  ///
  /// **params**:
  /// * `isTest`: Whether this is being used in a test environment
  ///
  /// **returns**:
  ///   None
  const AppLocalizationsDelegate({
    this.isTest = false,
  });

  /// Whether this is being used in a test environment.
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
