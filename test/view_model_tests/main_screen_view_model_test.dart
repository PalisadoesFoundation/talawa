import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testSetupLocator();
  late MainScreenViewModel viewModel;
  late UserConfig mockUserConfig;

  setUpAll(() {
    registerServices();
  });

  setUp(() {
    mockUserConfig = getAndRegisterUserConfig();
    viewModel = MainScreenViewModel();
  });

  tearDownAll(() {
    unregisterServices();
  });

  Widget createTestWidget(Widget child) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
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
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.initialise(
                ctx,
                fromSignUp: false,
                mainScreenIndex: 2,
                demoMode: false,
              );
              expect(viewModel.currentPageIndex, 2);
              expect(viewModel.showAppTour, false);
              expect(viewModel.tourComplete, true);
              expect(viewModel.tourSkipped, false);
              return Container();
            },
          ),
        ),
      );
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
      MainScreenViewModel.demoMode = false;
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.setupNavigationItems(ctx);
              expect(viewModel.navBarItems.length,
                  6); // Updated to 6 based on file content (Home, Events, Chat, Funds, Profile, Menu)
              expect(viewModel.pages.length, 6);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('setupNavigationItems sets navBarItems and pages for demo mode',
        (tester) async {
      MainScreenViewModel.demoMode = true;
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.setupNavigationItems(ctx);
              expect(viewModel.navBarItems.length, 6);
              expect(viewModel.pages.length, 6);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourHomeTargets adds correct targets (Logged Out)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(false);

      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
              viewModel.tourHomeTargets(mockUserConfig);

              expect(viewModel.targets.any((t) => t.keyName == 'keySHOrgName'),
                  true);
              expect(viewModel.targets.any((t) => t.keyName == 'keySHMenuIcon'),
                  true);
              expect(
                  viewModel.targets.any((t) => t.keyName == 'keyDrawerCurOrg'),
                  true);
              expect(
                  viewModel.targets
                      .any((t) => t.keyName == 'keyDrawerSwitchableOrg'),
                  true);
              expect(
                  viewModel.targets.any((t) => t.keyName == 'keyDrawerJoinOrg'),
                  true);

              // Should NOT have LeaveCurrentOrg if logged out
              expect(
                  viewModel.targets
                      .any((t) => t.keyName == 'keyDrawerLeaveCurrentOrg'),
                  false);

              expect(
                  viewModel.targets.any((t) => t.keyName == 'keyBNHome'), true);
              expect(
                  viewModel.targets.any((t) => t.keyName == 'keySHPinnedPost'),
                  true);
              expect(
                  viewModel.targets.any((t) => t.keyName == 'keySHPost'), true);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourHomeTargets adds correct targets (Logged In)',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);

      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
              viewModel.tourHomeTargets(mockUserConfig);

              // Should HAVE LeaveCurrentOrg if logged in
              expect(
                  viewModel.targets
                      .any((t) => t.keyName == 'keyDrawerLeaveCurrentOrg'),
                  true);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourEventTargets adds correct targets', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourAddPost adds correct targets', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
              viewModel.tourAddPost();
              expect(viewModel.targets.length, 1);
              expect(viewModel.targets.first.keyName, 'keyBNPost');
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourChat adds correct targets', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
              viewModel.tourChat();
              expect(viewModel.targets.length, 1);
              expect(viewModel.targets.first.keyName, 'keyBNChat');
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourProfile adds correct targets', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('initialise sets correct values when fromSignUp is true',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.initialise(
                ctx,
                fromSignUp: true,
                mainScreenIndex: 0,
                demoMode: false,
              );
              expect(viewModel.currentPageIndex, 0);
              expect(viewModel.showAppTour, true);
              expect(MainScreenViewModel.demoMode, false);
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('initialise sets correct values when demoMode is true',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.initialise(
                ctx,
                fromSignUp: false,
                mainScreenIndex: 1,
                demoMode: true,
              );
              expect(viewModel.currentPageIndex, 1);
              expect(viewModel.showAppTour, true);
              expect(MainScreenViewModel.demoMode, true);
              return Container();
            },
          ),
        ),
      );
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
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              final dialog = viewModel.appTourDialog(ctx);
              expect(dialog, isA<Widget>());
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('showHome handles keyDrawerLeaveCurrentOrg target',
        (tester) async {
      final mockNavigationService = getAndRegisterNavigationService();

      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
              return Container();
            },
          ),
        ),
      );

      final target = TargetFocus(
        identify: 'keyDrawerLeaveCurrentOrg',
        keyTarget: viewModel.keyDrawerLeaveCurrentOrg,
      );

      await viewModel.showHome(target);
      await tester.pump();

      verify(mockNavigationService.pop()).called(1);
    });

    testWidgets('showHome handles unrecognized target', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
              return Container();
            },
          ),
        ),
      );

      final target = TargetFocus(
        identify: 'unknownTarget',
        keyTarget: GlobalKey(),
      );

      await viewModel.showHome(target);
      await tester.pump();
    });

    test('demoMode static variable can be set', () {
      MainScreenViewModel.demoMode = true;
      expect(MainScreenViewModel.demoMode, true);

      MainScreenViewModel.demoMode = false;
      expect(MainScreenViewModel.demoMode, false);
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

    testWidgets('tourHomeTargets clears existing targets before adding new ones',
        (tester) async {
      when(mockUserConfig.loggedIn).thenReturn(true);

      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourEventTargets clears existing targets before adding new ones',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourAddPost clears existing targets before adding new ones',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourChat clears existing targets before adding new ones',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('tourProfile clears existing targets before adding new ones',
        (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
              viewModel.context = ctx;
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
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets(
        'setupNavigationItems verifies navigation items are correctly labeled',
        (tester) async {
      MainScreenViewModel.demoMode = false;
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (ctx) {
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
              return Container();
            },
          ),
        ),
      );
    });
  });
}
