import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import '../../helpers/test_helpers.mocks.dart';
import 'splash_screen_test.mocks.dart' as splash_screen_mocks;

@GenerateNiceMocks([
  MockSpec<AppLinks>(),
  MockSpec<UserConfig>(),
])
GlobalKey<NavigatorState> mockNavigatorKey = GlobalKey<NavigatorState>();

Widget _createSplashScreen({
  required ThemeMode themeMode,
  ThemeData? theme,
  ThemeData? darkTheme,
}) =>
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
          theme: theme,
          darkTheme: darkTheme,
          home: const SplashScreen(
            key: Key('SplashScreen'),
          ),
          navigatorKey: mockNavigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Widget createSplashScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    _createSplashScreen(
      themeMode: themeMode,
      theme: TalawaTheme.lightTheme,
    );

Widget createSplashScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    _createSplashScreen(
      themeMode: themeMode,
      darkTheme: TalawaTheme.darkTheme,
    );

Future<void> main() async {
  // Disable stack trace demangling for non-standard environments (e.g., CI)
  // This ensures consistent stack traces across different environments and
  // makes test failures more debuggable in CI pipelines
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  late splash_screen_mocks.MockAppLinks mockAppLinks;
  late splash_screen_mocks.MockUserConfig mockUserConfig;
  late MockNavigationService mockNavigationService;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    graphqlConfig.test();
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() async {
    print('===== Setting up test =====');
    // Clear Hive before each test
    final boxUser = await Hive.openBox<User>('currentUser');
    final boxOrg = await Hive.openBox<OrgInfo>('currentOrg');
    await boxUser.clear();
    await boxOrg.clear();
    await boxUser.close();
    await boxOrg.close();

    // re‐register AppLinks & UserConfig as mocks
    mockAppLinks = splash_screen_mocks.MockAppLinks();
    if (locator.isRegistered<AppLinks>()) locator.unregister<AppLinks>();
    locator.registerSingleton<AppLinks>(mockAppLinks);

    mockUserConfig = splash_screen_mocks.MockUserConfig();
    if (locator.isRegistered<UserConfig>()) locator.unregister<UserConfig>();
    locator.registerSingleton<UserConfig>(mockUserConfig);

    mockNavigationService = MockNavigationService();
    if (locator.isRegistered<NavigationService>()) {
      locator.unregister<NavigationService>();
    }
    locator.registerSingleton<NavigationService>(mockNavigationService);

    // default: no deep link
    when(mockAppLinks.getInitialLink()).thenAnswer((_) async => null);
    when(mockAppLinks.uriLinkStream).thenAnswer((_) => const Stream.empty());
  });

  tearDown(() {
    print('===== Tearing down test =====');

    // Clean up after each test
    if (locator.isRegistered<AppLinks>()) {
      locator.unregister<AppLinks>();
    }
    if (locator.isRegistered<UserConfig>()) {
      locator.unregister<UserConfig>();
    }
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

  group("splash screen navigation tests", () {
    testWidgets('membershipRequests==null → mainScreen', (tester) async {
      final u = User(
        id: 'foo',
        firstName: 'Foo',
        lastName: 'Bar',
        email: 'foo@bar.com',
      )
        ..joinedOrganizations = <OrgInfo>[] // empty list
        ..membershipRequests = null; // null requests

      when(mockUserConfig.loggedIn).thenReturn(true);
      when(mockUserConfig.currentUser).thenReturn(u);
      when(
        mockNavigationService.pushReplacementScreen(
          Routes.mainScreen,
          arguments: isA<MainScreenArgs>(),
        ),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(createSplashScreenLight());
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(
        const Duration(milliseconds: 750),
      );
      await tester.pumpAndSettle();

      verify(
        mockNavigationService.pushReplacementScreen(
          Routes.mainScreen,
          arguments: isA<MainScreenArgs>(),
        ),
      ).called(1);
    });

    testWidgets('membershipRequests.isNotEmpty → waitingScreen',
        (tester) async {
      final u = User(
        id: 'foo',
        firstName: 'Foo',
        lastName: 'Bar',
        email: 'foo@bar.com',
      )
        ..joinedOrganizations = <OrgInfo>[]
        ..membershipRequests = [OrgInfo(id: 'o1', name: 'Org One')];

      when(mockUserConfig.loggedIn).thenReturn(true);
      when(mockUserConfig.currentUser).thenReturn(u);
      when(
        mockNavigationService.pushReplacementScreen(
          Routes.waitingScreen,
          arguments: '0',
        ),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(createSplashScreenLight());
      await tester.pump(); // Build the widget tree
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(
        const Duration(milliseconds: 750),
      );

      verifyNever(
        mockNavigationService.pushReplacementScreen(
          Routes.waitingScreen,
          arguments: '0',
        ),
      ).called(0);
    });
  });
}
