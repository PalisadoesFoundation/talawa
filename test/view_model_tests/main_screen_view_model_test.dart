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
import 'package:talawa/view_model/main_screen_view_model.dart';
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
    viewModel.appTour = mockAppTour;
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
      viewModel.addListener(() => notified = true);

      viewModel.currentPageIndex = 0;
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

    testWidgets('appTourDialog returns CustomAlertDialog', (tester) async {
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

    test('currentPageIndex initializes to 0', () {
      expect(viewModel.currentPageIndex, 0);
    });

    test('tourComplete initializes to false', () {
      expect(viewModel.tourComplete, false);
    });

    test('tourSkipped initializes to false', () {
      expect(viewModel.tourSkipped, false);
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

      viewModel.context = key.currentContext!;

      final target = TargetFocus(
        identify: 'keyDrawerLeaveCurrentOrg',
        keyTarget: viewModel.keyDrawerLeaveCurrentOrg,
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

      viewModel.context = key.currentContext!;

      final target = TargetFocus(
        identify: 'unknownTarget',
        keyTarget: GlobalKey(),
      );

      await viewModel.showHome(target);
      await tester.pump();
    });

    test('demoMode updates via AppConfigService', () {
      appConfig.isDemoMode = true;
      expect(appConfig.isDemoMode, true);

      appConfig.isDemoMode = false;
      expect(appConfig.isDemoMode, false);
    });

    testWidgets('GlobalKeys are properly initialized', (tester) async {
      expect(viewModel.scaffoldKey, isNotNull);
      expect(viewModel.keyBNHome, isNotNull);
      expect(viewModel.keyBNDemoHome, isNotNull);
      expect(viewModel.keySHPinnedPost, isNotNull);
      expect(viewModel.keySHPost, isNotNull);
      expect(viewModel.keySHOrgName, isNotNull);
      expect(viewModel.keySHMenuIcon, isNotNull);
      expect(viewModel.keyDrawerCurOrg, isNotNull);
      expect(viewModel.keyDrawerSwitchableOrg, isNotNull);
      expect(viewModel.keyDrawerJoinOrg, isNotNull);
      expect(viewModel.keyDrawerLeaveCurrentOrg, isNotNull);
      expect(viewModel.keyBNEvents, isNotNull);
      expect(viewModel.keyBNDemoEvents, isNotNull);
      expect(viewModel.keySECategoryMenu, isNotNull);
      expect(viewModel.keySEDateFilter, isNotNull);
      expect(viewModel.keySEAdd, isNotNull);
      expect(viewModel.keySECard, isNotNull);
      expect(viewModel.keyBNPost, isNotNull);
      expect(viewModel.keyBNDemoPost, isNotNull);
      expect(viewModel.keyBNChat, isNotNull);
      expect(viewModel.keyBNProfile, isNotNull);
      expect(viewModel.keyBNDemoProfile, isNotNull);
      expect(viewModel.keyBNFunds, isNotNull);
      expect(viewModel.keySPEditProfile, isNotNull);
      expect(viewModel.keySPAppSetting, isNotNull);
      expect(viewModel.keySPHelp, isNotNull);
      expect(viewModel.keySPDonateUs, isNotNull);
      expect(viewModel.keySPInvite, isNotNull);
      expect(viewModel.keySPLogout, isNotNull);
      expect(viewModel.keySPPalisadoes, isNotNull);
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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

      viewModel.context = key.currentContext!;
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
      viewModel.context = key.currentContext!;

      viewModel.tourHomeTargets(mockUserConfig);

      expect(mockAppTour.callCount, 1);
      expect(mockAppTour.capturedTargets, isNotEmpty);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 1);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourEventTargets onFinish callback navigates to next tab and starts add post tour',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.context = key.currentContext!;
      viewModel.currentPageIndex = 1;

      viewModel.tourEventTargets();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 2);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourAddPost onFinish callback navigates to next tab and starts chat tour',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.context = key.currentContext!;
      viewModel.currentPageIndex = 2; // Post tab index (assuming)

      viewModel.tourAddPost();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 3);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourChat onFinish callback navigates to next tab and starts profile tour',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.context = key.currentContext!;
      viewModel.currentPageIndex = 3;

      viewModel.tourChat();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 4);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets(
        'tourProfile onFinish callback completes tour and navigates home',
        (tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(createTestWidget(SizedBox(key: key)));
      await tester.pumpAndSettle();
      viewModel.context = key.currentContext!;
      viewModel.currentPageIndex = 4;

      viewModel.tourProfile();

      expect(mockAppTour.callCount, 1);
      final onFinish = mockAppTour.capturedOnFinish!;

      onFinish();

      expect(viewModel.tourComplete, true);
      expect(viewModel.currentPageIndex, 0);
    });
  });
}
