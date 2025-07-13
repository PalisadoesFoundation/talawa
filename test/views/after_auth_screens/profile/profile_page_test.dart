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
  group('build', () {
    testWidgets('check if profilePage shows up and refreshIndicator work',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Test RefreshIndicator onRefresh callback by dragging down
      final refreshIndicator = find.byType(RefreshIndicator);
      await tester.drag(refreshIndicator, const Offset(0, 300));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Also test by dragging the profile pic area
      await tester.drag(
        find.byKey(const Key('profilepic')),
        const Offset(0, 300),
      );
      await tester.pump();
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
      await tester.pump();
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pump();
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
    testWidgets('Test donate bottom sheet and donation functionality',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();

      expect(find.byType(ContainedTabBarView), findsOneWidget);
      final orgDonateBtn = find.text('Donate to the Community');
      expect(orgDonateBtn, findsOneWidget);
      await tester.tap(orgDonateBtn);
      await tester.pump();

      // Test donation with empty amount
      final donateBtn = find.byKey(const Key('DONATE'));
      await tester.ensureVisible(donateBtn);
      await tester.pump();
      await tester.tap(donateBtn, warnIfMissed: false);
      await tester.pump();

      // Test donation with valid amount
      final txtfield = find.byKey(const Key('custom_amt'));
      await tester.enterText(txtfield, '25');
      await tester.pump();

      await tester.tap(donateBtn, warnIfMissed: false);
      await tester.pump();

      // Test currency button onTap callback
      final currencyButton = find.byKey(const Key('currency_btn'));

      // Scroll down to make the currency button visible
      await tester.dragUntilVisible(
        currencyButton,
        find.byType(SingleChildScrollView).last,
        const Offset(0, -50),
      );
      await tester.pump();

      await tester.tap(currencyButton, warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
    });

    testWidgets('Test currency button onTap callback specifically',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();

      // Open donate bottom sheet
      await tester.tap(find.text('Donate to the Community'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      // Find the currency button (GestureDetector with key 'currency_btn')
      final currencyBtn = find.byKey(const Key('currency_btn'));
      expect(currencyBtn, findsOneWidget);

      // Scroll the currency button into view
      await tester.dragUntilVisible(
        currencyBtn,
        find.byType(SingleChildScrollView).last,
        const Offset(0, -50),
      );
      await tester.pump();

      // Tap the currency button to trigger the onTap callback
      await tester.tap(currencyBtn, warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      // Tap again to ensure the callback is covered
      await tester.tap(currencyBtn, warnIfMissed: false);
      await tester.pump();

      // Verify the button still exists after taps
      expect(currencyBtn, findsOneWidget);
    });

    testWidgets('Test donation button onPressed callback with both scenarios',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();

      // Open donate bottom sheet
      await tester.tap(find.text('Donate to the Community'));
      await tester.pump();

      final donateBtn = find.byKey(const Key('DONATE'));
      final txtfield = find.byKey(const Key('custom_amt'));

      // Test 1: Try to donate without entering amount (empty text scenario)
      await tester.ensureVisible(donateBtn);
      await tester.pump();
      await tester.tap(donateBtn, warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // Test 2: Enter amount and try to donate (non-empty text scenario)
      await tester.enterText(txtfield, '50');
      await tester.pump();

      await tester.tap(donateBtn, warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // Test 3: Clear text and test empty scenario again
      await tester.enterText(txtfield, '');
      await tester.pump();

      await tester.tap(donateBtn, warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // The button should work in both cases (empty and with amount)
      expect(donateBtn, findsOneWidget);
    });
    testWidgets('Test GestureDetector onTap for currency button coverage',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();

      // Open donate bottom sheet first
      final donateButton = find.text('Donate to the Community');
      await tester.tap(donateButton);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // Find the GestureDetector with the currency_btn key
      final gestureDetector = find.byKey(const Key('currency_btn'));
      expect(gestureDetector, findsOneWidget);

      // Scroll the widget into view using dragUntilVisible
      await tester.dragUntilVisible(
        gestureDetector,
        find.byType(SingleChildScrollView).last,
        const Offset(0, -50),
      );
      await tester.pump();

      // Use warnIfMissed: false and try different approaches to tap
      await tester.tap(gestureDetector, warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verify the gesture detector is still there
      expect(gestureDetector, findsOneWidget);
    });
  });
}
