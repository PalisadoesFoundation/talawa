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
import '../../../helpers/test_helpers.mocks.dart';
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
      key: homeModel.scaffoldKey,
      drawer: Drawer(child: Text('Drawer')), // Added drawer for test
      body: OrganizationFeed(
        homeModel: homeModel,
        key: const Key('test_key'),
      ),
    ),
  );
}

// late OrganizationFeedViewModel _organizationFeedViewModel;

Widget createOrganizationFeedScreen2({
  bool viewOnMap = true,
  required MainScreenViewModel homeModel,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    // ...existing code...
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
          key: homeModel.scaffoldKey,
          body: OrganizationFeed(
            homeModel: homeModel,
            key: const Key('test_key'),
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
      );
    },
    // ...existing code...
  );
}

final post = Post(
  id: "test_post_id",
  creator: userConfig.currentUser,
  caption: 'Testing',
  createdAt: DateTime.now(),
  organization: userConfig.currentOrg,
  attachments: [],
);

void main() {
  late MockOrganizationFeedViewModel mockViewModel;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
    mockViewModel = MockOrganizationFeedViewModel();
    locator.unregister<OrganizationFeedViewModel>();
    locator.registerSingleton<OrganizationFeedViewModel>(mockViewModel);
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('tests for Organization feed Screen', () {
    testWidgets('check if orgname is displayed shows up', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.userPosts).thenReturn([]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      final finder = find.text('testOrg');
      expect(finder, findsOneWidget);
    });
    testWidgets('check if side drawer shows up', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false); // Ensure not fetching
      when(mockViewModel.isBusy).thenReturn(false); // Ensure not busy
      when(mockViewModel.posts).thenReturn([]); // No posts
      when(mockViewModel.pinnedPosts).thenReturn([]); // No pinned posts
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.userPosts).thenReturn([]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      final finder = find.byIcon(Icons.menu);
      await tester.tap(finder);
      await tester.pump();
      // Assert that the Drawer widget is present after tapping menu
      expect(find.byType(Drawer), findsOneWidget);
    });
    testWidgets('check if Circular Indicator shows up when fetching posts',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.userPosts).thenReturn([]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsOneWidget);
    });
    testWidgets("check if the refresh indicator works fine", (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.posts)
          .thenReturn([post, post, post, post, post, post]);
      when(mockViewModel.pinnedPosts).thenReturn([]);
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
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
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
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
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
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.text('There are no posts in this organization');
      expect(finder, findsOneWidget);
    });
    testWidgets(
        'check if no posts shows up then create post textButton is present',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.text('Create your first post');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
    });
    testWidgets(
        'check if nextPage function is called when scrolled to the bottom edge',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.posts)
          .thenReturn([post, post, post, post, post, post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);
      bool nextPageCalled = false;
      when(mockViewModel.nextPage()).thenAnswer((_) async {
        nextPageCalled = true;
      });

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pumpAndSettle();

      await tester.drag(
        find.byKey(const Key('listView')),
        const Offset(0, -1000),
      );

      await tester.drag(
        find.byKey(const Key('listView')),
        const Offset(0, -1000),
      );
      // Verify that nextPage function is called
      expect(nextPageCalled, true);
      verify(mockViewModel.nextPage()).called(1);
    });

    testWidgets('check if FloatingActionButton click works fine',
        (tester) async {
      // Arrange
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pumpAndSettle();

      // Simulate Tap
      final fabFinder = find.byKey(const Key('floating_action_btn'));
      expect(fabFinder, findsOneWidget);
      await tester.tap(fabFinder);

      // Verify the /addpostscreen is pushed
      await tester.pump();
      verify(locator<NavigationService>().pushScreen('/addpostscreen'));
    });

    testWidgets(
        'check if counters reset when scrolling occurs anywhere other than at the edge',
        (tester) async {
      // Arrange
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.pinnedPosts).thenReturn([]);
      when(mockViewModel.initialise()).thenAnswer((_) async => Future.value());
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.posts)
          .thenReturn([post, post, post, post, post, post]);
      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pumpAndSettle();

      // Simulate Scroll within content (not at edge)
      await tester.drag(
        find.byKey(const Key('listView')),
        const Offset(0, -200),
      );
      await tester.pumpAndSettle();

      // Verify that counters are reset and loading state
      expect(find.byType(CircularProgressIndicator), findsNothing);
      verifyNever(mockViewModel.nextPage());
    });
  });
}
