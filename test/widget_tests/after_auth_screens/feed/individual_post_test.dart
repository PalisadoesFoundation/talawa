// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

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
  required Post post1,
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
        post: post1,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });

  group('Individualpostview tests', () {
    testWidgets("Check if the IndividualPostView shows up",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        ///making a sample data
        /// also wrote all the detail
        /// used in the individual post

        final commentJson1 = {
          'creator': {
            '_id': '123',
            'firstName': 'Ayush',
            'lastName': 'Chaudhary',
            'email': 'test@test.com',
          },
          'createdAt': '123456',
          'text': 'test text',
          'post': 'test post',
          'likeCount': 'test count',
        };
        final commentJson2 = {
          'creator': {
            '_id': '123',
            'firstName': 'John',
            'lastName': 'Doe',
            'email': 'test@test.com',
          },
          'createdAt': '123456',
          'text': 'test text',
          'post': 'test post',
          'likeCount': 'test count',
        };

        final commentsJson = [commentJson1, commentJson2];

        ///returning a service response through mocking,
        ///this method was called in
        ///comment view model and was returning null
        ///until I made a mock response.

        when(commentsService.getCommentsForPost('PostID'))
            .thenAnswer((realInvocation) async {
          return commentsJson;
        });

        /// using the mock post made before me

        final Post post = getPostMockModel();

        ///returning mock reponse of post model when
        ///.likedby is called on the model

        when(post.likedBy).thenReturn([LikedBy(sId: "xzy1")]);

        await tester.pumpWidget(createIndividualPostViewWidget(post1: post));
        await tester.pump();

        /// checking if the individual post
        /// screen pops up

        expect(find.byType(Scaffold), findsNWidgets(2));

        ///finding the text field via its ID

        final textfield = find.byKey(const Key('indi_post_tf_key'));

        /// check if the textfield shows up

        expect(textfield, findsOneWidget);

        ///finding the text field via its type

        final textbtn = find.byType(TextButton);

        ///check if btn exist

        expect(textbtn, findsOneWidget);

        ///checking if the onPressed of
        ///text button is working when tapped

        await tester.tap(textbtn);
        await tester.pump();

        ///tapping the text field
        ///to check if it shows up

        await tester.tap(textfield);
        await tester.pump();

        /// Checking if the submit button is working,
        /// when keyboard send action is called

        await tester.showKeyboard(textfield);

        /// keyboard action can be
        /// simulated using the
        /// testTextInput method

        await tester.testTextInput.receiveAction(TextInputAction.send);
        await tester.pump();
      });
    });
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
}
