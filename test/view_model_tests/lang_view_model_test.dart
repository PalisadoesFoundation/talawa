import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/view_model/lang_view_model.dart';

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
    test("test change language", () async {
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

    test("test functions", () async {
      final model = AppLanguage(isTest: true);
      await model.initialize();

      // testing selectLanguagePress function
      // first considering user is not logged in
      when(userConfig.userLoggedIn()).thenAnswer((realInvocation) async {
        return false;
      });

      when(navigationService.pushScreen('/setUrl', arguments: ''))
          .thenAnswer((_) async {});

      await model.selectLanguagePress();
      verify(navigationService.pushScreen('/setUrl', arguments: ''));

      // now consider user to be logged in
      when(userConfig.userLoggedIn()).thenAnswer((realInvocation) async {
        return true;
      });

      when(
        navigationService.popAndPushScreen(
          '/appSettingsPage',
          arguments: '',
        ),
      ).thenAnswer((_) async {});

      databaseFunctions.init();

      when(
        databaseFunctions.gqlAuthMutation(
          queries.updateLanguage(model.appLocal.languageCode),
        ),
      ).thenAnswer((_) async {});

      await model.selectLanguagePress();

      verify(
        databaseFunctions.gqlAuthMutation(
          queries.updateLanguage(model.appLocal.languageCode),
        ),
      );
      verify(
        navigationService.popAndPushScreen(
          '/appSettingsPage',
          arguments: '',
        ),
      );

      // testing userLanguageQuery function
      const userId = "xyz1";
      when(databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId)))
          .thenAnswer((_) async {});
      await model.userLanguageQuery(userId);
      verify(databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId)));

      //testing appLanguageQueryFunction
      when(databaseFunctions.gqlAuthQuery(queries.userLanguage()))
          .thenAnswer((_) async {});
      await model.appLanguageQuery();
      verify(databaseFunctions.gqlAuthQuery(queries.userLanguage()));

      //testing catch block in userLanguageQuery
      when(databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId)))
          .thenThrow(Error());
      await model.userLanguageQuery(userId);

      //testing catch block in appLanguageQuery
      when(databaseFunctions.gqlAuthQuery(queries.userLanguage()))
          .thenThrow(Error());
      await model.appLanguageQuery();

      //testing catch block in dbLanguageUpdate
      when(
        databaseFunctions.gqlAuthMutation(
          queries.updateLanguage(model.appLocal.languageCode),
        ),
      ).thenThrow(Error());
      await model.dbLanguageUpdate();
    });
  });
}
