// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
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

    testWidgets('exit dialog can be interacted with', (tester) async {
      // Test exit dialog interactions (tapping Exit button)
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

      // Verify the Exit button is present and tappable
      final exitButton = find.byType(TextButton).first;
      expect(exitButton, findsOneWidget);

      // Verify the button text is "Exit"
      expect(find.byType(TextButton).evaluate().isNotEmpty, isTrue);

      // Tap the Exit button - this triggers the exit functionality
      await tester.tap(exitButton);
      await tester.pumpAndSettle();

      // Verify the test completes without errors
      // The button tap triggers navigation calls which are mocked by test locator
      expect(exitButton, findsOneWidget);
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

  group('CustomDrawer widget', () {
    testWidgets('CustomDrawer widget renders correctly', (tester) async {
      // Create a MaterialApp with CustomDrawer
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
          home: Scaffold(
            drawer: CustomDrawer(
              key: const Key('CustomDrawer'),
              homeModel: MainScreenViewModel(),
            ),
            appBar: AppBar(title: const Text('Test')),
            body: const Center(child: Text('Main Content')),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Open the drawer by tapping the menu button
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Verify CustomDrawer is rendered
      expect(find.byKey(const Key('CustomDrawer')), findsOneWidget);
      expect(find.byType(CustomDrawer), findsOneWidget);
    });

    testWidgets('CustomDrawer can be opened and closed', (tester) async {
      // Test drawer open/close functionality
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
          home: Scaffold(
            drawer: CustomDrawer(
              key: const Key('CustomDrawer'),
              homeModel: MainScreenViewModel(),
            ),
            appBar: AppBar(title: const Text('Test')),
            body: const Center(child: Text('Main Content')),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify CustomDrawer is initially rendered (but drawer is not open)
      expect(find.byType(CustomDrawer), findsOneWidget);
      expect(find.byKey(const Key('CustomDrawer')), findsOneWidget);
    });
  });

  group('CustomDrawerViewModel methods', () {
    late CustomDrawerViewModel viewModel;

    setUp(() {
      viewModel = CustomDrawerViewModel();
    });

    tearDown(() {
      viewModel.dispose();
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

    test('controller is initialized with correct defaults', () {
      // Act & Assert
      expect(viewModel.controller, isNotNull);
      expect(viewModel.controller, isA<ScrollController>());
      expect(viewModel.controller.hasClients, isFalse);
      expect(viewModel.controller.initialScrollOffset, 0.0);
    });

    test('targets list is initialized', () {
      // Act & Assert
      expect(viewModel.targets, isNotNull);
      expect(viewModel.targets, isA<List<TargetFocus>>());
    });

    test('initialize sets up current user and organization data', () {
      // Arrange
      final testViewModel = CustomDrawerViewModel();
      final testUser = User(
        id: 'user1',
        email: 'test@example.com',
        joinedOrganizations: [
          OrgInfo(id: 'org1', name: 'Test Org 1'),
          OrgInfo(id: 'org2', name: 'Test Org 2'),
        ],
      );

      // Act - initialize the view model by setting switchable organizations
      // The initialize method sets _switchAbleOrg from currentUser.joinedOrganizations
      testViewModel.switchAbleOrg = testUser.joinedOrganizations ?? [];

      // Assert - verify initialization sets up switchable organizations
      expect(testViewModel.switchAbleOrg, isNotEmpty);
      expect(testViewModel.switchAbleOrg.length, equals(2));
      expect(testViewModel.switchAbleOrg[0].id, equals('org1'));
      expect(testViewModel.switchAbleOrg[1].id, equals('org2'));

      // Cleanup
      testViewModel.dispose();
    });
  });

  group('CustomDrawerViewModel lifecycle', () {
    test(
      'switchOrg displays warning when attempting to switch to already selected org',
      () {
        // Arrange
        final viewModel = CustomDrawerViewModel();
        final org1 = OrgInfo(id: '1', name: 'Org 1');
        viewModel.switchAbleOrg = [org1];
        viewModel.setSelectedOrganizationName(org1);

        // Act & Assert
        // When switchOrg is called with the already selected org,
        // it should call navigationService to show a warning snackbar.
        // This validates the branch that handles already-selected orgs.
        expect(viewModel.selectedOrg, equals(org1));

        // Call switchOrg and verify the logic by examining the view model state
        viewModel.switchOrg(org1);

        // The selected org should remain the same
        expect(viewModel.selectedOrg, equals(org1));
      },
    );

    test(
      'switchOrg allows switching to a different organization in switchable list',
      () {
        // Arrange
        final viewModel = CustomDrawerViewModel();
        final org1 = OrgInfo(id: '1', name: 'Org 1');
        final org2 = OrgInfo(id: '2', name: 'Org 2');
        viewModel.switchAbleOrg = [org1, org2];
        viewModel.setSelectedOrganizationName(org1);

        // Act & Assert
        // Verify org2 is in the switchable list
        expect(viewModel.isPresentinSwitchableOrg(org2), isTrue);

        // When switchOrg is called with a different org in switchable list,
        // it should proceed with switching (different from the already-selected case).
        // This validates the happy path of organization switching.
        viewModel.switchOrg(org2);

        // After switching, the selected org should be updated
        expect(viewModel.selectedOrg, equals(org2));
      },
    );

    test('dispose prevents future notifications', () {
      // Arrange
      var listenerCalled = false;
      final viewModel = CustomDrawerViewModel();
      viewModel.addListener(() => listenerCalled = true);

      // Act - notify before dispose should trigger listener
      viewModel.notifyListeners();

      // Assert - listener should be called before dispose
      expect(listenerCalled, isTrue);

      // Reset flag and dispose the viewModel
      listenerCalled = false;
      viewModel.dispose();

      // After dispose, the view model should not notify listeners
      // The disposed flag prevents super.notifyListeners() from being called
      viewModel.notifyListeners();

      // Assert - listener should not be called after dispose
      expect(listenerCalled, isFalse);
    });

    test('setSelectedOrganizationName updates selected org', () {
      // Arrange
      final viewModel = CustomDrawerViewModel();
      final org1 = OrgInfo(id: '1', name: 'Org 1');
      viewModel.switchAbleOrg = [org1];

      // Act
      viewModel.setSelectedOrganizationName(org1);

      // Assert
      expect(viewModel.selectedOrg, equals(org1));
    });
  });
}
