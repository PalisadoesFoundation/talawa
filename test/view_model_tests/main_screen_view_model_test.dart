import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';

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
  });
}
