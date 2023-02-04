import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

final LikedBy user = LikedBy(sId: "test_id");

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
final List<Comments> comments1 = [comment1, comment2, comment3];

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
  comments: comments1,
);

Widget createLikedUserCircleAvatarWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
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
      body: likedUserCircleAvatar(user),
    ),
  );
}

final comment = Comment(
  creator: User(
    id: '123',
    firstName: 'Ayush',
    lastName: 'Chaudhary',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  text: 'test text',
  post: 'test post',
  likeCount: 'test count',
);

List<Comments> comments = [
  Comments(sId: 'comment1'),
  Comments(sId: 'comment2'),
  Comments(sId: 'comment3'),
  Comments(sId: 'comment4'),
  Comments(sId: 'comment5'),
  Comments(sId: 'comment6'),
];

Widget createCommentTemplateWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
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
      body: CommentTemplate(
        comment: comment,
      ),
    ),
  );
}

Widget createIndividualPageLikeSectionWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
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
      body: IndividualPageLikeSection(
        usersLiked: [
          LikedBy(sId: 'test1'),
          LikedBy(sId: 'test2'),
          LikedBy(sId: 'test3'),
          LikedBy(sId: 'test4'),
        ],
      ),
    ),
  );
}

Widget createIndividualPostCommentSectionWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
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
      body: IndividualPostCommentSection(
        comments: comments,
        postID: 'test  post id',
      ),
    ),
  );
}

Widget createIndividualPostViewWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
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
        body: IndividualPostView(
      post: post,
    )),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });
  group('Test for likedUserCircleAvatar', () {
    testWidgets('Check if the likedUserCircleAvatar shows up', (tester) async {
      await tester.pumpWidget(createLikedUserCircleAvatarWidget());
      await tester.pump();

      final findStack = find.byType(Stack);

      expect(findStack, findsNWidgets(2));
    });
  });

  group('Test for IndividualPageLikeSection', () {
    testWidgets('Check if the IndividualPageLikeSection shows up',
        (tester) async {
      await tester.pumpWidget(createIndividualPageLikeSectionWidget());
      await tester.pump();

      final findColumn = find.byType(Column);

      expect(findColumn, findsNWidgets(1));
    });

    testWidgets(
        'Check if the likedUserCircleAvatar in IndividualPageLikeSection shows up',
        (tester) async {
      await tester.pumpWidget(createIndividualPageLikeSectionWidget());
      await tester.pump();

      final findStack = find.byType(Stack);

      expect(findStack, findsNWidgets(5));
    });
  });

  // group('Test for IndividualPostCommentSection', () {
  //   testWidgets('Check if the IndividualPostCommentSection shows up',
  //       (tester) async {
  //     await tester.pumpWidget(createIndividualPostCommentSectionWidget());
  //     await tester.pump();
  //   });
  // });

  group('Test for CommentTemplate', () {
    testWidgets('Check if the CommentTemplate shows up', (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.byType(Row);

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the name is displayed in CommentTemplate ',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('Ayush Chaudhary');

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the comment text is displayed in CommentTemplate ',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('test text');

      expect(findStack, findsNWidgets(1));
    });
  });
  group('Test for IndividualPostView', () {
    testWidgets('Check if the IndividualPostView shows up', (tester) async {
      await tester.pumpWidget(createIndividualPostViewWidget());
      await tester.pump();
    });
  });
}
