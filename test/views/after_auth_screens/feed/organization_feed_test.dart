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
import 'package:talawa/widgets/post_widget.dart';

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
          body: OrganizationFeed(
            homeModel: homeModel,
            key: const Key('test_key'),
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
  id: "test_post_id",
  creator: userConfig.currentUser,
  caption: 'Testing',
  createdAt: DateTime.now(),
  organization: userConfig.currentOrg,
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

  group('tests for Organizaiton feed Screen', () {
    testWidgets('check if orgname is displayed shows up', (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts)
          .thenReturn([post, post, post, post, post, post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);
      final model = locator<MainScreenViewModel>();

      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pump();

      bool refreshed = false;
      when(mockViewModel.refreshPosts()).thenAnswer((_) {
        refreshed = true;
        return Future.delayed(Duration.zero);
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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts).thenReturn([post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.byType(PostWidget);
      expect(finder, findsOneWidget);
    });
    testWidgets('check if no posts shows up then No posts text is there',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

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
      when(mockViewModel.initialise()).thenAnswer((_) async {});
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

      // Scroll to bottom to trigger nextPage
      await tester.drag(
        find.byKey(const Key('listView')),
        const Offset(0, -800), // Scroll up (negative Y) to reach bottom
      );
      await tester.pumpAndSettle();

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

    testWidgets('check if scroll within content does not trigger nextPage',
        (tester) async {
      // Arrange
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts)
          .thenReturn([post, post, post, post, post, post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pumpAndSettle();

      // Simulate Scroll within content (not at bottom edge)
      await tester.drag(
        find.byKey(const Key('listView')),
        const Offset(0, -200),
      );
      await tester.pumpAndSettle();

      // Verify that nextPage is not called for mid-scroll
      verifyNever(mockViewModel.nextPage());
    });

    testWidgets('check if scroll triggers nextPage method call',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts)
          .thenReturn([post, post, post, post, post, post]);
      when(mockViewModel.pinnedPosts).thenReturn([post]);

      when(mockViewModel.nextPage()).thenAnswer((_) async {});

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pumpAndSettle();

      // Scroll down to trigger pagination
      await tester.drag(
        find.byKey(const Key('listView')),
        const Offset(0, -800),
      );
      await tester.pumpAndSettle();

      // Verify nextPage was called
      verify(mockViewModel.nextPage()).called(1);
    });

    testWidgets('check if widget renders correctly with empty posts',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
      await tester.pumpAndSettle();

      // Verify that the ListView is present
      expect(find.byKey(const Key('listView')), findsOneWidget);

      // Verify empty state message is shown
      expect(
        find.text('There are no posts in this organization'),
        findsOneWidget,
      );
    });

    testWidgets(
        'check if create post button works when no posts and no pinned posts',
        (tester) async {
      when(mockViewModel.currentOrgName).thenReturn('testOrg');
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.posts).thenReturn([]);
      when(mockViewModel.pinnedPosts).thenReturn([]);

      final model = locator<MainScreenViewModel>();
      await tester.pumpWidget(createOrganizationFeedScreen2(homeModel: model));
      await tester.pumpAndSettle();

      final finder = find.text('Create your first post');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(locator<NavigationService>().pushScreen('/addpostscreen'));
    });
  });
}
