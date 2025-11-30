// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
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
    testWidgets('Main screen renders with drawer and scaffold', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen and its scaffold both exist
      expect(find.byKey(const Key('MainScreen')), findsOneWidget);
      expect(find.byKey(const Key('MainScaffold')), findsOneWidget);
    });

    testWidgets('Main screen renders with demo mode enabled', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen rendered in demo mode
      expect(find.byType(MainScreen), findsOneWidget);
      final mainScreen = tester.widget<MainScreen>(find.byType(MainScreen));
      expect(mainScreen.mainScreenArgs.toggleDemoMode, isTrue);
    });

    testWidgets('Main screen receives expected arguments', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final mainScreen =
          tester.widget<MainScreen>(find.byKey(const Key('MainScreen')));
      expect(mainScreen.mainScreenArgs.mainScreenIndex, 0);
      expect(mainScreen.mainScreenArgs.fromSignUp, isFalse);
      expect(mainScreen.mainScreenArgs.toggleDemoMode, isTrue);
    });
  });

  group('CustomDrawerViewModel methods', () {
    late CustomDrawerViewModel viewModel;

    setUp(() {
      viewModel = CustomDrawerViewModel();
    });

    test('isPresentinSwitchableOrg returns true when org exists', () {
      // Arrange
      final org1 = OrgInfo(id: '1', name: 'Org 1');
      final org2 = OrgInfo(id: '2', name: 'Org 2');
      viewModel.switchAbleOrg = [org1, org2];

      // Act
      final result = viewModel.isPresentinSwitchableOrg(org1);

      // Assert
      expect(result, isTrue);
    });

    test('isPresentinSwitchableOrg returns false when org not exists', () {
      // Arrange
      final org1 = OrgInfo(id: '1', name: 'Org 1');
      final org3 = OrgInfo(id: '3', name: 'Org 3');
      viewModel.switchAbleOrg = [org1];

      // Act
      final result = viewModel.isPresentinSwitchableOrg(org3);

      // Assert
      expect(result, isFalse);
    });

    test('switchAbleOrg getter and setter work correctly', () {
      // Arrange
      final testOrg = OrgInfo(id: '1', name: 'Org 1');
      final orgs = [testOrg];

      // Act
      viewModel.switchAbleOrg = orgs;

      // Assert
      expect(viewModel.switchAbleOrg, equals(orgs));
    });

    test('selectedOrg getter returns correct organization', () {
      // Act & Assert (we can't set selectedOrg directly, but we can verify getter)
      expect(
          viewModel.selectedOrg, isNull); // Initially null after construction
    });

    test('controller is initialized', () {
      // Act & Assert
      expect(viewModel.controller, isNotNull);
      expect(viewModel.controller, isA<ScrollController>());
    });

    test('targets list is initialized', () {
      // Act & Assert
      expect(viewModel.targets, isNotNull);
      expect(viewModel.targets, isA<List<TargetFocus>>());
    });

    test('notifyListeners works when not disposed', () {
      // Act & Assert - notifyListeners should work normally before dispose
      expect(() => viewModel.notifyListeners(), isNot(throwsException));
    });
  });

  group('Custom Drawer Widget Integration', () {
    testWidgets(
      'CustomDrawer is present in MainScreen',
      (tester) async {
        await tester.pumpWidget(createHomePageScreen(demoMode: true));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Verify the drawer exists in the main screen
        expect(find.byKey(const Key('Drawer')), findsOneWidget);
      },
    );

    testWidgets('CustomDrawer contains UserAccountsDrawerHeader',
        (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify UserAccountsDrawerHeader is present in drawer
      expect(find.byType(UserAccountsDrawerHeader), findsOneWidget);
    });

    testWidgets('CustomDrawer has scroll functionality', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify scrollable ListView exists for switching organizations
      expect(find.byKey(const Key('Switching Org')), findsOneWidget);
    });
  });
}
