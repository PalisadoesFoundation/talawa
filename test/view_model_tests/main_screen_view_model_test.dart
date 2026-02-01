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

import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MainScreenMockNavigationService extends Mock
    implements NavigationService {
  int pushDialogCallCount = 0;
  int popCallCount = 0;
  int removeAllAndPushCallCount = 0;

  Widget? lastDialogPushed;

  @override
  void pushDialog(Widget? dialog) {
    pushDialogCallCount++;
    lastDialogPushed = dialog;
  }

  @override
  void pop() {
    popCallCount++;
  }

  @override
  Future<dynamic> removeAllAndPush(
    String? routeName,
    String? tillRoute, {
    dynamic arguments,
  }) {
    removeAllAndPushCallCount++;
    return Future.value(null);
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      super.noSuchMethod(Invocation.getter(#navigatorKey),
              returnValue: GlobalKey<NavigatorState>(),
              returnValueForMissingStub: GlobalKey<NavigatorState>())
          as GlobalKey<NavigatorState>;

  @override
  void showTalawaErrorSnackBar(
    String? errorMessage,
    dynamic messageType,
  ) {}
}

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
  late MainScreenMockNavigationService mockNavigationService;

  setUpAll(() {
    testSetupLocator();
    registerServices();
    SizeConfig().test();
  });

  setUp(() {
    if (locator.isRegistered<NavigationService>()) {
      locator.unregister<NavigationService>();
    }

    mockNavigationService = MainScreenMockNavigationService();
    final key = GlobalKey<NavigatorState>();
    when(mockNavigationService.navigatorKey).thenReturn(key);

    locator.registerSingleton<NavigationService>(mockNavigationService);

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
      navigatorKey: mockNavigationService.navigatorKey,
    );
  }

  group('MainScreenViewModel', () {
    testWidgets(
        'initialise sets correct values when not fromSignUp and not demoMode',
        (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.initialise(
        tester.elementList(find.byType(SizedBox)).first,
        fromSignUp: false,
        mainScreenIndex: 2,
        demoMode: false,
      );
      expect(viewModel.currentPageIndex, 2);
      expect(viewModel.showAppTour, false);
      expect(viewModel.tourComplete, true);
      expect(viewModel.tourSkipped, false);
    });

    testWidgets('initialise sets correct values when demoMode is true',
        (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.initialise(
        tester.elementList(find.byType(SizedBox)).first,
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

    testWidgets('initialise shows dialog after delay when showAppTour is true',
        (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.initialise(
        tester.elementList(find.byType(SizedBox)).first,
        fromSignUp: true,
        mainScreenIndex: 0,
        demoMode: false,
      );
      expect(viewModel.showAppTour, true);

      expect(mockNavigationService.pushDialogCallCount, 0);

      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(mockNavigationService.pushDialogCallCount, 1);
      expect(mockNavigationService.lastDialogPushed, isA<Widget>());
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
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.setupNavigationItems(
          tester.elementList(find.byType(SizedBox)).first);
      expect(viewModel.navBarItems.length, 6);
      expect(viewModel.pages.length, 6);
      expect(
          viewModel.navBarItems[0].label,
          AppLocalizations.of(tester.elementList(find.byType(SizedBox)).first)!
              .strictTranslate('Home'));
    });

    testWidgets('setupNavigationItems sets navBarItems and pages for demo mode',
        (tester) async {
      appConfig.isDemoMode = true;
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.setupNavigationItems(
          tester.elementList(find.byType(SizedBox)).first);
      expect(viewModel.navBarItems.length, 6);
      expect(viewModel.pages.length, 6);
    });

    test('exitDemoMode sets isDemoMode to false and navigates', () {
      appConfig.isDemoMode = true;
      viewModel.exitDemoMode();
      expect(appConfig.isDemoMode, false);

      expect(mockNavigationService.removeAllAndPushCallCount, 1);
    });

    testWidgets('appTourDialog returns correct dialog and handles actions',
        (tester) async {
      await tester.pumpWidget(createTestWidget(
        Scaffold(
          key: viewModel.scaffoldKey,
          drawer: const Drawer(),
          body: const SizedBox(),
        ),
      ));
      await tester.pumpAndSettle();

      final dialogWidget = viewModel
          .appTourDialog(tester.elementList(find.byType(SizedBox)).first);
      final dialog = dialogWidget as CustomAlertDialog;

      dialog.secondaryButtonTap!();
      expect(viewModel.tourComplete, false);
      expect(viewModel.tourSkipped, true);
      expect(mockNavigationService.popCallCount, 1);

      mockNavigationService.popCallCount = 0;

      viewModel.scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();
      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, true);

      dialog.success!();
      expect(mockNavigationService.popCallCount, 1);

      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 500));

      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, false);
      expect(viewModel.targets.isNotEmpty, true);
    });

    testWidgets('tourHomeTargets adds correct targets (Logged Out)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;


      viewModel.tourHomeTargets(mockUserConfig);

      expect(viewModel.targets.any((t) => t.keyName == 'keySHOrgName'), true);
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerLeaveCurrentOrg'),
          false);
      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerJoinOrg'), true);
    });

    testWidgets('tourHomeTargets adds correct targets (Logged In)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;


      viewModel.tourHomeTargets(mockUserConfig);

      expect(
          viewModel.targets.any((t) => t.keyName == 'keyDrawerLeaveCurrentOrg'),
          true);
    });

      viewModel.tourHomeTargets(mockUserConfig);
      final target =
          viewModel.targets.firstWhere((t) => t.keyName == 'keyDrawerJoinOrg');

      mockNavigationService.popCallCount = 0;
      viewModel.tourHomeTargets(mockUserConfig);
      final target =
          viewModel.targets.firstWhere((t) => t.keyName == 'keyDrawerJoinOrg');


    });

    testWidgets('showHome handles keySHMenuIcon (opens drawer)',
        (tester) async {
      await tester.pumpWidget(createTestWidget(
        Scaffold(
          key: viewModel.scaffoldKey,
          drawer: const Drawer(),
          body: const SizedBox(),
        ),
      ));
      await tester.pumpAndSettle();
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      final target = TargetFocus(
        identify: 'keySHMenuIcon',
        keyTarget: viewModel.keySHMenuIcon,
      );

      await viewModel.showHome(target);
      await tester.pumpAndSettle();
      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, true);
    });

    testWidgets('showHome handles keyDrawerLeaveCurrentOrg (pops)',
        (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      final target = TargetFocus(
        identify: 'keyDrawerLeaveCurrentOrg',
        keyTarget: viewModel.keyDrawerLeaveCurrentOrg,
      );

    });

    testWidgets('showHome handles keyBNHome (closes drawer)', (tester) async {
      await tester.pumpWidget(createTestWidget(
        Scaffold(
          key: viewModel.scaffoldKey,
          drawer: const Drawer(),
          body: const SizedBox(),
        ),
      ));
      await tester.pumpAndSettle();
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      viewModel.scaffoldKey.currentState!.openDrawer();
      // Pump frames for drawer opening animation
      await tester.pump(const Duration(milliseconds: 1000));
      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, true);

      final target = TargetFocus(
        identify: 'keyBNHome',
        keyTarget: viewModel.keyBNHome,
      );

      await future;

      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, false);
    });

      final target = TargetFocus(
        identify: 'unknown',
        keyTarget: GlobalKey(),
      );

      await viewModel.showHome(target);
    });



      viewModel.tourEventTargets();

      expect(viewModel.targets.any((t) => t.keyName == 'keyBNEvents'), true);

      final onFinish = mockAppTour.capturedOnFinish!;
      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 2);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets('tourAddPost flow', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.currentPageIndex = 2;

      mockAppTour.capturedOnClickTarget!(TargetFocus(keyTarget: GlobalKey()));


    });

    testWidgets('tourChat flow', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.currentPageIndex = 3;


      viewModel.tourChat();


      final onFinish = mockAppTour.capturedOnFinish!;
      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 4);
      expect(mockAppTour.callCount, 1);
    });


      viewModel.tourProfile();

      mockAppTour.capturedOnClickTarget!(TargetFocus(keyTarget: GlobalKey()));

      final onFinish = mockAppTour.capturedOnFinish!;

      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      expect(viewModel.tourComplete, true);
      expect(viewModel.currentPageIndex, 0);
    });


      // Force logic verification
      expect(viewModel.tourComplete, false);
      expect(viewModel.tourSkipped, true);

      viewModel.tourEventTargets();
      mockAppTour.capturedOnFinish!();
      expect(mockAppTour.callCount, 1);

      mockAppTour.clear();

      // Should NOT change tourComplete to true because tourSkipped is true
      expect(viewModel.tourComplete, false);
    });

    testWidgets('default appTour is initialized correctly', (tester) async {
      final vm = MainScreenViewModel();
      expect(vm.appTour, isA<AppTour>());
    });

    testWidgets('tourHomeTargets keySHMenuIcon next callback opens drawer',
        (tester) async {
      await tester.pumpWidget(createTestWidget(
        Scaffold(
          key: viewModel.scaffoldKey,
          drawer: const Drawer(),
          body: const SizedBox(),
        ),
      ));
      await tester.pumpAndSettle();

      viewModel.tourHomeTargets(mockUserConfig);
      final target =
          viewModel.targets.firstWhere((t) => t.keyName == 'keySHMenuIcon');

    });

    testWidgets(
        'tourHomeTargets keyDrawerLeaveCurrentOrg next callback pops navigation',
        (tester) async {


      mockNavigationService.popCallCount = 0;
      viewModel.tourHomeTargets(mockUserConfig);
      final target = viewModel.targets
          .firstWhere((t) => t.keyName == 'keyDrawerLeaveCurrentOrg');

      target.next!();

    });

    testWidgets(
        'tourHomeTargets onFinish flow increments index and calls tourEventTargets',
        (tester) async {

      // Ensure mockAppTour captures the arguments
      viewModel.tourHomeTargets(mockUserConfig);

      // Verify showTutorial was called
      expect(mockAppTour.capturedOnFinish, isNotNull);
      final onFinish = mockAppTour.capturedOnFinish!;

      // Reset mock to track subsequent calls
      mockAppTour.clear();

      // Execute the onFinish callback
      onFinish();
      await tester.pump(const Duration(milliseconds: 100));

      // Verify effects
      expect(viewModel.currentPageIndex, 1);
      // Should call tourEventTargets which calls showTutorial again
      expect(mockAppTour.callCount, 1);
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
