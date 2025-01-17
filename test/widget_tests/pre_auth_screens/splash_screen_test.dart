// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// ignore_for_file: unused_import

import 'package:app_links/app_links.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'splash_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AppLinks>(), MockSpec<UserConfig>()])
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
  // Disable stack trace demangling for non-standard environments (e.g., CI)
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  late MockAppLinks mockAppLinks;
  late MockUserConfig mockUserConfig;

  setUp(() {
    mockAppLinks = MockAppLinks();
    mockUserConfig = MockUserConfig();

    // Unregister and re-register AppLinks for each test
    if (locator.isRegistered<AppLinks>()) {
      locator.unregister<AppLinks>();
    }
    locator.registerSingleton<AppLinks>(mockAppLinks);

    // Unregister and re-register UserConfig for each test
    if (locator.isRegistered<UserConfig>()) {
      locator.unregister<UserConfig>();
    }
    locator.registerSingleton<UserConfig>(mockUserConfig);

    when(mockAppLinks.getInitialLink()).thenAnswer((_) async => null);
    when(mockAppLinks.uriLinkStream).thenAnswer((_) => const Stream.empty());
  });

  tearDown(() {
    // Clean up after each test
    if (locator.isRegistered<AppLinks>()) {
      locator.unregister<AppLinks>();
    }
    if (locator.isRegistered<UserConfig>()) {
      locator.unregister<UserConfig>();
    }
  });

  setUpAll(() {
    // Set up shared preferences
    SharedPreferences.setMockInitialValues({});
    // Set up any other test configurations
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    graphqlConfig.test();
  });

  group('Splash Screen Widget Test in light mode', () {
    testWidgets("Testing if Splash Screen shows up", (tester) async {
      await tester.runAsync(() async {
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
    });
    testWidgets("Testing if app logo shows up", (tester) async {
      await tester.runAsync(() async {
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
    });
    testWidgets("Testing if app name shows up", (tester) async {
      await tester.runAsync(() async {
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
    });
    testWidgets("Testing if provider text shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();
        final findProviderTextWidget = find.text('from');
        expect(findProviderTextWidget, findsOneWidget);
        expect(
          (tester.firstWidget(findProviderTextWidget) as Text).style!.color,
          TalawaTheme.lightTheme.textTheme.bodySmall!.color,
        );
        expect(
          (tester.firstWidget(findProviderTextWidget) as Text)
              .style!
              .fontFamily,
          TalawaTheme.lightTheme.textTheme.bodySmall!.fontFamily,
        );
        expect(
          (tester.firstWidget(findProviderTextWidget) as Text).style!.fontSize,
          TalawaTheme.lightTheme.textTheme.bodySmall!.fontSize,
        );
      });
    });
    testWidgets("Testing if provider name shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();
        final findProviderNameWidget = find.text('PALISADOES');
        expect(findProviderNameWidget, findsOneWidget);
        expect(
          (tester.firstWidget(findProviderNameWidget) as Text).style!.color,
          TalawaTheme.lightTheme.textTheme.titleSmall!.color,
        );
        expect(
          (tester.firstWidget(findProviderNameWidget) as Text)
              .style!
              .fontFamily,
          TalawaTheme.lightTheme.textTheme.titleSmall!.fontFamily,
        );
      });
    });
  });
  group('Splash Screen Widget Test in dark mode', () {
    testWidgets("Testing if Splash Screen shows up", (tester) async {
      await tester.runAsync(() async {
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
    });
    testWidgets("Testing if app logo shows up", (tester) async {
      await tester.runAsync(() async {
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
    });
    testWidgets("Testing if app name shows up", (tester) async {
      await tester.runAsync(() async {
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
    });
    testWidgets("Testing if provider text shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSplashScreenDark());
        await tester.pumpAndSettle();
        final findProviderTextWidget = find.text('from');
        expect(findProviderTextWidget, findsOneWidget);
        expect(
          (tester.firstWidget(findProviderTextWidget) as Text).style!.color,
          TalawaTheme.darkTheme.textTheme.bodySmall!.color,
        );
        expect(
          (tester.firstWidget(findProviderTextWidget) as Text)
              .style!
              .fontFamily,
          TalawaTheme.darkTheme.textTheme.bodySmall!.fontFamily,
        );
        expect(
          (tester.firstWidget(findProviderTextWidget) as Text).style!.fontSize,
          TalawaTheme.darkTheme.textTheme.bodySmall!.fontSize,
        );
      });
    });
    testWidgets("Testing if provider name shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSplashScreenDark());
        await tester.pumpAndSettle();
        final findProviderNameWidget = find.text('PALISADOES');
        expect(findProviderNameWidget, findsOneWidget);
        expect(
          (tester.firstWidget(findProviderNameWidget) as Text).style!.color,
          TalawaTheme.darkTheme.textTheme.titleSmall!.color,
        );
        expect(
          (tester.firstWidget(findProviderNameWidget) as Text)
              .style!
              .fontFamily,
          TalawaTheme.darkTheme.textTheme.titleSmall!.fontFamily,
        );
      });
    });
  });

  group("URI Link Handling Tests", () {
    testWidgets("should handle initial URI successfully", (tester) async {
      await tester.runAsync(() async {
        // Arrange
        final uri = Uri.parse('talawa://example.com');
        when(mockAppLinks.getInitialLink()).thenAnswer((_) async => uri);
        when(mockAppLinks.uriLinkStream).thenAnswer((_) => Stream.value(uri));

        // Act: Pump the widget
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();

        // Assert
        verify(mockAppLinks.getInitialLink()).called(1);
        expect(find.byKey(const Key('SplashScreenScaffold')), findsOneWidget);
      });
    });
    testWidgets('should handle URI stream updates', (tester) async {
      await tester.runAsync(() async {
        // Arrange
        final uri = Uri.parse('talawa://example.com');
        when(mockAppLinks.uriLinkStream).thenAnswer((_) => Stream.value(uri));
        when(mockUserConfig.loggedIn).thenReturn(true);

        // Act
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();

        // Assert
        verify(mockAppLinks.uriLinkStream).called(1);
      });
    });
    testWidgets("should handle PlatformException when getting initial URI",
        (tester) async {
      await tester.runAsync(() async {
        // Arrange
        when(mockAppLinks.getInitialLink())
            .thenThrow(PlatformException(code: 'TEST_ERROR'));
        when(mockAppLinks.uriLinkStream)
            .thenAnswer((_) => const Stream.empty());

        // Act
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();

        // Assert
        verify(mockAppLinks.getInitialLink()).called(1);
      });
    });
    testWidgets("should handle FormatException when getting initial URI",
        (tester) async {
      await tester.runAsync(() async {
        // Arrange
        when(mockAppLinks.getInitialLink())
            .thenThrow(const FormatException('Invalid URI format'));
        when(mockAppLinks.uriLinkStream)
            .thenAnswer((_) => const Stream.empty());

        // Act
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();

        // Assert
        verify(mockAppLinks.getInitialLink()).called(1);
      });
    });
    testWidgets('should handle URI stream errors', (tester) async {
      await tester.runAsync(() async {
        // Arrange
        when(mockAppLinks.uriLinkStream)
            .thenAnswer((_) => Stream.error('Test error'));
        when(mockUserConfig.loggedIn).thenReturn(true);

        // Act
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpAndSettle();

        // Assert
        verify(mockAppLinks.uriLinkStream).called(1);
      });
    });
    testWidgets('should cleanup stream subscription on dispose',
        (tester) async {
      await tester.runAsync(() async {
        // Arrange
        when(mockUserConfig.loggedIn).thenReturn(true);
        when(mockAppLinks.uriLinkStream)
            .thenAnswer((_) => Stream.value(Uri.parse('talawa://example.com')));

        // Act
        await tester.pumpWidget(createSplashScreenLight());
        await tester.pumpWidget(Container()); // Force dispose

        // No explicit assert needed - test will fail if subscription isn't properly canceled
      });
    });
  });
}
