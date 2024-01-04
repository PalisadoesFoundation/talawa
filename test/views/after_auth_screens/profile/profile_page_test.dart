import 'dart:io';

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
  final Directory dir = Directory('test/fixtures/core');
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
      final pbox = await Hive.openBox('pluginBox');
      print(pbox.get('plugins'));
    });

    tearDownAll(() {
      File('test/fixtures/core/currentorg.hive').delete();
      File('test/fixtures/core/currentorg.lock').delete();
      File('test/fixtures/core/currentuser.hive').delete();
      File('test/fixtures/core/currentuser.lock').delete();
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
      await tester.pumpAndSettle();
    });
    testWidgets('check if invitebutton work', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('inviteicon')));
      await tester.pumpAndSettle();
    });
    testWidgets('check if Donate button work', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Donate to the Community'));
      await tester.pumpAndSettle();
    });
    testWidgets('check if naviagte to task screen work', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tasks'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('tastscrn')));
      await tester.pumpAndSettle();
    });
    testWidgets('check if Invite customListTile work', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Invite'));
      await tester.tap(find.text('Invite'));
      await tester.pumpAndSettle();
    });
    testWidgets('check if settings page is opening up', (tester) async {
      await tester.pumpWidget(
        createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>(),
        ),
      );
      await tester.pumpAndSettle();
      final settingsIcon = find.byKey(const Key('settingIcon'));
      await tester.tap(settingsIcon);
      verify(navigationService.navigatorKey);
    });
  });
}
