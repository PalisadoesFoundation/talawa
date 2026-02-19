import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class AppLanguage extends BaseModel {
  AppLanguage({this.isTest = false});

  final bool isTest;

  final navigationService = locator<NavigationService>();
  final databaseFunctions = locator<DataBaseMutationFunctions>();

  late Locale _appLocale;

  Locale get appLocal => _appLocale;

  Future<void> initialize() async {
    _appLocale = const Locale('en');
    await fetchLocale();
  }

  Future<void> fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String langCode = prefs.getString('language_code') ?? 'en';
    _appLocale = Locale(langCode);
    notifyListeners();
  }

  /// Fixed method name
  Locale localeResolution(Locale? locale, Iterable<Locale> supportedLocales) {
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

  Future<void> changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }

    if (isTest) {
      _appLocale = type;
    } else {
      final prefs = await SharedPreferences.getInstance();

      const languageMap = {
        "es": "ES",
        "fr": "FR",
        "hi": "IN",
        "zh": "CN",
        "de": "GE",
        "ja": "JP",
        "pt": "PT",
        "en": "US",
      };

      final languageCode = type.languageCode;
      final countryCode = languageMap[languageCode] ?? "US";

      _appLocale = Locale(languageCode);

      await prefs.setString('language_code', languageCode);
      await prefs.setString('countryCode', countryCode);
    }

    notifyListeners();
  }

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
