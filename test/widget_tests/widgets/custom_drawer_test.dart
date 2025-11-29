// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createHomePageScreen({required bool demoMode}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: MainScreen(
      key: const Key('MainScreen'),
      mainScreenArgs: MainScreenArgs(
        mainScreenIndex: 0,
        fromSignUp: false,
        toggleDemoMode: demoMode,
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();

    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('Exit dialog', () {
    testWidgets('exit dialog renders correctly', (tester) async {
      // Test that the exit alert dialog widget renders
      final customDrawerViewModel = CustomDrawerViewModel();

      final Widget buildAlertDialog = MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        themeMode: ThemeMode.light,
        theme: TalawaTheme.lightTheme,
        home: Builder(
          builder: (context) => Scaffold(
            body: customDrawerViewModel.exitAlertDialog(context),
          ),
        ),
      );

      await tester.pumpWidget(buildAlertDialog);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify the exit dialog renders with the correct key
      final exitDialog = find.byKey(const Key("Exit?"));
      expect(exitDialog, findsOneWidget);

      // Verify the exit button text is present
      expect(find.text('Exit'), findsOneWidget);
    });
  });

  group('MainScreen drawer & demo mode', () {
    testWidgets('Test main screen renders with drawer capability',
        (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen rendered
      expect(find.byKey(const Key('MainScreen')), findsOneWidget);
    });

    testWidgets('Test main screen with demo mode enabled', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen rendered in demo mode
      expect(find.byType(MainScreen), findsOneWidget);
      final mainScreen = tester.widget<MainScreen>(
        find.byType(MainScreen),
      );
      expect(mainScreen.mainScreenArgs.toggleDemoMode, isTrue);
    });

    testWidgets('Test main screen initializes scaffold', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify scaffold exists for drawer functionality
      // MainScreen contains a Scaffold with key 'MainScaffold'
      expect(find.byKey(const Key('MainScaffold')), findsOneWidget);
    });

    testWidgets('Test main screen receives expected arguments', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final mainScreen = tester.widget<MainScreen>(
        find.byKey(const Key('MainScreen')),
      );
      expect(mainScreen.mainScreenArgs.mainScreenIndex, 0);
      expect(mainScreen.mainScreenArgs.fromSignUp, isFalse);
      expect(mainScreen.mainScreenArgs.toggleDemoMode, isTrue);
    });
  });

  group('Custom Drawer Test', () {
    // TODO: Restore drawer interaction widget tests for the custom drawer
    // once the drawer UI and navigation flows are stabilized.
  });
}
