// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/router.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/base_view.dart';

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
      ),
    ),
  );
}

// late OrganizationFeedViewModel _organizationFeedViewModel;

Widget createOrganizationFeedScreen2({
  bool isPublic = true,
  bool viewOnMap = true,
  required MainScreenViewModel homeModel,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    // builder: (context, langModel, child) {
    //   return BaseView<OrganizationFeedViewModel>(
    //     onModelReady: (model) {
    //       model.initialise();
    //       _organizationFeedViewModel = model;
    //     },
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
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
            forTest: true,
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
      );
    },
    //   );
    // },
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });

  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('check if createOrganizationFeedScreen shows up', (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final finder = find.byType(Scaffold);

    expect(finder, findsNWidgets(2));
  });
  testWidgets('check if orgname is displayed shows up', (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final finder = find.byType(Text);
    expect(finder, findsNWidgets(4));
    // expect(text, findsOneWidget);
  });
  testWidgets('check if pinned post is displayed shows up', (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final finder = find.byType(Text);

    final text1 = find.text('Rutvik Chandla');

    final text2 = find.text(
      'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS...',
    );

    final text3 = find.text('See all Pinned news');

    expect(text1, findsOneWidget);

    expect(text2, findsOneWidget);

    expect(text3, findsOneWidget);

    expect(finder, findsNWidgets(4));
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
  testWidgets('check if refresh indicator is launched on dragging',
      (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();
    final postservice = locator<PostService>();
    bool refreshed = false;

    when(postservice.getPosts()).thenAnswer((_) async {
      refreshed = true;
    });

    await tester.drag(
      find.byType(RefreshIndicator),
      const Offset(0, 200),
    );
    await tester.pumpAndSettle();

    expect(refreshed, true);
  });
  testWidgets(
      'check if post shows up when  model.posts.isNotEmpty is true and post',
      (tester) async {
    final model = locator<MainScreenViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
