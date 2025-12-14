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
      // Test that the exit alert dialog widget renders correctly
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
      // Test exit dialog interactions (verifying button availability)
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

      // Verify dialog is present
      expect(find.byKey(const Key("Exit?")), findsOneWidget);

      // Find the Exit button by its key (RaisedRoundedButton uses Key with button text)
      final exitButton = find.byKey(const Key('Exit'));
      expect(exitButton, findsOneWidget);

      // Verify Cancel button is also present
      final cancelButton = find.byKey(const Key('Close'));
      expect(cancelButton, findsOneWidget);

      // Test confirms both buttons are present for interaction
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
  });

  group('CustomDrawerViewModel lifecycle', () {
    test(
      'switchOrg maintains state when attempting to switch to already selected org',
      () {
        // Arrange
        final viewModel = CustomDrawerViewModel();
        final org1 = OrgInfo(id: '1', name: 'Org 1');
        viewModel.switchAbleOrg = [org1];
        viewModel.setSelectedOrganizationName(org1);

        // Act & Assert
        // When switchOrg is called with the already selected org,
        // verify that the state remains unchanged (selectedOrg stays the same).
        // Note: This test verifies state management behavior only.
        // The actual warning/snackbar is handled by navigationService which is mocked.
        expect(viewModel.selectedOrg, equals(org1));

        // Call switchOrg with the already selected org
        viewModel.switchOrg(org1);

        // Assert - The selected org should remain the same after calling switchOrg
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
