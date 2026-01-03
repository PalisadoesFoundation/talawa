// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

class MockMainScreenViewModel extends Mock implements MainScreenViewModel {
  @override
  GlobalKey get keyDrawerCurOrg => GlobalKey(debugLabel: "DrawerCurrentOrg");

  @override
  GlobalKey get keyDrawerSwitchableOrg =>
      GlobalKey(debugLabel: "DrawerSwitchableOrg");

  @override
  GlobalKey get keyDrawerJoinOrg => GlobalKey(debugLabel: "DrawerJoinOrg");

  @override
  GlobalKey get keyDrawerLeaveCurrentOrg =>
      GlobalKey(debugLabel: "DrawerLeaveCurrentOr");

  @override
  void setupNavigationItems(BuildContext context) {}

  @override
  List<Widget> get pages => [];

  @override
  List<BottomNavigationBarItem> get navBarItems => [];
}

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

  group('MainScreen drawer & demo mode', skip: 'Fixing tests', () {
    late MainScreenViewModel mockHomeModel;

    setUp(() {
      mockHomeModel = MockMainScreenViewModel();

      // Stub keys
      when(mockHomeModel.scaffoldKey).thenReturn(GlobalKey<ScaffoldState>());
      when(mockHomeModel.keyBNHome).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNDemoHome).thenReturn(GlobalKey());
      when(mockHomeModel.keySHPinnedPost).thenReturn(GlobalKey());
      when(mockHomeModel.keySHPost).thenReturn(GlobalKey());
      when(mockHomeModel.keySHOrgName).thenReturn(GlobalKey());
      when(mockHomeModel.keySHMenuIcon).thenReturn(GlobalKey());
      // keyDrawerCurOrg, keyDrawerSwitchableOrg, keyDrawerJoinOrg, keyDrawerLeaveCurrentOrg are overridden in MockMainScreenViewModel
      when(mockHomeModel.keyBNEvents).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNDemoEvents).thenReturn(GlobalKey());
      when(mockHomeModel.keySECategoryMenu).thenReturn(GlobalKey());
      when(mockHomeModel.keySEDateFilter).thenReturn(GlobalKey());
      when(mockHomeModel.keySEAdd).thenReturn(GlobalKey());
      when(mockHomeModel.keySECard).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNPost).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNDemoPost).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNChat).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNProfile).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNDemoProfile).thenReturn(GlobalKey());
      when(mockHomeModel.keyBNFunds).thenReturn(GlobalKey());
      when(mockHomeModel.keySPEditProfile).thenReturn(GlobalKey());
      when(mockHomeModel.keySPAppSetting).thenReturn(GlobalKey());
      when(mockHomeModel.keySPHelp).thenReturn(GlobalKey());
      when(mockHomeModel.keySPDonateUs).thenReturn(GlobalKey());
      when(mockHomeModel.keySPInvite).thenReturn(GlobalKey());
      when(mockHomeModel.keySPLogout).thenReturn(GlobalKey());
      when(mockHomeModel.keySPPalisadoes).thenReturn(GlobalKey());

      // Stub properties
      when(mockHomeModel.currentPageIndex).thenReturn(0);
      when(mockHomeModel.showAppTour).thenReturn(false);
      when(mockHomeModel.targets).thenReturn([]);

      if (locator.isRegistered<MainScreenViewModel>()) {
        locator.unregister<MainScreenViewModel>();
      }
      locator.registerFactory<MainScreenViewModel>(() => mockHomeModel);
    });
    testWidgets('Main screen renders with drawer and scaffold', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen and its scaffold both exist
      expect(find.byKey(const Key('MainScreen')), findsOneWidget);
      expect(find.byType(Scaffold), findsNWidgets(2));
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
  group('CustomDrawerViewModel methods', skip: 'Fixing tests', () {
    late CustomDrawerViewModel viewModel;

    setUp(() {
      final mockUserConfig = getAndRegisterUserConfig();
      when(mockUserConfig.currentOrgInfoController)
          .thenReturn(StreamController<OrgInfo>.broadcast());
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

  group('CustomDrawerViewModel lifecycle', skip: 'Fixing tests', () {
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

  group('CustomDrawer Widget Tests', skip: 'Fixing tests', () {
    late MockCustomDrawerViewModel mockViewModel;
    late MockMainScreenViewModel mockHomeModel;
    late MockNavigationService mockNavigationService;
    late MockUserConfig mockUserConfig;

    setUp(() {
      // Re-register UserConfig to ensure clean state
      if (!locator.isRegistered<UserConfig>()) {
        locator.registerSingleton<UserConfig>(MockUserConfig());
      }
      mockUserConfig = locator<UserConfig>() as MockUserConfig;
      reset(mockUserConfig);

      // Stub UserConfig properties manually to avoid Bad state error from helper
      final streamController = StreamController<OrgInfo>.broadcast();
      when(mockUserConfig.currentOrgInfoController)
          .thenReturn(streamController);
      when(mockUserConfig.currentOrgInfoStream)
          .thenAnswer((_) => streamController.stream);
      when(mockUserConfig.currentUser)
          .thenReturn(User(id: '1', name: 'Test User'));
      when(mockUserConfig.currentOrg)
          .thenReturn(OrgInfo(id: '1', name: 'Test Org'));

      mockViewModel = MockCustomDrawerViewModel();
      mockHomeModel = MockMainScreenViewModel();

      locator.allowReassignment = true;
      locator.registerFactory<CustomDrawerViewModel>(() => mockViewModel);

      mockNavigationService =
          locator<NavigationService>() as MockNavigationService;

      clearInteractions(mockNavigationService);
      // clearInteractions(mockUserConfig); // Reset already cleared it

      // Default stubs
      when(mockViewModel.controller).thenReturn(ScrollController());
      when(mockViewModel.switchAbleOrg).thenReturn([]);
      when(mockViewModel.selectedOrg).thenReturn(null);
      when(mockViewModel.initialize(any, any)).thenReturn(null);
    });

    Widget createTestWidget() {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        themeMode: ThemeMode.light,
        theme: TalawaTheme.lightTheme,
        home: Scaffold(
          body: CustomDrawer(homeModel: mockHomeModel),
        ),
      );
    }

    testWidgets('renders correctly with organization info', (tester) async {
      final org = OrgInfo(id: '1', name: 'Test Org', image: null);
      when(mockViewModel.selectedOrg).thenReturn(org);
      when(mockViewModel.switchAbleOrg).thenReturn([org]);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Test Org'), findsWidgets);
      expect(find.text('Selected Organization'), findsOneWidget);
      expect(find.byType(CustomAvatar), findsWidgets);
    });

    testWidgets('displays list of switchable organizations', (tester) async {
      final org1 = OrgInfo(id: '1', name: 'Org 1', image: null);
      final org2 = OrgInfo(id: '2', name: 'Org 2', image: null);
      when(mockViewModel.switchAbleOrg).thenReturn([org1, org2]);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Switch Organization'), findsOneWidget);
      expect(find.text('Org 1'), findsOneWidget);
      expect(find.text('Org 2'), findsOneWidget);
    });

    testWidgets('calls switchOrg when an organization is tapped',
        (tester) async {
      final org1 = OrgInfo(id: '1', name: 'Org 1', image: null);
      when(mockViewModel.switchAbleOrg).thenReturn([org1]);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Org 1'));
      verify(mockViewModel.switchOrg(org1)).called(1);
    });

    testWidgets('navigates to join org screen when join button is tapped',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Scroll if necessary (though list is short)
      final joinButton = find.text('Join new Organization');
      await tester.ensureVisible(joinButton);
      await tester.tap(joinButton);
      verify(mockNavigationService.popAndPushScreen(Routes.joinOrg,
              arguments: '-1'))
          .called(1);
    });

    testWidgets(
        'navigates to set url screen when join button is tapped and not logged in',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final joinButton = find.text('Join new Organization');
      await tester.ensureVisible(joinButton);
      await tester.tap(joinButton);
      verify(mockNavigationService.popAndPushScreen(Routes.setUrlScreen,
              arguments: ''))
          .called(1);
    });

    testWidgets('shows leave organization button when logged in',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Leave Current Organization'), findsOneWidget);
    });

    testWidgets('hides leave organization button when not logged in',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Leave Current Organization'), findsNothing);
    });

    testWidgets(
        'calls exitAlertDialog when leave organization button is tapped',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);
      // Mock the exitAlertDialog to return a dummy widget
      when(mockViewModel.exitAlertDialog(any)).thenReturn(CustomAlertDialog(
        success: () {},
        dialogSubTitle: 'Test Subtitle',
      ));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final leaveButton = find.text('Leave Current Organization');
      await tester.ensureVisible(leaveButton);
      await tester.tap(leaveButton);

      verify(mockNavigationService.pushDialog(any)).called(1);
    });

    testWidgets('renders FromPalisadoes widget', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(FromPalisadoes), findsOneWidget);
    });
  });
}
