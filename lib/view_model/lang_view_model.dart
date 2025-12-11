import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// AppLanguage view model class interact with modal in the context of the App Language.
///
/// The class provides methods that set's the language, change the language in the modal.
///
/// Methods include:
/// * `fetchLocale`
/// * `changeLanguage`
/// * `selectLanguagePress`
/// * `dbLanguageUpdate`
/// * `appLanguageQuery`
/// * `userLanguageQuery`
class AppLanguage extends BaseModel {
  AppLanguage({this.isTest = false});

  /// Represents a boolean value indicating whether the current environment is a test environment.
  final bool isTest;

  /// A service that provides navigation-related functionalities.
  final navigationService = locator<NavigationService>();

  /// Functions related to database mutations.
  final databaseFunctions = locator<DataBaseMutationFunctions>();

  late Locale _appLocale;

  /// getter for appLocal.
  Locale get appLocal => _appLocale;

  /// initialiser.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialize() async {
    _appLocale = const Locale('en');
    await fetchLocale();
  }

  /// This function fetch the language of the user's app.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String langCode = prefs.getString('language_code') ?? 'en';
    _appLocale = Locale(langCode);

    notifyListeners();
  }

  /// This function fetches the appropriate locale for the user's app based on the provided locale and supported locales.
  ///
  /// **params**:
  /// * `locale`: (`Locale?`): The locale to be resolved. Can be null.
  /// * `supportedLocales`: (`Iterable<Locale>`): The list of supported locales in the app.
  ///
  /// **returns**:
  /// * `Locale`: The resolved locale that matches either the language code or the country code of the provided locale.
  ///              If no match is found or the provided locale is null, the first supported locale is returned.
  Locale localeResoultion(Locale? locale, Iterable<Locale> supportedLocales) {
    if (locale == null) {
      debugPrint("*language locale is null!!!");
      return supportedLocales.first;
    }
    for (final Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode ||
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  /// This function change the app default language.
  ///
  /// **params**:
  /// * `type`: `Locale` type, the language need to be updated with.
  ///
  /// **returns**:
  ///   None
  Future<void> changeLanguage(Locale type) async {
    // if the app language is of same [type].
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
      } else if (type == const Locale("de")) {
        //If selected language is Chinese
        _appLocale = const Locale("de");
        await prefs.setString('language_code', 'de');
        await prefs.setString('countryCode', 'GE');
      } else if (type == const Locale("ja")) {
        //If selected language is Chinese
        _appLocale = const Locale("ja");
        await prefs.setString('language_code', 'ja');
        await prefs.setString('countryCode', 'JP');
      } else if (type == const Locale("pt")) {
        //If selected language is Chinese
        _appLocale = const Locale("pt");
        await prefs.setString('language_code', 'pt');
        await prefs.setString('countryCode', 'PT');
      } else {
        //If selected language is english
        _appLocale = const Locale("en");
        await prefs.setString('language_code', 'en');
        await prefs.setString('countryCode', 'US');
      }
    }

    /// notifying the consumers
    notifyListeners();
  }

  /// Navigates the user after choosing lthe anguage.
  ///
  /// This function navigate user to `/appSettingsPage` route if the user
  /// is authenticated else navigate to `demoMode - /MainScreenPage` route.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> selectLanguagePress() async {
    if (userConfig.currentUser.id != 'null') {
      navigationService.popAndPushScreen('/appSettingsPage', arguments: '');
    } else {
      navigationService.pushScreen(
        Routes.setUrlScreen,
        arguments: '',
      );
    }
  }
}
