import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/view_model/main_screen_nav_view_model.dart';
import 'package:talawa/view_model/main_screen_tour_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/tour_targets/home_tour_targets.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockAppTour extends Mock implements AppTour {
  Function(TargetFocus)? capturedOnClickTarget;
  dynamic Function()? capturedOnFinish;
  List<FocusTarget>? capturedTargets;
  int callCount = 0;

  @override
  void showTutorial({
    required Function(TargetFocus) onClickTarget,
    required dynamic Function() onFinish,
    required List<FocusTarget> targets,
  }) {
    capturedOnClickTarget = onClickTarget;
    capturedOnFinish = onFinish;
    capturedTargets = targets;
    callCount++;
  }

  void clear() {
    capturedOnClickTarget = null;
    capturedOnFinish = null;
    capturedTargets = null;
    callCount = 0;
  }
}

class MockMainScreenNavViewModel extends Mock
    implements MainScreenNavViewModel {
  @override
  void removeListener(VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(#removeListener, [listener]),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(#dispose, []),
        returnValueForMissingStub: null,
      );

  @override
  void onTabTapped(int index) => super.noSuchMethod(
        Invocation.method(#onTabTapped, [index]),
        returnValueForMissingStub: null,
      );
}

class MockMainScreenTourViewModel extends Mock
    implements MainScreenTourViewModel {
  @override
  void removeListener(VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(#removeListener, [listener]),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(#dispose, []),
        returnValueForMissingStub: null,
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MainScreenViewModel viewModel;
  late UserConfig mockUserConfig;
  late MockAppTour mockAppTour;

  setUpAll(() {
    testSetupLocator();
    registerServices();
    SizeConfig().test();
    getAndRegisterNavigationService();
  });

  setUp(() {
    mockUserConfig = getAndRegisterUserConfig();
    viewModel = MainScreenViewModel();
    mockAppTour = MockAppTour();
    viewModel.tourViewModel.appTour = mockAppTour;
    MainScreenTourViewModel.transitionDelay = Duration.zero;
  });

  tearDownAll(() {
    unregisterServices();
    locator.reset();
  });

  Widget createTestWidget(Widget child) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: child,
    );
  }

  group('MainScreenViewModel', () {
    testWidgets(
        'initialise sets correct values when not fromSignUp and not demoMode',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.initialise(
        key.currentContext!,
        fromSignUp: false,
        mainScreenIndex: 2,
        demoMode: false,
      );
      expect(viewModel.currentPageIndex, 2);
      expect(viewModel.showAppTour, false);
      expect(viewModel.tourComplete, true);
      expect(viewModel.tourSkipped, false);
    });

    test('onTabTapped updates currentPageIndex and notifies listeners', () {
      bool notified = false;
      viewModel.navViewModel.addListener(() => notified = true);

      viewModel.onTabTapped(3);

      expect(viewModel.currentPageIndex, 3);
      expect(notified, true);
    });

    testWidgets(
        'setupNavigationItems sets navBarItems and pages for normal mode',
        (tester) async {
      appConfig.isDemoMode = false;
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.setupNavigationItems(key.currentContext!);
      expect(viewModel.navBarItems.length, 6);
      expect(viewModel.pages.length, 6);
    });

    testWidgets('setupNavigationItems sets navBarItems and pages for demo mode',
        (tester) async {
      appConfig.isDemoMode = true;
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.setupNavigationItems(key.currentContext!);
      expect(viewModel.navBarItems.length, 6);
      expect(viewModel.pages.length, 6);
    });

    test('exitDemoMode sets isDemoMode to false and navigates', () {
      appConfig.isDemoMode = true;
      viewModel.exitDemoMode();
      expect(appConfig.isDemoMode, false);
      verify(locator<NavigationService>().removeAllAndPush(
        Routes.setUrlScreen,
        Routes.splashScreen,
        arguments: '',
      ));
    });

    testWidgets('tourHomeTargets adds correct targets (Logged Out)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);

      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.tourHomeTargets(mockUserConfig);

      expect(viewModel.targets.any((t) => t.keyName == 'keySHOrgName'), true);
      expect(viewModel.targets.any((t) => t.keyName == 'keySHMenuIcon'), true);
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerCurOrg'), true);
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerSwitchableOrg'),
          true);
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerJoinOrg'), true);

      // Should NOT have LeaveCurrentOrg if logged out
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerLeaveCurrentOrg'),
          false);

      expect(viewModel.targets.any((t) => t.keyName == 'keyBNHome'), true);
      expect(
          viewModel.targets.any((t) => t.keyName == 'keySHPinnedPost'), true);
      expect(viewModel.targets.any((t) => t.keyName == 'keySHPost'), true);
    });

    testWidgets('tourHomeTargets adds correct targets (Logged In)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);

      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.tourHomeTargets(mockUserConfig);

      // Should HAVE LeaveCurrentOrg if logged in
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerLeaveCurrentOrg'),
          true);
    });

    testWidgets('tourEventTargets adds correct targets', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.tourEventTargets();
      expect(
        viewModel.targets.any((t) => t.keyName == 'keyBNEvents'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySECategoryMenu'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySEDateFilter'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySECard'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySEAdd'),
        true,
      );
    });

    testWidgets('tourAddPost adds correct targets', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.tourAddPost();
      expect(viewModel.targets.length, 1);
      expect(viewModel.targets.first.keyName, 'keyBNPost');
    });

    testWidgets('tourChat adds correct targets', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.tourChat();
      expect(viewModel.targets.length, 1);
      expect(viewModel.targets.first.keyName, 'keyBNChat');
    });

    testWidgets('tourProfile adds correct targets', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.tourProfile();
      expect(
        viewModel.targets.any((t) => t.keyName == 'keyBNProfile'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySPAppSetting'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySPHelp'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySPDonateUs'),
        true,
      );
      expect(
        viewModel.targets.any((t) => t.keyName == 'keySPPalisadoes'),
        true,
      );
    });

    testWidgets('initialise sets correct values when fromSignUp is true',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.initialise(
        key.currentContext!,
        fromSignUp: true,
        mainScreenIndex: 0,
        demoMode: false,
      );
      expect(viewModel.currentPageIndex, 0);
      expect(viewModel.showAppTour, true);
      expect(appConfig.isDemoMode, false);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    });

    testWidgets('initialise sets correct values when demoMode is true',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.initialise(
        key.currentContext!,
        fromSignUp: false,
        mainScreenIndex: 1,
        demoMode: true,
      );
      expect(viewModel.currentPageIndex, 1);
      expect(viewModel.showAppTour, true);
      expect(appConfig.isDemoMode, true);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    });

    testWidgets(
        'initialise sets correct values when both fromSignUp and demoMode are true',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.initialise(
        key.currentContext!,
        fromSignUp: true,
        mainScreenIndex: 1,
        demoMode: true,
      );
      expect(viewModel.currentPageIndex, 1);
      expect(viewModel.showAppTour, true);
      expect(appConfig.isDemoMode, true);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    });

    test('currentPageIndex initializes to 0', () {
      expect(viewModel.currentPageIndex, 0);
    });

    test('tourComplete initializes to false', () {
      expect(viewModel.tourComplete, false);
    });

    test('tourSkipped initializes to false', () {
      expect(viewModel.tourSkipped, false);
    });

    test('tourSkipped setter notifies listeners', () {
      var notified = false;
      viewModel.addListener(() {
        notified = true;
      });

      viewModel.tourSkipped = true;

      expect(viewModel.tourSkipped, true);
      expect(notified, true,
          reason: 'Setting tourSkipped should notify listeners');
    });

    test('targets list is initially empty', () {
      expect(viewModel.targets, isEmpty);
    });

    testWidgets('pages list is initially empty', (tester) async {
      expect(viewModel.pages, isEmpty);
    });

    testWidgets('navBarItems list is initially empty', (tester) async {
      expect(viewModel.navBarItems, isEmpty);
    });

    testWidgets('appTourDialog returns CustomAlertDialog widget',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      final dialog = viewModel.appTourDialog(key.currentContext!);
      expect(dialog, isA<Widget>());
    });

    testWidgets('showHome handles keyDrawerLeaveCurrentOrg target',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;

      final target = TargetFocus(
        identify: 'keyDrawerLeaveCurrentOrg',
        keyTarget: viewModel.keys.keyDrawerLeaveCurrentOrg,
      );

      await viewModel.showHome(target);
      await tester.pump();

      verify(navigationService.pop()).called(1);
    });

    testWidgets('showHome handles unrecognized target', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;

      final target = TargetFocus(
        identify: 'unknownTarget',
        keyTarget: GlobalKey(),
      );

      await viewModel.showHome(target);
      await tester.pump();
    });

    testWidgets('GlobalKeys are properly initialized', (tester) async {
      expect(viewModel.keys.scaffoldKey, isNotNull);
      expect(viewModel.keys.keyBNHome, isNotNull);
      expect(viewModel.keys.keyBNDemoHome, isNotNull);
      expect(viewModel.keys.keySHPinnedPost, isNotNull);
      expect(viewModel.keys.keySHPost, isNotNull);
      expect(viewModel.keys.keySHOrgName, isNotNull);
      expect(viewModel.keys.keySHMenuIcon, isNotNull);
      expect(viewModel.keys.keyDrawerCurOrg, isNotNull);
      expect(viewModel.keys.keyDrawerSwitchableOrg, isNotNull);
      expect(viewModel.keys.keyDrawerJoinOrg, isNotNull);
      expect(viewModel.keys.keyDrawerLeaveCurrentOrg, isNotNull);
      expect(viewModel.keys.keyBNEvents, isNotNull);
      expect(viewModel.keys.keyBNDemoEvents, isNotNull);
      expect(viewModel.keys.keySECategoryMenu, isNotNull);
      expect(viewModel.keys.keySEDateFilter, isNotNull);
      expect(viewModel.keys.keySEAdd, isNotNull);
      expect(viewModel.keys.keySECard, isNotNull);
      expect(viewModel.keys.keyBNPost, isNotNull);
      expect(viewModel.keys.keyBNDemoPost, isNotNull);
      expect(viewModel.keys.keyBNChat, isNotNull);
      expect(viewModel.keys.keyBNProfile, isNotNull);
      expect(viewModel.keys.keyBNDemoProfile, isNotNull);
      expect(viewModel.keys.keyBNFunds, isNotNull);
      expect(viewModel.keys.keySPEditProfile, isNotNull);
      expect(viewModel.keys.keySPAppSetting, isNotNull);
      expect(viewModel.keys.keySPHelp, isNotNull);
      expect(viewModel.keys.keySPDonateUs, isNotNull);
      expect(viewModel.keys.keySPInvite, isNotNull);
      expect(viewModel.keys.keySPLogout, isNotNull);
      expect(viewModel.keys.keySPPalisadoes, isNotNull);
    });

    testWidgets(
        'tourHomeTargets clears existing targets before adding new ones',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);

      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.targets.add(
        FocusTarget(
          key: GlobalKey(),
          keyName: 'dummy',
          description: 'dummy',
          appTour: viewModel.appTour,
        ),
      );
      expect(viewModel.targets.length, 1);

      viewModel.tourHomeTargets(mockUserConfig);

      expect(viewModel.targets.isNotEmpty, true);
      expect(
        viewModel.targets.any((t) => t.keyName == 'dummy'),
        false,
      );
    });

    testWidgets(
        'tourEventTargets clears existing targets before adding new ones',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.targets.add(
        FocusTarget(
          key: GlobalKey(),
          keyName: 'dummy',
          description: 'dummy',
          appTour: viewModel.appTour,
        ),
      );
      viewModel.tourEventTargets();
      expect(
        viewModel.targets.any((t) => t.keyName == 'dummy'),
        false,
      );
    });

    testWidgets('tourAddPost clears existing targets before adding new ones',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.targets.add(
        FocusTarget(
          key: GlobalKey(),
          keyName: 'dummy',
          description: 'dummy',
          appTour: viewModel.appTour,
        ),
      );
      viewModel.tourAddPost();
      expect(
        viewModel.targets.any((t) => t.keyName == 'dummy'),
        false,
      );
    });

    testWidgets('tourChat clears existing targets before adding new ones',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.targets.add(
        FocusTarget(
          key: GlobalKey(),
          keyName: 'dummy',
          description: 'dummy',
          appTour: viewModel.appTour,
        ),
      );
      viewModel.tourChat();
      expect(
        viewModel.targets.any((t) => t.keyName == 'dummy'),
        false,
      );
    });

    testWidgets('tourProfile clears existing targets before adding new ones',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.targets.add(
        FocusTarget(
          key: GlobalKey(),
          keyName: 'dummy',
          description: 'dummy',
          appTour: viewModel.appTour,
        ),
      );
      viewModel.tourProfile();
      expect(
        viewModel.targets.any((t) => t.keyName == 'dummy'),
        false,
      );
    });

    testWidgets(
        'setupNavigationItems verifies navigation items are correctly labeled',
        (tester) async {
      appConfig.isDemoMode = false;
      final key = GlobalKey();
      await tester.pumpWidget(
        createTestWidget(
          SizedBox(key: key),
        ),
      );
      await tester.pumpAndSettle();

      final ctx = key.currentContext!;
      viewModel.setupNavigationItems(ctx);
      expect(
        viewModel.navBarItems[0].label,
        AppLocalizations.of(ctx)!.strictTranslate('Home'),
      );
      expect(
        viewModel.navBarItems[1].label,
        AppLocalizations.of(ctx)!.strictTranslate('Events'),
      );
      expect(
        viewModel.navBarItems[2].label,
        AppLocalizations.of(ctx)!.strictTranslate('Chat'),
      );
      expect(
        viewModel.navBarItems[3].label,
        AppLocalizations.of(ctx)!.strictTranslate('Funds'),
      );
      expect(
        viewModel.navBarItems[4].label,
        AppLocalizations.of(ctx)!.strictTranslate('Profile'),
      );
      expect(
        viewModel.navBarItems[5].label,
        AppLocalizations.of(ctx)!.strictTranslate('Menu'),
      );
    });

    testWidgets(
        'tourHomeTargets onFinish callback navigates to next tab and starts event tour',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;

      viewModel.tourHomeTargets(mockUserConfig);

      expect(mockAppTour.callCount, 1);
      expect(mockAppTour.capturedTargets, isNotEmpty);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      expect(viewModel.currentPageIndex, 1);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourEventTargets onFinish callback navigates to next tab and starts add post tour',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.navViewModel.currentPageIndex = 1;

      viewModel.tourEventTargets();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      expect(viewModel.currentPageIndex, 2);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourAddPost onFinish callback navigates to next tab and starts chat tour',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.navViewModel.currentPageIndex = 2; // Post tab index (assuming)

      viewModel.tourAddPost();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      expect(viewModel.currentPageIndex, 2);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourChat onFinish callback navigates to next tab and starts profile tour',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.navViewModel.currentPageIndex = 3;

      viewModel.tourChat();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      expect(viewModel.currentPageIndex, 4);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourProfile onFinish callback completes tour and navigates home',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;
      viewModel.navViewModel.currentPageIndex = 4;

      viewModel.tourProfile();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      expect(viewModel.tourComplete, true);
      expect(viewModel.currentPageIndex, 0);
    });
    test('dispose removes listeners and disposes sub-models', () {
      final mockNav = MockMainScreenNavViewModel();
      final mockTour = MockMainScreenTourViewModel();
      final keys = MainScreenKeys();

      // We skip the 'when' clauses for void methods and just verify.

      final model = MainScreenViewModel.createForTest(
        keysInstance: keys,
        navInstance: mockNav,
        tourInstance: mockTour,
      );

      model.dispose();

      verify(mockNav.removeListener(model.notifyListeners)).called(1);
      verify(mockTour.removeListener(model.notifyListeners)).called(1);
      verify(mockNav.dispose()).called(1);
      verify(mockTour.dispose()).called(1);
    });

    testWidgets('createForTest initializes correctly', (tester) async {
      final model = MainScreenViewModel.createForTest();
      expect(model.keys, isNotNull);
      expect(model.navViewModel, isNotNull);
      expect(model.tourViewModel, isNotNull);
    });

    testWidgets('appTourDialog success callback starts tour', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;

      // Mock dependencies
      // To make viewModel internal logic work, we need to supply its keys.scaffoldKey
      // But we can't easily swap the final keys in viewModel.
      // Instead, we just verify that the logic *attempts* to call tourHomeTargets.

      // However, the error is 'Null check operator used on a null value' likely in the app itself or test logic.
      // Line 890 is: viewModel.appTourDialog(key.currentContext!) as CustomAlertDialog;
      // It returns Widget, we cast it. appTourDialog returns CustomAlertDialog.
      // The issue might be inside dialog.success() execution in the app code?
      // "if (scaffoldKey.currentState?.isDrawerOpen ?? false)" -> safe
      // "tourHomeTargets(scaffoldKey)" -> clear targets, addAll, showTutorial.

      // Let's mock AppTour showTutorial to do nothing or capture.
      // It is already mocked as mockAppTour.

      final dialog =
          viewModel.appTourDialog(key.currentContext!) as CustomAlertDialog;

      // Execute success callback
      dialog.success();

      // Verify navigation pop
      verify(navigationService.pop()).called(1);

      // Check if targets were added - this confirms tourHomeTargets was called
      expect(viewModel.targets, isNotEmpty);
      expect(viewModel.targets, isNotEmpty);
    });

    testWidgets('tourHomeTargets sets up onClickTarget correctly',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;

      // Initialize tour with targets
      viewModel.tourHomeTargets(mockUserConfig);

      expect(mockAppTour.capturedOnClickTarget, isNotNull);

      // Verify onClickTarget calls HomeTourTargets.handleClick.
      // Since handleClick is a static method that manipulates state (like opening drawer),
      // we can verify it by checking the side effect on a scaffoldKey.
      // However, we passed keys.scaffoldKey which we don't control easily here.
      // But we can verify no error is thrown at least, or try to spy if possible.
      // Given we tested handleClick separately, calling the captured callback proves wiring.

      final target = TargetFocus(identify: 'dummy', keyTarget: GlobalKey());
      // Just ensure it can be called without error (it might do nothing if target is dummy)
      mockAppTour.capturedOnClickTarget!(target);
    });

    testWidgets(
        'tourEventTargets sets up empty onClickTarget that can be called',
        (tester) async {
      viewModel.tourEventTargets();
      expect(mockAppTour.capturedOnClickTarget, isNotNull);
      // Call it to ensure coverage (it does nothing)
      mockAppTour.capturedOnClickTarget!(
          TargetFocus(identify: 'dummy', keyTarget: GlobalKey()));
    });

    testWidgets('tourChat sets up empty onClickTarget that can be called',
        (tester) async {
      viewModel.tourChat();
      expect(mockAppTour.capturedOnClickTarget, isNotNull);
      mockAppTour.capturedOnClickTarget!(
          TargetFocus(identify: 'dummy', keyTarget: GlobalKey()));
    });

    testWidgets('tourProfile sets up empty onClickTarget that can be called',
        (tester) async {
      viewModel.tourProfile();
      expect(mockAppTour.capturedOnClickTarget, isNotNull);
      mockAppTour.capturedOnClickTarget!(
          TargetFocus(identify: 'dummy', keyTarget: GlobalKey()));
    });

    testWidgets('tourAddPost sets up empty onClickTarget that can be called',
        (tester) async {
      viewModel.tourAddPost();
      expect(mockAppTour.capturedOnClickTarget, isNotNull);
      mockAppTour.capturedOnClickTarget!(
          TargetFocus(identify: 'dummy', keyTarget: GlobalKey()));
    });

    testWidgets('appTourDialog success callback closes drawer if open',
        (tester) async {
      // Create keys explicitly to share the scaffoldKey
      final keys = MainScreenKeys();
      // Re-initialize ViewModel with these keys
      viewModel = MainScreenViewModel.createForTest(keysInstance: keys);
      // We need to re-mock appTour because creating a new VM re-creates sub-models
      mockAppTour = MockAppTour();
      viewModel.tourViewModel.appTour = mockAppTour;

      final scaffoldKey = keys.scaffoldKey;

      await tester.pumpWidget(createTestWidget(
        Scaffold(
          key: scaffoldKey,
          drawer: const Drawer(child: Text("Drawer")),
          body: Container(),
        ),
      ));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = keys.scaffoldKey.currentContext!;

      // Open drawer
      scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();
      expect(scaffoldKey.currentState?.isDrawerOpen, true);

      final dialog = viewModel.appTourDialog(keys.scaffoldKey.currentContext!)
          as CustomAlertDialog;

      // Execute success callback
      dialog.success();
      await tester.pumpAndSettle();

      // Verify drawer is closed
      expect(scaffoldKey.currentState?.isDrawerOpen, false);

      // Verify navigation pop was still called (from success() implementation)
      verify(navigationService.pop()).called(1);
    });

    testWidgets('HomeTourTargets keySHMenuIcon next callback opens drawer',
        (tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      final mockKeys = MainScreenKeys();

      await tester.pumpWidget(createTestWidget(
        Scaffold(
          key: scaffoldKey,
          drawer: const Drawer(child: Text("Drawer")),
          body: Container(),
        ),
      ));
      await tester.pumpAndSettle();

      final targets = HomeTourTargets.build(
          keys: mockKeys,
          appTour: MockAppTour(),
          scaffoldKey: scaffoldKey,
          userConfig: mockUserConfig);

      final target = targets.firstWhere((t) => t.keyName == 'keySHMenuIcon');

      // Execute the next callback
      target.next!();
      await tester.pumpAndSettle();

      expect(scaffoldKey.currentState?.isDrawerOpen, true);
    });

    testWidgets(
        'HomeTourTargets keyDrawerLeaveCurrentOrg next callback pops navigation',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);
      final scaffoldKey = GlobalKey<ScaffoldState>();
      final mockKeys = MainScreenKeys();

      await tester.pumpWidget(createTestWidget(Container()));
      await tester.pumpAndSettle();

      final targets = HomeTourTargets.build(
          keys: mockKeys,
          appTour: MockAppTour(),
          scaffoldKey: scaffoldKey,
          userConfig: mockUserConfig);

      final target =
          targets.firstWhere((t) => t.keyName == 'keyDrawerLeaveCurrentOrg');

      // Execute the next callback
      target.next!();

      verify(navigationService.pop()).called(1);
    });

    testWidgets('appTourDialog secondary callback skips tour', (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.tourViewModel.context = key.currentContext!;

      final dialog =
          viewModel.appTourDialog(key.currentContext!) as CustomAlertDialog;

      // Execute skip callback
      dialog.secondaryButtonTap!();

      verify(navigationService.pop()).called(1);
      expect(viewModel.tourSkipped, true);
      expect(viewModel.tourComplete, false);
    });

    testWidgets('HomeTourTargets.handleClick opens drawer for keySHMenuIcon',
        (tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(
          createTestWidget(Scaffold(key: scaffoldKey, drawer: const Drawer())));
      await tester.pumpAndSettle();

      final target =
          TargetFocus(identify: 'keySHMenuIcon', keyTarget: GlobalKey());
      await HomeTourTargets.handleClick(target, scaffoldKey);
      await tester.pumpAndSettle();

      expect(scaffoldKey.currentState?.isDrawerOpen, true);
    });

    testWidgets('HomeTourTargets.handleClick closes drawer for keyBNHome',
        (tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(
          createTestWidget(Scaffold(key: scaffoldKey, drawer: const Drawer())));
      await tester.pumpAndSettle();

      // Open drawer first
      scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();
      expect(scaffoldKey.currentState?.isDrawerOpen, true);

      final target = TargetFocus(identify: 'keyBNHome', keyTarget: GlobalKey());

      // Don't await immediately, allow pump to process the delayed future
      final future = HomeTourTargets.handleClick(target, scaffoldKey);

      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      await future;

      expect(scaffoldKey.currentState?.isDrawerOpen, false);
    });

    testWidgets(
        'HomeTourTargets keyDrawerJoinOrg next callback pops if logged out',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);
      final scaffoldKey = GlobalKey<ScaffoldState>();
      final mockKeys = MainScreenKeys();

      final targets = HomeTourTargets.build(
          keys: mockKeys,
          appTour: MockAppTour(),
          scaffoldKey: scaffoldKey,
          userConfig: mockUserConfig);

      final target = targets.firstWhere((t) => t.keyName == 'keyDrawerJoinOrg');
      target.next!();

      verify(navigationService.pop()).called(1);
    });

    testWidgets('Tour stops progression if skipped', (tester) async {
      viewModel.tourSkipped = true;

      viewModel.tourHomeTargets(mockUserConfig);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();

      // Execute onFinish without awaiting it to avoid deadlock with cached pump
      // The onFinish has a delayed future which needs time to pass.
      final future = onFinish();

      await tester.pump(const Duration(milliseconds: 500));
      await future;

      // Should NOT call tourEventTargets (which would add targets)
      expect(mockAppTour.callCount, 0);
    });
  });
}
