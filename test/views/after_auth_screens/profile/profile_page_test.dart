import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
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
        )),
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
      await Hive.openBox('pluginBox');
      // locator.unregister<ProfilePageViewModel>();
      // locator.registerFactory<ProfilePageViewModel>(() => ProfilePageViewModel());
    });
    testWidgets('check if profilePage shows up', (tester) async {
      // print();
      await tester.pumpWidget(createProfilePage(
          mainScreenViewModel: locator<MainScreenViewModel>()));
      await tester.pumpAndSettle();
    });
  });
}
