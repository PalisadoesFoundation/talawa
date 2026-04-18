// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/view_model/lang_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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
      final String locale = model.appLocal;
      expect(locale, 'en');

      // test changeLanguage function with same language as before
      model.changeLanguage('en');
      expect(model.appLocal, 'en');

      // test changeLanguage function with different language
      model.changeLanguage('es');
      final String changedLocale = model.appLocal;
      expect(changedLocale, 'es');
    });

    test('change language with isTest false', () async {
      final model = AppLanguage(isTest: false);
      model.initialize();

      // check that initially the app language is set to english
      final String locale = model.appLocal;
      expect(locale, 'en');

      // test changeLanguage function with same language as before
      await model.changeLanguage('en');
      expect(model.appLocal, 'en');

      // test changeLanguage function with different languages
      await model.changeLanguage('es');
      String changedLocale = model.appLocal;
      expect(model.appLocal, 'es');

      await model.changeLanguage('fr');
      changedLocale = model.appLocal;
      expect(changedLocale, 'fr');

      await model.changeLanguage('hi');
      changedLocale = model.appLocal;
      expect(changedLocale, 'hi');

      await model.changeLanguage('zh');
      changedLocale = model.appLocal;
      expect(changedLocale, 'zh');

      await model.changeLanguage('de');
      changedLocale = model.appLocal;
      expect(changedLocale, 'de');

      await model.changeLanguage('ja');
      changedLocale = model.appLocal;
      expect(changedLocale, 'ja');

      await model.changeLanguage('pt');
      changedLocale = model.appLocal;
      expect(changedLocale, 'pt');

      await model.changeLanguage('en');
      changedLocale = model.appLocal;
      expect(changedLocale, 'en');
    });

    test('selectLanguagePress navigates authenticated user to app settings',
        () async {
      final model = AppLanguage(isTest: true);
      await model.initialize();

      // Setup authenticated user
      when(userConfig.currentUser).thenReturn(User(id: 'validUserId'));

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
      reset(userConfig);
      when(userConfig.currentUser).thenReturn(User(id: 'null'));

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


}
