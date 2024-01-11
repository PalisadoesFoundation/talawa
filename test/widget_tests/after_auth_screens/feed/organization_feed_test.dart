// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/router.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_list_widget.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';
import '../../../helpers/test_helpers.mocks.dart';

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

final post = Post(
  sId: "test_post_id",
  creator: userConfig.currentUser,
  likedBy: [],
  description: 'Testing',
  comments: [Comments(sId: 'cmmnt1')],
  createdAt: DateTime.now(),
  organization: userConfig.currentOrg,
);

void main() {
  SizeConfig().test();
  testSetupLocator();
  late MockOrganizationFeedViewModel mockViewModel;

  setUp(() {
    registerServices();
    mockViewModel = MockOrganizationFeedViewModel();
    locator.unregister<OrganizationFeedViewModel>();
    locator.registerSingleton<OrganizationFeedViewModel>(mockViewModel);
  });
  tearDown(() {
    unregisterServices();
  });

  TestWidgetsFlutterBinding.ensureInitialized();
  group('tests for Organizaiton feed Screen', () {
    testWidgets('check if orgname is displayed shows up', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      final finder = find.text('testOrg');
      expect(finder, findsOneWidget);
    });
    testWidgets('check if side drawer shows up', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      final finder = find.byIcon(Icons.menu);

      await tester.tap(finder);
      await tester.pump();
    });
    testWidgets('check if Circular Indicator shows up when fetching posts',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsOneWidget);
    });

    testWidgets('check if refresh Indicator works fine', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.posts).thenReturn([post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);
      final model = locator<MainScreenViewModel>();

      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      bool refreshed = false;
      when(mockViewModel.fetchNewPosts()).thenAnswer((_) async {
        refreshed = true;
      });
      await tester.drag(
        find.byType(RefreshIndicator),
        const Offset(0, 400),
      );
      await tester.pumpAndSettle();

      expect(refreshed, true);
    });

    testWidgets('check if pinned posts shows up if not empty', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.posts).thenReturn([post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.byKey(const Key('pinnedPosts'));
      expect(finder, findsOneWidget);
    });
    testWidgets('check if posts shows up if not empty', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.posts).thenReturn([post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.byType(PostListWidget);
      expect(finder, findsOneWidget);
    });
    testWidgets('check if no posts shows up then No posts text is there',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.text('There are no posts in this organisation');
      expect(finder, findsOneWidget);
    });
    testWidgets(
        'check if no posts shows up then create post textButton is present',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.text('Create your first post');
      expect(finder, findsOneWidget);
    });
  });
}
