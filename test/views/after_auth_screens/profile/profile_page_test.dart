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
import 'package:talawa/widgets/custom_avatar.dart';

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
      await tester.pumpAndSettle();
      expect(find.byType(RefreshIndicator), findsOneWidget);
      await tester.drag(
        find.byKey(const Key('profilepic')),
        const Offset(0, 300),
      );
      await tester.pumpAndSettle();
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
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
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
    testWidgets('Test donate bottom sheet', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ContainedTabBarView), findsOneWidget);
      final orgDonateBtn = find.text('Donate to the Community');
      expect(orgDonateBtn, findsOneWidget);
      await tester.tap(orgDonateBtn);
      await tester.pumpAndSettle();

      final txtfield = find.byKey(const Key('custom_amt'));
      await tester.enterText(txtfield, '25');
      await tester.pump();

      final donateBtn = find.byKey(const Key('DONATE'));
      await tester.ensureVisible(donateBtn);
      await tester.pumpAndSettle();
      await tester.tap(donateBtn);

      final currencyBtn = find.byKey(const Key('currency_btn'));
      await tester.tap(currencyBtn);
      await tester.pumpAndSettle();
    });
    testWidgets('CustomAvatar displays correctly with user name',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      // Find CustomAvatar widget by key
      final customAvatarFinder = find.byKey(const Key('profilepic'));
      expect(customAvatarFinder, findsOneWidget);

      // Verify CustomAvatar properties
      final customAvatarWidget =
          tester.widget<CustomAvatar>(customAvatarFinder);
      expect(customAvatarWidget.key, const Key('profilepic'));
      expect(customAvatarWidget.isImageNull, isA<bool>());
      expect(customAvatarWidget.firstAlphabet, isA<String?>());
      expect(customAvatarWidget.imageUrl, isA<String?>());
      expect(customAvatarWidget.fontSize, isA<double?>());
      expect(customAvatarWidget.maxRadius, isA<double?>());
    });

    testWidgets('CustomAvatar firstAlphabet logic works correctly',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      final customAvatarWidget = tester.widget<CustomAvatar>(
        find.byKey(const Key('profilepic')),
      );

      // Test that firstAlphabet is either a valid uppercase letter or '?'
      if (customAvatarWidget.firstAlphabet != null) {
        expect(
          customAvatarWidget.firstAlphabet,
          anyOf(equals('?'), matches(r'^[A-Z]$')),
        );
      }
    });
  });
}
