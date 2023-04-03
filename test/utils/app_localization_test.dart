// ignore_for_file: talawa_api_doc

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/app_localization.dart';

void main() {
  group("Test for App Localization Class", () {
    WidgetsFlutterBinding.ensureInitialized();

    test("Load JSON File for localizations", () async {
      final appLocalizations = AppLocalizations(const Locale('en'));
      final result = await appLocalizations.load();
      expect(result, true);
    });

    test("Test mode working properly", () async {
      final appLocalizations =
          AppLocalizations(const Locale('hi'), isTest: true);
      final result = await appLocalizations.load();
      expect(result, true);

      expect(appLocalizations.strictTranslate("Recover"), "Recover");
    });

    test("Translate and strict translate", () async {
      final appLocalizations = AppLocalizations(const Locale('en'));
      final result = await appLocalizations.load();
      expect(result, true);

      // Translate known value
      const key = "Please verify URL first";
      const trueData = "Please verify URL first";
      final checkData = appLocalizations.translate(key);
      expect(checkData, trueData);

      // Translate unknown value
      const key2 = "Lorem ipsum";
      expect(appLocalizations.translate(key2), null);

      // Translate null value
      expect(appLocalizations.translate(null), "...");

      //Strict translate known value
      expect(appLocalizations.strictTranslate("Liked by"), "Liked by");

      // Strict translate unknown value
      expect(appLocalizations.strictTranslate(key2), key2);
    });
  });

  group("Test for App Localization Delegate", () {
    WidgetsFlutterBinding.ensureInitialized();
    const appLocalizationsDelgate = AppLocalizationsDelegate();

    test("Language is supported or not", () {
      // A supported language
      expect(appLocalizationsDelgate.isSupported(const Locale('hi')), true);

      // An unsupported language
      expect(appLocalizationsDelgate.isSupported(const Locale('or')), false);
    });

    test("Localization loaded and changed properly", () async {
      var testAppLocalization =
          await appLocalizationsDelgate.load(const Locale('hi'));

      // In test mode
      testAppLocalization.isTest = true;
      expect(testAppLocalization.strictTranslate("Recover"), "Recover");

      // In prod mode
      testAppLocalization.isTest = false;
      expect(testAppLocalization.strictTranslate("Recover"), "रिकवर कर लेंगे");

      testAppLocalization =
          await appLocalizationsDelgate.load(const Locale('fr'));

      // In test mode
      testAppLocalization.isTest = true;
      expect(testAppLocalization.strictTranslate("Recover"), "Recover");

      // In prod mode
      testAppLocalization.isTest = false;
      expect(testAppLocalization.strictTranslate("Recover"), "votre mot");
    });

    test("App Localization Delegate should not reload", () async {
      expect(
        appLocalizationsDelgate.shouldReload(appLocalizationsDelgate),
        false,
      );
    });
  });
}
