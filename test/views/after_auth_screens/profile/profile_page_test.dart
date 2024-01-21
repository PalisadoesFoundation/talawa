import 'dart:io';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
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

void main() async {
  testSetupLocator();
  locator<SizeConfig>().test();
  final Directory dir = Directory('test/fixtures/coree');
  group('build', () {
    setUpAll(() async {
      registerServices();
      getAndRegisterAppTheme();
      Hive
        ..init(dir.path)
        ..registerAdapter(UserAdapter())
        ..registerAdapter(OrgInfoAdapter());
      await Hive.openBox<User>('currentUser');
      await Hive.openBox<OrgInfo>('currentOrg');
      await Hive.openBox('pluginBox');
    });

    tearDownAll(() async {
      await Hive.close();
      Future<void> safeDelete(String filePath) async {
        final file = File(filePath);
        if (await file.exists()) {
          try {
            await file.delete();
          } catch (e) {
            print('Error deleting $filePath: $e');
          }
        }
      }

      await safeDelete('test/fixtures/coree/currentorg.hive');
      await safeDelete('test/fixtures/coree/currentorg.lock');
      await safeDelete('test/fixtures/coree/currentuser.hive');
      await safeDelete('test/fixtures/coree/currentuser.lock');
      await safeDelete('test/fixtures/coree/pluginbox.hive');
    });
    testWidgets('check if profilePage shows up and refreshIndicator work',
        (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pump();
      expect(find.byType(RefreshIndicator), findsOneWidget);
      await tester.drag(
        find.byKey(const Key('profilepic')),
        const Offset(0, 300),
      );
      await tester.pump();
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
  });
}
