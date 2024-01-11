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
import 'package:talawa/views/after_auth_screens/profile/user_feed.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_list_widget.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

Widget userFeedScreen({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
  required bool isTest,
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
      body: UserFeed(
        forTest: isTest,
        key: const Key('test_key'),
      ),
    ),
  );
}

Widget userFeedScreen1({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
  required bool isTest,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      // return BaseView<LikeButtonViewModel>(
      //   onModelReady: (model) {
      //     model.initialize(likedBy0, 'test_post_id');
      //   },
      //   builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          body: UserFeed(
            forTest: isTest,
            key: const Key('test_key'),
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
      );
    },
  );
  //   },
  // );
}

final List<LikedBy> likedBy0 = [
  LikedBy(sId: 'Test user 1'),
  LikedBy(sId: 'Test user 2'),
];

final post = Post(
  sId: "test_post_id",
  creator: userConfig.currentUser,
  likedBy: likedBy0,
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
  group('tests for User feed Screen', () {
    testWidgets('check if UserFeedScreen shows up', (tester) async {
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);
      await tester.pumpWidget(userFeedScreen(isTest: true));
      await tester.pump();

      final finder = find.byKey(const Key('test_key'));

      expect(finder, findsOneWidget);
    });

    testWidgets('check if CircularIndicator Shows up', (tester) async {
      when(mockViewModel.isFetchingPosts).thenReturn(true);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);

      await tester.pumpWidget(userFeedScreen(isTest: false));

      await tester.pump();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsOneWidget);
    });
    testWidgets('check if No posts text shows up', (tester) async {
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);

      await tester.pumpWidget(userFeedScreen(isTest: true));

      await tester.pump();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsNothing);

      expect(
        find.text('You have no post in this organization'),
        findsOneWidget,
      );
    });
    testWidgets('check if text button shows up', (tester) async {
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.initialise()).thenReturn(null);
      when(mockViewModel.userPosts).thenReturn([]);

      await tester.pumpWidget(userFeedScreen(isTest: true));

      await tester.pump();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsNothing);

      expect(
        find.text('Create your first post'),
        findsOneWidget,
      );
    });
    testWidgets('check if PostListWIdget shows up', (tester) async {
      when(mockViewModel.isFetchingPosts).thenReturn(false);
      when(mockViewModel.userPosts).thenReturn([
        Post(
          sId: "test_post_id",
          creator: userConfig.currentUser,
          likedBy: likedBy0,
          description: 'Testing',
          comments: [Comments(sId: 'cmmnt1')],
          createdAt: DateTime.now(),
          organization: userConfig.currentOrg,
        ),
      ]);

      when(mockViewModel.initialise()).thenReturn(null);

      await tester.pumpWidget(userFeedScreen1(isTest: true));
      await tester.pumpAndSettle();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsNothing);

      final finder1 = find.byType(PostListWidget);
      expect(finder1, findsOneWidget);
    });
  });
}
