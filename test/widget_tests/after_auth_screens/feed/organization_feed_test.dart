import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';

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
  testWidgets('check if post shows up when  model.posts.isNotEmpty is true',
      (tester) async {
    final model = locator<MainScreenViewModel>();
    final orModel = locator<OrganizationFeedViewModel>();
    await tester.pumpWidget(createOrganizationFeedScreen(homeModel: model));
    await tester.pump();

    final postservice = locator<PostService>();

    final u1 = User(
      id: '123',
      firstName: 'John',
      lastName: 'Doe',
      email: 'test@test.com',
    );
    final u2 = User(
      id: '123',
      firstName: 'Ayush',
      lastName: 'Chaudhary',
      email: 'test@test.com',
    );
    final List<User> users = [u1, u2];

    final LikedBy l1 = LikedBy(sId: 'test1');
    final LikedBy l2 = LikedBy(sId: 'test2');
    final List<LikedBy> likeby = [l1, l2];

    final comment1 = Comments(sId: 'comment1');
    final comment2 = Comments(sId: 'comment2');
    final comment3 = Comments(sId: 'comment3');
    final List<Comments> comments = [comment1, comment2, comment3];

    final myBirthday = DateTime.utc(2004, DateTime.june, 16, 5, 30, 0, 0, 0);
    final post = Post(
      creator: User(
        id: '123',
        firstName: 'John',
        lastName: 'Doe',
        email: 'test@test.com',
      ),
      sId: "sid",
      createdAt: myBirthday,
      description: 'test description',
      imageUrl: 'https://image.com',
      videoUrl: 'https://image.com',
      organization: OrgInfo(admins: users),
      likedBy: likeby,
      comments: comments,
    );
    final List<Post> posts = [post];
    // when(postservice.postStream).
    final StreamController<List<Post>> _streamController = StreamController();
    final Stream<List<Post>> _stream =
        _streamController.stream.asBroadcastStream();

    // final service = MockEventService();
    final service = MockPostService();
    when(postservice.postStream).thenAnswer((invocation) => _stream);
    postservice.postStream.listen((event) {
      print(11);
    });
    _streamController.add(posts);
    // when(postservice.postStream).thenAnswer((realInvocation) => Stream.of<Stream<List<Post>>>(posts));
    await tester.drag(
      find.byType(RefreshIndicator),
      const Offset(0, 200),
    );

    await tester.pumpAndSettle();
  });
}
