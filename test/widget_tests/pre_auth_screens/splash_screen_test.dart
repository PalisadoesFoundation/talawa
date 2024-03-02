// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:uni_links/uni_links.dart';

Widget createSplashScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.lightTheme,
          home: const SplashScreen(
            key: Key('SplashScreen'),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Widget createSplashScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          darkTheme: TalawaTheme.darkTheme,
          home: const SplashScreen(
            key: Key('SplashScreen'),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Future<void> main() async {
  setupLocator();
  graphqlConfig.test();

  group('Splash Screen Widget Test in light mode', () {
    testWidgets("Testing if Splash Screen shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenLight());
      await tester.pumpAndSettle();
      final screenScaffoldWidget =
          find.byKey(const Key('SplashScreenScaffold'));
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
    });
    testWidgets("Testing if app logo shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenLight());
      await tester.pumpAndSettle();
      final logoWidget = find.byKey(const Key('LogoPainter'));
      expect(logoWidget, findsOneWidget);
      expect(
        (tester.firstWidget(logoWidget) as CustomPaint).size,
        Size(
          SizeConfig.screenWidth! * 0.6,
          SizeConfig.screenWidth! * 0.6,
        ),
      );
    });
    testWidgets("Testing if app name shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenLight());
      await tester.pumpAndSettle();
      final findAppNameWidget = find.text('TALAWA');
      expect(findAppNameWidget, findsOneWidget);
      expect(
        (tester.firstWidget(findAppNameWidget) as Text).style!.color,
        TalawaTheme.lightTheme.textTheme.headlineMedium!.color,
      );
      expect(
        (tester.firstWidget(findAppNameWidget) as Text).style!.fontFamily,
        TalawaTheme.lightTheme.textTheme.headlineMedium!.fontFamily,
      );
      expect(
        (tester.firstWidget(findAppNameWidget) as Text).style!.fontSize,
        TalawaTheme.lightTheme.textTheme.headlineMedium!.fontSize,
      );
    });
    testWidgets("Testing if provider text shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenLight());
      await tester.pumpAndSettle();
      final findProviderTextWidget = find.text('from');
      expect(findProviderTextWidget, findsOneWidget);
      expect(
        (tester.firstWidget(findProviderTextWidget) as Text).style!.color,
        TalawaTheme.lightTheme.textTheme.bodySmall!.color,
      );
      expect(
        (tester.firstWidget(findProviderTextWidget) as Text).style!.fontFamily,
        TalawaTheme.lightTheme.textTheme.bodySmall!.fontFamily,
      );
      expect(
        (tester.firstWidget(findProviderTextWidget) as Text).style!.fontSize,
        TalawaTheme.lightTheme.textTheme.bodySmall!.fontSize,
      );
    });
    testWidgets("Testing if provider name shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenLight());
      await tester.pumpAndSettle();
      final findProviderNameWidget = find.text('PALISADOES');
      expect(findProviderNameWidget, findsOneWidget);
      expect(
        (tester.firstWidget(findProviderNameWidget) as Text).style!.color,
        TalawaTheme.lightTheme.textTheme.titleSmall!.color,
      );
      expect(
        (tester.firstWidget(findProviderNameWidget) as Text).style!.fontFamily,
        TalawaTheme.lightTheme.textTheme.titleSmall!.fontFamily,
      );
    });
  });
  group('Splash Screen Widget Test in dark mode', () {
    testWidgets("Testing if Splash Screen shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget =
          find.byKey(const Key('SplashScreenScaffold'));
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .darkTheme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });
    testWidgets("Testing if app logo shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenDark());
      await tester.pumpAndSettle();
      final logoWidget = find.byKey(const Key('LogoPainter'));
      expect(logoWidget, findsOneWidget);
      expect(
        (tester.firstWidget(logoWidget) as CustomPaint).size,
        Size(
          SizeConfig.screenWidth! * 0.6,
          SizeConfig.screenWidth! * 0.6,
        ),
      );
    });
    testWidgets("Testing if app name shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenDark());
      await tester.pumpAndSettle();
      final findAppNameWidget = find.text('TALAWA');
      expect(findAppNameWidget, findsOneWidget);
      expect(
        (tester.firstWidget(findAppNameWidget) as Text).style!.color,
        TalawaTheme.darkTheme.textTheme.headlineMedium!.color,
      );
      expect(
        (tester.firstWidget(findAppNameWidget) as Text).style!.fontFamily,
        TalawaTheme.darkTheme.textTheme.headlineMedium!.fontFamily,
      );
      expect(
        (tester.firstWidget(findAppNameWidget) as Text).style!.fontSize,
        TalawaTheme.darkTheme.textTheme.headlineMedium!.fontSize,
      );
    });
    testWidgets("Testing if provider text shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenDark());
      await tester.pumpAndSettle();
      final findProviderTextWidget = find.text('from');
      expect(findProviderTextWidget, findsOneWidget);
      expect(
        (tester.firstWidget(findProviderTextWidget) as Text).style!.color,
        TalawaTheme.darkTheme.textTheme.bodySmall!.color,
      );
      expect(
        (tester.firstWidget(findProviderTextWidget) as Text).style!.fontFamily,
        TalawaTheme.darkTheme.textTheme.bodySmall!.fontFamily,
      );
      expect(
        (tester.firstWidget(findProviderTextWidget) as Text).style!.fontSize,
        TalawaTheme.darkTheme.textTheme.bodySmall!.fontSize,
      );
    });
    testWidgets("Testing if provider name shows up", (tester) async {
      await tester.pumpWidget(createSplashScreenDark());
      await tester.pumpAndSettle();
      final findProviderNameWidget = find.text('PALISADOES');
      expect(findProviderNameWidget, findsOneWidget);
      expect(
        (tester.firstWidget(findProviderNameWidget) as Text).style!.color,
        TalawaTheme.darkTheme.textTheme.titleSmall!.color,
      );
      expect(
        (tester.firstWidget(findProviderNameWidget) as Text).style!.fontFamily,
        TalawaTheme.darkTheme.textTheme.titleSmall!.fontFamily,
      );
    });
  });
}

// Added the following test cases

Future<void> testWidgets1(WidgetTester tester) async {
  await tester.pumpWidget(createSplashScreenLight());
  await tester.pumpAndSettle();

  // Mock the uriLinkStream to emit a test URI
  final testUri = Uri.parse("https://example.com");
  uriLinkStream.any(testUri as bool Function(Uri? element));

  // Wait for the URI to be handled
  await tester.pumpAndSettle();

  // Verify that the latest URI is updated correctly
  expect(find.text("Latest URI: $testUri"), findsOneWidget);
}

Future<void> testWidgets2(WidgetTester tester) async {
  await tester.pumpWidget(createSplashScreenLight());
  await tester.pumpAndSettle();

  // Mock the userConfig.userLoggedIn() to return true
  when(userConfig.userLoggedIn()).thenAnswer((_) async => true);

  // Wait for the user log in to be handled
  await tester.pumpAndSettle();

  // Verify that the user log in is handled correctly
  expect(find.text("User logged in"), findsOneWidget);
}

Future<void> testWidgets3(WidgetTester tester) async {
  await tester.pumpWidget(createSplashScreenLight());
  await tester.pumpAndSettle();

  // Mock the userConfig.userLoggedIn() to return true
  when(userConfig.userLoggedIn()).thenAnswer((_) async => true);

  // Mock the uriLinkStream to emit a test URI
  final testUri = Uri.parse("https://example.com");
  uriLinkStream.any(testUri as bool Function(Uri? element));

  // Wait for the URI to be handled
  await tester.pumpAndSettle();

  // Verify that the user log in is not handled
  expect(find.text("User logged in"), findsNothing);
}

Future<void> testWidgets4(WidgetTester tester) async {
  await tester.pumpWidget(createSplashScreenLight());
  await tester.pumpAndSettle();

  // Mock the userConfig.userLoggedIn() to return true
  when(userConfig.userLoggedIn()).thenAnswer((_) async => true);

  // Wait for the user log in to be handled
  await tester.pumpAndSettle();

  // Verify that the user log in is handled correctly
  expect(find.text("User logged in"), findsOneWidget);
}

Future<void> testWidgets5(WidgetTester tester) async {
  await tester.pumpWidget(createSplashScreenLight());
  await tester.pumpAndSettle();

  // Mock the userConfig.userLoggedIn() to return true
  when(userConfig.userLoggedIn()).thenAnswer((_) async => true);

  // Mock the initial URI to be a test URI
  final testUri = Uri.parse("https://example.com");
  when(getInitialUri()).thenAnswer((_) async => testUri);

  // Wait for the initial URI to be handled
  await tester.pumpAndSettle();

  // Verify that the user log in is not handled
  expect(find.text("User logged in"), findsNothing);
}

Future<void> testWidgets6(WidgetTester tester) async {
  await tester.pumpWidget(createSplashScreenLight());
  await tester.pumpAndSettle();

  // Mock the userConfig.userLoggedIn() to return true
  when(userConfig.userLoggedIn()).thenAnswer((_) async => true);

  // Wait for the user log in to be handled
  await tester.pumpAndSettle();

  // Verify that the user log in is handled correctly
  expect(find.text("User logged in"), findsOneWidget);
}
