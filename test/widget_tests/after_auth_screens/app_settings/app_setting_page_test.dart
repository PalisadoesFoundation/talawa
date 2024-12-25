import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

/// MockBuildContext class helps to mock the BuildContext class.
class MockBuildContext extends Mock implements BuildContext {}

/// Mock Class for Flutter Secure Storage.
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {
  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (key == "userEmail" || key == "userPassword") {
      throw Exception("Deletion error");
    }
    return Future.value(null);
  }
}

/// MockCallbackFunction class helps to mock the callback function.
class MockCallbackFunction extends Mock {
  /// call function helps to mock the call function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void call();
}

/// 'createAppSettingScreen' is used to create the AppSettingPage widget in light mode.
///
/// **params**:
/// * `themeMode`: Represents the theme mode of the widget.
///
/// **returns**:
/// * `Widget`: Returns the AppSettingPage widget.
Widget createAppSettingScreen({ThemeMode themeMode = ThemeMode.light}) =>
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
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    SizeConfig().test();
    registerServices();
  });

  group('Setting Page Screen Widget Test in dark mode', () {
    testWidgets("Testing if Settings Screen shows up", (tester) async {
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
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
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
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
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
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
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
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
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
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
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      expect(find.text('Profile'), findsOneWidget);

      final editProfile = find.textContaining('Edit Profile');
      await tester.tap(editProfile);

      verify(navigationService.navigatorKey);
    });
    testWidgets('Test if help and support tiles are working', (tester) async {
      when(userConfig.loggedIn).thenReturn(true);
      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();

      final talawaDocs = find.textContaining('Talawa Docs');
      final talawaGitHub = find.textContaining('Talawa GitHub');

      await tester.tap(talawaDocs);
      await tester.tap(talawaGitHub);
    });
    testWidgets('Test if footerTile is working.', (tester) async {
      const userLoggedIn = true;
      when(userConfig.loggedIn).thenAnswer((_) => userLoggedIn);

      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('Logout')));
      await tester.pumpAndSettle();

      final logoutButton = find.textContaining('Logout').last;
      await tester.tap(logoutButton);

      unregisterServices();
      registerServices();

      const loggedIn = false;
      when(userConfig.loggedIn).thenAnswer((_) => loggedIn);

      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();

      final joinOrgButton = find.textContaining('Join an Organisation');
      await tester.tap(joinOrgButton);

      verify(navigationService.navigatorKey);
    });

    testWidgets('Test if Logout is successful', (tester) async {
      when(userConfig.loggedIn).thenAnswer((_) => true);

      final AppSettingViewModel model = AppSettingViewModel();

      when(model.logout()).thenAnswer((realInvocation) async {});

      await tester
          .pumpWidget(createAppSettingScreen(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('Logout')));
      await tester.pumpAndSettle();

      final logoutButton = find.textContaining('Logout').last;
      expect(logoutButton, findsOneWidget);
      await tester.tap(logoutButton);

      verify(model.logout());
    });
    test('Should delete stored values if checkBoxVal is false', () async {
      FlutterSecureStorage.setMockInitialValues(
        {"userEmail": "test@example.com", "userPassword": "password123"},
      );
      const secureStorage = FlutterSecureStorage();
      const bool checkBoxVal = false;
      if (checkBoxVal == false) {
        try {
          await secureStorage.delete(key: "userEmail");
          await secureStorage.delete(key: "userPassword");
        } catch (e) {
          print("Unable to delete stored value : $e");
        }
      }
      final userEmail = await secureStorage.read(key: "userEmail");
      final userPassword = await secureStorage.read(key: "userPassword");
      expect(userEmail, isNull);
      expect(userPassword, isNull);
    });
    test('Should handle exception during deletion', () async {
      FlutterSecureStorage.setMockInitialValues(
        {"userEmail": "test@example.com", "userPassword": "password123"},
      );
      final mockSecureStorage = MockFlutterSecureStorage();
      const checkBoxVal = false;

      String log = "";

      await runZonedGuarded(
        () async {
          if (checkBoxVal == false) {
            try {
              await mockSecureStorage.delete(key: "userEmail");
              await mockSecureStorage.delete(key: "userPassword");
            } catch (e) {
              print("Unable to delete stored value: $e");
            }
          }
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains("Deletion error"));
          expect(stack, isNotNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );
      expect(
        log,
        contains("Deletion error"),
      );
    });
  });
}
