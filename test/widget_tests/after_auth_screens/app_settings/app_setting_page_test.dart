// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/language/language_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/after_auth_screens/app_settings/app_settings_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  void call();
}

Widget createChangePassScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return BaseView<AppTheme>(
          onModelReady: (model) => model.initialize(),
          builder: (context, themeModel, child) {
            return MaterialApp(
              locale: const Locale('en'),
              localizationsDelegates: [
                const AppLocalizationsDelegate(isTest: true),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              key: const Key('Root'),
              themeMode: themeMode,
              theme: Provider.of<AppTheme>(context, listen: true).isdarkTheme
                  ? TalawaTheme.darkTheme
                  : TalawaTheme.lightTheme,
              home: const AppSettingsPage(),
              navigatorKey: locator<NavigationService>().navigatorKey,
              onGenerateRoute: router.generateRoute,
            );
          },
        );
      },
    );

Widget createChangePassScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return BaseView<AppTheme>(
          onModelReady: (model) => model.initialize(),
          builder: (context, themeModel, child) {
            return MaterialApp(
              locale: const Locale('en'),
              localizationsDelegates: [
                const AppLocalizationsDelegate(isTest: true),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              key: const Key('Root'),
              themeMode: themeMode,
              theme: Provider.of<AppTheme>(context, listen: true).isdarkTheme
                  ? TalawaTheme.darkTheme
                  : TalawaTheme.lightTheme,
              home: const AppSettingsPage(),
              navigatorKey: locator<NavigationService>().navigatorKey,
              onGenerateRoute: router.generateRoute,
            );
          },
        );
      },
    );

Future<void> main() async {
  testSetupLocator();
  TestWidgetsFlutterBinding.ensureInitialized();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();
  final Directory dir = Directory('temporaryPath');
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());
  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');
  await Hive.openBox('url');

  group('Setting Page Screen Widget Test in dark mode', () {
    testWidgets("Testing if Settings Screen shows up", (tester) async {
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('AppSettingScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });
    testWidgets(
        "Testing if Settings Screen shows up in dark mode with Theme selection tile",
        (tester) async {
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('AppSettingScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
      final switchThemeTile = find.byKey(const Key('ThemeSwitch'));
      expect(switchThemeTile, findsOneWidget);
      final themeToggleButton = find.byKey(const Key('ToggleTheme'));
      expect(themeToggleButton, findsOneWidget);
      expect((tester.firstWidget(themeToggleButton) as Switch).value, true);
    });
    testWidgets(
        "Testing if Settings Screen shows up in dark mode with language selection tile",
        (tester) async {
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('AppSettingScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
      final languageSwitchTile = find.byKey(const Key('LanguageTile'));
      expect(languageSwitchTile, findsOneWidget);
      final languageSelectionButton = find.byKey(const Key('LanguageSelector'));
      expect(languageSelectionButton, findsOneWidget);
      final Language userLanguage = languages.firstWhere(
        (element) =>
            element.langCode ==
            Provider.of<AppLanguage>(
              locator<NavigationService>().navigatorKey.currentContext!,
              listen: false,
            ).appLocal.languageCode,
      );
      expect(
        ((tester.firstWidget(languageSelectionButton) as TextButton).child!
                as Text)
            .data,
        userLanguage.langName,
      );
      await tester.tap(languageSelectionButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
    testWidgets("Testing if theme changes from dark mode to light mode",
        (tester) async {
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('AppSettingScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
      final switchThemeTile = find.byKey(const Key('ThemeSwitch'));
      expect(switchThemeTile, findsOneWidget);
      final themeToggleButton = find.byKey(const Key('ToggleTheme'));
      expect(themeToggleButton, findsOneWidget);
      expect((tester.firstWidget(themeToggleButton) as Switch).value, true);
      await tester.tap(themeToggleButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
    });
    testWidgets(
        "Testing if theme changes from dark mode to light mode then again back to dark mode",
        (tester) async {
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('AppSettingScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
      final switchThemeTile = find.byKey(const Key('ThemeSwitch'));
      expect(switchThemeTile, findsOneWidget);
      final themeToggleButton = find.byKey(const Key('ToggleTheme'));
      expect(themeToggleButton, findsOneWidget);
      expect((tester.firstWidget(themeToggleButton) as Switch).value, true);
      await tester.tap(themeToggleButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect((tester.firstWidget(themeToggleButton) as Switch).value, false);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
      await tester.tap(themeToggleButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect((tester.firstWidget(themeToggleButton) as Switch).value, true);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
      File('temporaryPath/currentorg.hive').delete();
      File('temporaryPath/currentorg.lock').delete();
      File('temporaryPath/currentuser.hive').delete();
      File('temporaryPath/currentuser.lock').delete();
      File('temporaryPath/url.hive').delete();
      File('temporaryPath/url.lock').delete();
    });
  });
}
