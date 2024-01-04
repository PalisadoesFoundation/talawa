// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';
import '../../../router_test.dart';

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  @override
  Future<bool> launchUrl(String url, LaunchOptions? options) {
    if (url == 'http://www.success.com') return Future.value(true);
    return Future.value(false);
  }
}

void main() async {
  SizeConfig().test();
  testSetupLocator();

  final Directory dir = Directory('test/fixtures/core1');

  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  await Hive.openBox<User>('currentUser');
  await Hive.openBox('url');
  await Hive.openBox<OrgInfo>('currentOrg');

  group('Test for appSettingviewModel', () {
    setUpAll(() async {
      getAndRegisterNavigationService();
      getAndRegisterUserConfig();
      final mock = MockUrlLauncher();
      UrlLauncherPlatform.instance = mock;
    });

    tearDownAll(() async {
      await Hive.close();

      // Clean up the test directory if needed
      dir.delete(recursive: true);
    });

    test('Test logout function.', () {
      final model = AppSettingViewModel();
      final context = MockBuildContext();
      model.logout(context);
    });

    testWidgets("Test logout dialog when logout successful.", (tester) async {
      const userLoggedin = false;
      when(userConfig.loggedIn).thenAnswer((_) => userLoggedin);
      final model = AppSettingViewModel();

      final widget = BaseView<AppLanguage>(
        onModelReady: (model) => model.initialize(),
        builder: (context, langModel, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              body: model.logoutDialog(),
            ),
            navigatorKey: navigationService.navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('Logout'));
      await tester.pumpAndSettle();

      verify(navigationService.navigatorKey);
    });

    testWidgets("Test logout dialog when logout unsuccessful.", (tester) async {
      final model = AppSettingViewModel();
      const userLoggedIn = true;
      when(userConfig.loggedIn).thenAnswer((_) => userLoggedIn);

      final widget = BaseView<AppLanguage>(
        onModelReady: (model) => model.initialize(),
        builder: (context, langModel, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              body: model.logoutDialog(),
            ),
            navigatorKey: navigationService.navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('Logout'));
      await tester.pumpAndSettle();

      verify(navigationService.navigatorKey);
    });

    test('test for launchWebsite method', () async {
      final model = AppSettingViewModel();
      const successUrl = 'http://www.success.com';
      const failUrl = 'http://www.fail.com';

      bool opened = false;

      // if successfully launches the website.
      opened = await model.launchWebsite(successUrl);
      expect(opened, true);

      // if failed to launch the website.
      opened = await model.launchWebsite(failUrl);
      expect(opened, false);
    });
  });
}
