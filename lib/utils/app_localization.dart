<<<<<<< HEAD
// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///This class provides methods to localize the application so that it can be available
///to users with different languages.
class AppLocalizations {
=======
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talawa/services/parsers/json_parser.dart';

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
>>>>>>> upstream/develop
  AppLocalizations(
    this.locale, {
    this.isTest = false,
  });

<<<<<<< HEAD
  late Map<String, String> _localizedStrings;
  final Locale locale;
  bool isTest;

  // Helper method to keep the code in the widgets concise
=======
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
>>>>>>> upstream/develop
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

<<<<<<< HEAD
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
=======
  /// Static member to have a simple access to the delegate from the MaterialApp.
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  /// Loads localization for testing purposes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> loadTest() async {
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
    final Map<String, dynamic> jsonMap =
        await compute(parseJsonToMap, jsonString);
>>>>>>> upstream/develop

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

<<<<<<< HEAD
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

=======
  /// Translates the given key to a localized string.
  ///
  /// Returns `null` if the key is not found in the localization map.
  /// For a non-null fallback, use [strictTranslate] instead.
  ///
  /// **params**:
  /// * `key`: The translation key
  ///
  /// **returns**:
  /// * `String?`: The translated string or null if not found
  String? translate(String? key) {
    if (key == null) {
      return '...';
    }
    if (isTest) return key;

    return _localizedStrings[key];
  }

  /// Translates the given key to a localized string, returning the key if not found.
  ///
  /// Unlike [translate], this method never returns null. If the key is not found,
  /// the key itself is returned as a fallback.
  ///
  /// **params**:
  /// * `key`: The translation key
  ///
  /// **returns**:
  /// * `String`: The translated string or the key itself as fallback
  String strictTranslate(String key) {
    if (isTest) return key;

>>>>>>> upstream/develop
    final String translate = _localizedStrings[key] ?? key;
    return translate;
  }
}

<<<<<<< HEAD
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate({
    this.isTest = false,
  });
=======
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
>>>>>>> upstream/develop
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
<<<<<<< HEAD
      await localizations.loadTest(locale);
=======
      await localizations.loadTest();
>>>>>>> upstream/develop
    } else {
      await localizations.load();
    }

    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
