import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createOrganizationFeedScreen({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
  required MainScreenViewModel homeModel,
}) {
  return MaterialApp(
      navigatorObservers: [],
      locale: const Locale('en'),
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
        const Locale('fr', 'FR'),
        const Locale('hi', 'IN'),
        const Locale('zh', 'CN'),
        const Locale('de', 'DE'),
        const Locale('ja', 'JP'),
        const Locale('pt', 'PT'),
      ],
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          body: OrganizationFeed(
            homeModel: homeModel,
            key: const Key('test_key'),
          )));
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });

  testWidgets('check if createOrganizationFeedScreen shows up', (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final finder = find.byType(Scaffold);

    expect(finder, findsNWidgets(2));
  });
  testWidgets('check if side drawer shows up', (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final finder = find.byIcon(Icons.menu);

    await tester.tap(finder);
    await tester.pump();
  });
  testWidgets('check if post shows up when  model.posts.isNotEmpty is true',
      (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final finder = find.byIcon(Icons.menu);

    await tester.tap(finder);
    await tester.pump();
  });
}
