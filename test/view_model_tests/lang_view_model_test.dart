// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/constants/routing_constants.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  testSetupLocator();
  locator<GraphqlConfig>().test();

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Language View Model Tests', () {
    test("test change language", () {
      final model = AppLanguage(isTest: true);
      model.initialize();

      // check that initially the app language is set to english
      final Locale locale = model.appLocal;
      expect(locale, const Locale('en'));

      // test changeLanguage function with same language as before
      model.changeLanguage(const Locale('en'));
      expect(model.appLocal, const Locale('en'));

      // test changeLanguage function with different language
      model.changeLanguage(const Locale('es'));
      final Locale changedLocale = model.appLocal;
      expect(changedLocale, const Locale('es'));
    });

    test('change language with isTest false', () async {
      final model = AppLanguage(isTest: false);
      model.initialize();

      // check that initially the app language is set to english
      final Locale locale = model.appLocal;
      expect(locale, const Locale('en'));

      // test changeLanguage function with same language as before
      await model.changeLanguage(const Locale('en'));
      expect(model.appLocal, const Locale('en'));

      // test changeLanguage function with different languages
      await model.changeLanguage(const Locale('es'));
      Locale changedLocale = model.appLocal;
      expect(model.appLocal, const Locale('es'));

      await model.changeLanguage(const Locale('fr'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('fr'));

      await model.changeLanguage(const Locale('hi'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('hi'));

      await model.changeLanguage(const Locale('zh'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('zh'));

      await model.changeLanguage(const Locale('de'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('de'));

      await model.changeLanguage(const Locale('ja'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('ja'));

      await model.changeLanguage(const Locale('pt'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('pt'));

      await model.changeLanguage(const Locale('en'));
      changedLocale = model.appLocal;
      expect(changedLocale, const Locale('en'));
    });

    test('selectLanguagePress navigates authenticated user to app settings',
        () async {
      final model = AppLanguage(isTest: true);
      await model.initialize();

      // Setup authenticated user
      userConfig.currentUser.id = 'validUserId';

      await model.selectLanguagePress();

      // Verify navigation to app settings
      verify(navigationService.popAndPushScreen('/appSettingsPage',
              arguments: ''))
          .called(1);
    });

    test('selectLanguagePress navigates unauthenticated user to setUrlScreen',
        () async {
      final model = AppLanguage(isTest: true);
      await model.initialize();

      // Setup unauthenticated user
      userConfig.currentUser.id = 'null';

      await model.selectLanguagePress();

      // Verify navigation to login/signup screen (not demo mode)
      verify(navigationService.pushScreen(Routes.setUrlScreen, arguments: ''))
          .called(1);

      // Verify it does NOT navigate to mainScreen with demo mode
      verifyNever(navigationService.pushScreen(
        Routes.mainScreen,
        arguments: anyNamed('arguments'),
      ));
    });
  });

  group('Locale Resolution Tests', () {
    final model = AppLanguage(isTest: true);
    model.initialize();
    const supportedLocales = [
      Locale('en', 'US'),
      Locale('es', 'ES'),
      Locale('fr', 'FR'),
      Locale('hi', 'IN'),
      Locale('zh', 'CN'),
      Locale('de', 'DE'),
      Locale('ja', 'JP'),
      Locale('pt', 'PT'),
    ];

    test('Returns first supported locale when locale is null', () {
      final result = model.localeResoultion(null, supportedLocales);
      expect(result, supportedLocales.first);
    });

    test('Returns matching language code locale', () {
      const locale = Locale('es', 'MX');
      final result = model.localeResoultion(locale, supportedLocales);
      expect(result, const Locale('es', 'ES'));
    });

    test('Returns matching country code locale', () {
      const locale = Locale('fr', 'CA');
      final result = model.localeResoultion(locale, supportedLocales);
      expect(result, const Locale('fr', 'FR'));
    });

    test('Returns first supported locale when no match is found', () {
      const locale = Locale('it', 'IT');
      final result = model.localeResoultion(locale, supportedLocales);
      expect(result, supportedLocales.first);
    });

    test('Returns correct locale when exact match is found', () {
      const locale = Locale('en', 'US');
      final result = model.localeResoultion(locale, supportedLocales);
      expect(result, locale);
    });
  });
}
