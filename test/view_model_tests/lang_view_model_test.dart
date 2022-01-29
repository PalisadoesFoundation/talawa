import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Language View Model Tests', () {

    test("test change language" , (){

      final model = AppLanguage(isTest: true);
      model.initialize();

      // check that initially the app language is set to english
      final Locale locale = model.appLocal;
      expect(locale , const Locale('en'));

      // test changeLanguage function with same language as before
      model.changeLanguage(const Locale('en'));
      expect(model.appLocal , const Locale('en'));

      // test changeLanguage function with different language
      model.changeLanguage(const Locale('es'));
      final Locale changedLocale = model.appLocal;
      expect(changedLocale , const Locale('es'));

    });

    test('change language with isTest false' , () async{
      final model = AppLanguage(isTest: false);
      model.initialize();

      // check that initially the app language is set to english
      final Locale locale = model.appLocal;
      expect(locale , const Locale('en'));

      // test changeLanguage function with same language as before
      model.changeLanguage(const Locale('en'));
      expect(model.appLocal , const Locale('en'));

      // test changeLanguage function with different language
      await model.changeLanguage(const Locale('es'));
      final Locale changedLocale = model.appLocal;
      expect(changedLocale , const Locale('es'));
    });

    test("test selectLanguagePress " , () async{
      final model = AppLanguage(isTest: true);
      await model.initialize();

      // first considering user is not logged in
      when(userConfig.userLoggedIn()).thenAnswer((realInvocation) async{
        return false;
      });

      when(navigationService.pushScreen('/setUrl', arguments: ''))
          .thenAnswer((_) async {});

      await model.selectLanguagePress();
      verify(navigationService.pushScreen('/setUrl', arguments: ''));

      // now consider user to be logged in
      when(userConfig.userLoggedIn()).thenAnswer((realInvocation) async{
        return true;
      });

      when(navigationService.popAndPushScreen('/appSettingsPage', arguments: ''))
          .thenAnswer((_) async {});

      await model.selectLanguagePress();

      verify(navigationService.popAndPushScreen('/appSettingsPage', arguments: ''));
    });


  });
}

