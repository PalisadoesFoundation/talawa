// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/language/language_model.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/after_auth_screens/app_settings/app_settings_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
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
              home: const AppSettingsPage(
                key: Key('AppSettingsPage'),
              ),
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
              home: const AppSettingsPage(
                key: Key('AppSettingsPage'),
              ),
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
  SizeConfig().test();
  registerServices();

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

      final backButton = find.byIcon(Icons.arrow_back);

      await tester.tap(backButton);
      await tester.pumpAndSettle();

      verify(navigationService.navigatorKey);
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
    });
    testWidgets('Test Edit Profile Tile is visible and works properly',
        (tester) async {
      when(userConfig.loggedIn).thenReturn(true);
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      expect(find.text('Profile'), findsOneWidget);

      final editProfile = find.textContaining('Edit Profile');
      await tester.tap(editProfile);

      verify(navigationService.navigatorKey);
    });
    testWidgets('Test if help and support tiles are working', (tester) async {
      when(userConfig.loggedIn).thenReturn(true);
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      final talawaDocs = find.textContaining('Talawa Docs');
      final talawaGitHub = find.textContaining('Talawa Git-Hub');

      await tester.tap(talawaDocs);
      await tester.tap(talawaGitHub);
    });
    testWidgets('Test if footerTile is working.', (tester) async {
      const userLoggedIn = true;
      when(userConfig.loggedIn).thenAnswer((_) => userLoggedIn);

      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('Logout')));
      await tester.pumpAndSettle();

      final logoutButton = find.textContaining('LogOut');
      await tester.tap(logoutButton);

      unregisterServices();
      registerServices();

      const loggedIn = false;
      when(userConfig.loggedIn).thenAnswer((_) => loggedIn);

      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      final joinOrgButton = find.textContaining('Join an Organisation');
      await tester.tap(joinOrgButton);

      verify(navigationService.navigatorKey);
    });
    testWidgets('Test if Logout is unsuccessful.', (tester) async {
      final model = AppSettingViewModel();
      when(model.logout()).thenThrow(Exception('Test error'));

      const userLoggedIn = true;
      when(userConfig.loggedIn).thenAnswer((_) => userLoggedIn);

      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('Logout')));
      await tester.pumpAndSettle();

      final logoutButton = find.textContaining('LogOut');
      await tester.tap(logoutButton);
    });

    testWidgets('Test if Logout is successful', (tester) async {
      final model = AppSettingViewModel();
      when(model.logout()).thenAnswer((_) async => true);

      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('Logout')));
      await tester.pumpAndSettle();

      final logoutButton = find.textContaining('LogOut');
      await tester.tap(logoutButton);

      verify(navigationService.pop());
      verify(
        navigationService.removeAllAndPush(
          '/selectLang',
          '/',
        ),
      );
    });
  });
}
