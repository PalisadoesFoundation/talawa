import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createProfilePage({required MainScreenViewModel mainScreenViewModel}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          body: ProfilePage(
            key: const Key('Profile Page'),
            homeModel: mainScreenViewModel,
          ),
        ),
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.generateRoute,
        theme: TalawaTheme.darkTheme,
      );
    },
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<SizeConfig>().test();
    registerServices();
    getAndRegisterAppTheme();
  });

  setUp(() {
    // Reset any mocks between tests
    when(navigationService.navigatorKey)
        .thenReturn(GlobalKey<NavigatorState>());
    // Reset MainScreenViewModel for each test
    if (locator.isRegistered<MainScreenViewModel>()) {
      locator.unregister<MainScreenViewModel>();
    }
    locator.registerSingleton<MainScreenViewModel>(MainScreenViewModel());
  });

  tearDown(() {
    // Clean up MainScreenViewModel
    if (locator.isRegistered<MainScreenViewModel>()) {
      locator.unregister<MainScreenViewModel>();
    }
  });
  group('build', () {
    testWidgets('check if profilePage shows up and refreshIndicator work',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      // Wait for initial frame
      await tester.pump();
      // Verify the RefreshIndicator is present
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Perform the drag operation
      await tester.drag(
        find.byKey(const Key('profilepic')),
        const Offset(0, 300),
      );
      // Wait for drag animation
      await tester.pump();
      // Wait for refresh indicator animation
      await tester.pump(const Duration(milliseconds: 300));
      // Allow refresh to complete
      await tester.pump(const Duration(seconds: 1));
    });
    testWidgets('check if invitebutton work', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();
      await tester.tap(find.byKey(const Key('inviteicon')));
      await tester.pump();
    });
    testWidgets('check if left drawer works', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      // Wait for initial frame
      await tester.pump();

      // Verify menu icon is present
      final menuIcon = find.byIcon(Icons.menu);
      expect(menuIcon, findsOneWidget);

      // Tap menu icon
      await tester.tap(menuIcon);
      // Wait for drawer animation to start
      await tester.pump();
      // Wait for drawer animation to complete (typical drawer animation is 300ms)
      await tester.pump(const Duration(milliseconds: 300));
    });
    testWidgets('check if Donate button work', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();
      await tester.tap(find.text('Donate to the Community'));
      await tester.pump();
    });

    testWidgets('check if settings page is opening up', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();
      final settingsIcon = find.byKey(const Key('settingIcon'));
      await tester.tap(settingsIcon);
      verify(navigationService.navigatorKey);
    });
    testWidgets('check if User Feed is present', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();

      expect(find.byType(ContainedTabBarView), findsOneWidget);
      expect(find.byKey(const Key("UserFeed")), findsOneWidget);
    });
    testWidgets('check if User Event is present', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();

      expect(find.byType(ContainedTabBarView), findsOneWidget);
      await tester.tap(find.text('Events'));
      await tester.pump();
    });
    testWidgets('Test donate bottom sheet', (tester) async {
      // Pump the widget
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      // Wait for initial frame
      await tester.pump();

      // Verify initial state
      expect(find.byType(ContainedTabBarView), findsOneWidget);
      final orgDonateBtn = find.text('Donate to the Community');
      expect(orgDonateBtn, findsOneWidget);

      // Open donate sheet
      await tester.tap(orgDonateBtn);
      // Wait for bottom sheet to start showing
      await tester.pump();
      // Wait for bottom sheet animation
      await tester.pump(const Duration(milliseconds: 200));

      // Enter donation amount
      final txtfield = find.byKey(const Key('custom_amt'));
      expect(txtfield, findsOneWidget);
      await tester.enterText(txtfield, '25');
      // Wait for text entry
      await tester.pump();

      // Find and tap donate button
      final donateBtn = find.byKey(const Key('DONATE'));
      expect(donateBtn, findsOneWidget);
      await tester.tap(donateBtn);
      // Wait for any donate action
      await tester.pump(const Duration(milliseconds: 100));

      // Test currency button
      final currencyBtn = find.byKey(const Key('currency_btn'));
      expect(currencyBtn, findsOneWidget);
      await tester.tap(currencyBtn);
      // Wait for currency dialog to appear
      await tester.pump();
      // Wait for dialog animation
      await tester.pump(const Duration(milliseconds: 200));
      // Dismiss dialog to clean up
      await tester.tapAt(const Offset(20, 20)); // Tap outside to dismiss
      await tester.pump(const Duration(milliseconds: 200));
    });
  });
}
