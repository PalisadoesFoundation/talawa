import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
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

  late String _appLocale;

  /// getter for appLocal.
  String get appLocal => _appLocale;

  /// initialiser.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialize() async {
    _appLocale = 'en';
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
    _appLocale = langCode;

    notifyListeners();
  }

  /// This function change the app default language.
  ///
  /// **params**:
  /// * `type`: `Locale` type, the language need to be updated with.
  ///
  /// **returns**:
  ///   None
  Future<void> changeLanguage(String type) async {
    // if the app language is of same [type].
    if (_appLocale == type) {
      return;
    }

    if (isTest) {
      _appLocale = type;
    } else {
      final prefs = await SharedPreferences.getInstance();
      if (type == "es") {
        //If selected language is spanish
        _appLocale = "es";
        await prefs.setString('language_code', 'es');
        await prefs.setString('countryCode', 'ES');
      } else if (type == "fr") {
        //If selected language is french
        _appLocale = "fr";
        await prefs.setString('language_code', 'fr');
        await prefs.setString('countryCode', 'FR');
      } else if (type == "hi") {
        //If selected language is hindi
        _appLocale = "hi";
        await prefs.setString('language_code', 'hi');
        await prefs.setString('countryCode', 'IN');
      } else if (type == "zh") {
        //If selected language is Chinese
        _appLocale = "zh";
        await prefs.setString('language_code', 'zh');
        await prefs.setString('countryCode', 'CN');
      } else if (type == "de") {
        //If selected language is Chinese
        _appLocale = "de";
        await prefs.setString('language_code', 'de');
        await prefs.setString('countryCode', 'GE');
      } else if (type == "ja") {
        //If selected language is Chinese
        _appLocale = "ja";
        await prefs.setString('language_code', 'ja');
        await prefs.setString('countryCode', 'JP');
      } else if (type == "pt") {
        //If selected language is Chinese
        _appLocale = "pt";
        await prefs.setString('language_code', 'pt');
        await prefs.setString('countryCode', 'PT');
      } else {
        //If selected language is english
        _appLocale = "en";
        await prefs.setString('language_code', 'en');
        await prefs.setString('countryCode', 'US');
      }
    }

    /// notifying the consumers
    notifyListeners();
  }

  /// Navigates the user after choosing the language.
  ///
  /// This function navigates the user to `/appSettingsPage` when authenticated,
  /// otherwise to `Routes.setUrlScreen` (Join and Collaborate / login-signup screen).
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
