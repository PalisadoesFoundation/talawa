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
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MainScreenMockNavigationService extends Mock implements NavigationService {
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
          returnValueForMissingStub: GlobalKey<NavigatorState>()) as GlobalKey<NavigatorState>;
          
  @override
  void showTalawaErrorSnackBar(
    String? errorMessage,
    dynamic messageType,
  ) {
  }
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
      viewModel.addListener(() => notified = true);

      viewModel.currentPageIndex = 0;
      viewModel.onTabTapped(3);

      expect(viewModel.currentPageIndex, 3);
      expect(notified, true);
    });

     testWidgets('setupNavigationItems sets navBarItems and pages for normal mode',
        (tester) async {
      appConfig.isDemoMode = false;
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.setupNavigationItems(tester.elementList(find.byType(SizedBox)).first);
      expect(viewModel.navBarItems.length, 6);
      expect(viewModel.pages.length, 6);
      expect(viewModel.navBarItems[0].label,
          AppLocalizations.of(tester.elementList(find.byType(SizedBox)).first)!.strictTranslate('Home'));
    });

    testWidgets('setupNavigationItems sets navBarItems and pages for demo mode',
        (tester) async {
      appConfig.isDemoMode = true;
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      await tester.pumpAndSettle();

      viewModel.setupNavigationItems(tester.elementList(find.byType(SizedBox)).first);
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
      
      final dialogWidget = viewModel.appTourDialog(tester.elementList(find.byType(SizedBox)).first);
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

    testWidgets('tourHomeTargets keyDrawerJoinOrg next callback (Logged Out)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      viewModel.tourHomeTargets(mockUserConfig);
      final target = viewModel.targets
          .firstWhere((t) => t.keyName == 'keyDrawerJoinOrg');

      mockNavigationService.popCallCount = 0;
      target.next!();
      expect(mockNavigationService.popCallCount, 1);
    });

    testWidgets('tourHomeTargets keyDrawerJoinOrg next callback (Logged In)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      mockNavigationService.popCallCount = 0;
      viewModel.tourHomeTargets(mockUserConfig);
      final target = viewModel.targets
          .firstWhere((t) => t.keyName == 'keyDrawerJoinOrg');

      target.next!();
      expect(mockNavigationService.popCallCount, 0);
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

      mockNavigationService.popCallCount = 0;
      await viewModel.showHome(target);
      expect(mockNavigationService.popCallCount, 1);
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

      // Don't await showHome immediately because it contains a Future.delayed
      // which requires the tester.pump to advance the fake async clock.
      final future = viewModel.showHome(target);
      
      // Pump frames which covers the 300ms delay and animation
      await tester.pump(const Duration(milliseconds: 1000));
      
      await future;
      
      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, false);
    });

    testWidgets('showHome handles unknown target', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      final target = TargetFocus(
        identify: 'unknown',
        keyTarget: GlobalKey(),
      );

      await viewModel.showHome(target);
    });
    
    testWidgets('tourEventTargets flow', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.currentPageIndex = 1;

      viewModel.tourEventTargets();

      expect(viewModel.targets.any((t) => t.keyName == 'keyBNEvents'), true);
      
      expect(mockAppTour.capturedOnClickTarget, isNotNull);
      mockAppTour.capturedOnClickTarget!(TargetFocus(keyTarget: GlobalKey()));

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

      viewModel.tourAddPost();
      
      mockAppTour.capturedOnClickTarget!(TargetFocus(keyTarget: GlobalKey()));

      final onFinish = mockAppTour.capturedOnFinish!;
      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 3);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets('tourChat flow', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.currentPageIndex = 3;

      viewModel.tourChat();

      mockAppTour.capturedOnClickTarget!(TargetFocus(keyTarget: GlobalKey()));

      final onFinish = mockAppTour.capturedOnFinish!;
      mockAppTour.clear();
      onFinish();

      expect(viewModel.currentPageIndex, 4);
      expect(mockAppTour.callCount, 1);
    });

    testWidgets('tourProfile flow', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.currentPageIndex = 4;

      viewModel.tourProfile();
      
      mockAppTour.capturedOnClickTarget!(TargetFocus(keyTarget: GlobalKey()));

      final onFinish = mockAppTour.capturedOnFinish!;
      
      onFinish();

      expect(viewModel.tourComplete, true);
      expect(viewModel.currentPageIndex, 0);
    });
    
    testWidgets('onFinish skipped logic', (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.tourSkipped = true;
      viewModel.tourComplete = false;

      // Force logic verification
      expect(viewModel.tourComplete, false);
      expect(viewModel.tourSkipped, true);
      
      viewModel.tourEventTargets();
      mockAppTour.capturedOnFinish!();
      expect(mockAppTour.callCount, 1);
      
      mockAppTour.clear();
      viewModel.tourProfile();
      mockAppTour.capturedOnFinish!();
      
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
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      viewModel.tourHomeTargets(mockUserConfig);
      final target =
          viewModel.targets.firstWhere((t) => t.keyName == 'keySHMenuIcon');

      target.next!();
      await tester.pumpAndSettle();

      expect(viewModel.scaffoldKey.currentState!.isDrawerOpen, true);
    });

    testWidgets(
        'tourHomeTargets keyDrawerLeaveCurrentOrg next callback pops navigation',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;

      mockNavigationService.popCallCount = 0;
      viewModel.tourHomeTargets(mockUserConfig);
      final target = viewModel.targets
          .firstWhere((t) => t.keyName == 'keyDrawerLeaveCurrentOrg');

      target.next!();

      expect(mockNavigationService.popCallCount, 1);
    });

    testWidgets(
        'tourHomeTargets onFinish flow increments index and calls tourEventTargets',
        (tester) async {
      await tester.pumpWidget(createTestWidget(const SizedBox()));
      viewModel.context = tester.elementList(find.byType(SizedBox)).first;
      viewModel.currentPageIndex = 0;
      viewModel.tourComplete = false;
      viewModel.tourSkipped = false;

      // Ensure mockAppTour captures the arguments
      viewModel.tourHomeTargets(mockUserConfig);

      // Verify showTutorial was called
      expect(mockAppTour.capturedOnFinish, isNotNull);
      final onFinish = mockAppTour.capturedOnFinish!;

      // Reset mock to track subsequent calls
      mockAppTour.clear();

      // Execute the onFinish callback
      onFinish();

      // Verify effects
      expect(viewModel.currentPageIndex, 1);
      // Should call tourEventTargets which calls showTutorial again
      expect(mockAppTour.callCount, 1);
    });
  });
}
