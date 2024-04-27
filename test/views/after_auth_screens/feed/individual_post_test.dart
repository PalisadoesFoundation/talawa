import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_widget.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createIndividualPostViewWidget(Post post) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: IndividualPostView(post: post),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

final LikedBy user = LikedBy(sId: "test_id");

final u1 = User(
  id: '123',
  firstName: 'Lakshay',
  lastName: 'Gupta',
  email: 'test@test.com',
);
final u2 = User(
  id: '123',
  firstName: 'Ankit',
  lastName: 'Varshney',
  email: 'test@test.com',
);
final List<User> users = [u1, u2];
List<Comments> comments = [
  Comments(sId: 'comment1'),
  Comments(sId: 'comment2'),
  Comments(sId: 'comment3'),
  Comments(sId: 'comment4'),
  Comments(sId: 'comment5'),
  Comments(sId: 'comment6'),
];
final comment = Comment(
  creator: User(
    id: '123',
    firstName: 'Ankit',
    lastName: 'Varshney',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  text: 'test text',
  post: 'test post',
  likeCount: 'test count',
);

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
  organization: OrgInfo(admins: users),
  likedBy: likeby,
  comments: comments1,
);
Widget createLikedUserCircleAvatar(LikedBy user) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: likedUserCircleAvatar(user),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

Widget createIndividualPageLikeSection() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: IndividualPageLikeSection(
          usersLiked: [
            LikedBy(sId: 'test1'),
            LikedBy(sId: 'test2'),
            LikedBy(sId: 'test3'),
            LikedBy(sId: 'test4'),
          ],
        ),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

Widget createIndividualPostCommentSectionWidget() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: BaseView<AppLanguage>(
      onModelReady: (model) {
        model.initialize();
      },
      builder: (context, model, child) {
        return IndividualPostCommentSection(
          comments: comments,
          postID: 'test  post id',
        );
      },
    ),
  );
}

Widget createCommentTemplateWidget(Comment comment) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: BaseView<AppLanguage>(
      onModelReady: (model) {
        model.initialize();
      },
      builder: (context, model, child) {
        return CommentTemplate(comment: comment);
      },
    ),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();

  setUp(() {
    registerServices();
  });

  group("testing Individual Post View ", () {
    testWidgets("Check if Send button is disabled",
        (WidgetTester tester) async {
      await tester.pumpWidget(createIndividualPostViewWidget(post));
      await tester.pumpAndSettle();

      final textFieldFinder = find.byKey(const Key('indi_post_tf_key'));
      final textButtonFinder = find.byKey(const Key('sendButton'));
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      // Clear the text field
      await tester.enterText(textFieldFinder, '');
      await tester.pumpAndSettle();
      // The button should be disabled after clearing the text
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      expect(find.byType(NewsPost), findsOneWidget);
      expect(find.byType(IndividualPageLikeSection), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
    });
    testWidgets("Check if Send button is enabled and working",
        (WidgetTester tester) async {
      await tester.pumpWidget(createIndividualPostViewWidget(post));
      await tester.pumpAndSettle();

      final textFieldFinder = find.byKey(const Key('indi_post_tf_key'));
      final textButtonFinder = find.byKey(const Key('sendButton'));
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      // Clear the text field
      await tester.enterText(textFieldFinder, '');
      await tester.pumpAndSettle();
      // The button should be disabled after clearing the text
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      // Enter non-empty text
      await tester.enterText(textFieldFinder, 'Test Comment');
      await tester.pumpAndSettle();
      // The button should now be enabled
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isTrue);

      // Verify that the text field is cleared
      expect(find.text('Test Comment'), findsOneWidget);

      //  Tap the send button
      await tester.tap(textButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(NewsPost), findsOneWidget);
      expect(find.byType(IndividualPageLikeSection), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
    });
    testWidgets("Checking if state changes when text is cleared",
        (WidgetTester tester) async {
      await tester.pumpWidget(createIndividualPostViewWidget(post));
      await tester.pumpAndSettle();

      final textFieldFinder = find.byKey(const Key('indi_post_tf_key'));
      final textButtonFinder = find.byKey(const Key('sendButton'));
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      // Clear the text field
      await tester.enterText(textFieldFinder, '');
      await tester.pumpAndSettle();
      // The button should be disabled after clearing the text
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      // Enter non-empty text
      await tester.enterText(textFieldFinder, 'Test Comment');
      await tester.pumpAndSettle();
      // The button should now be enabled
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isTrue);

      // Verify that the text field is cleared
      expect(find.text('Test Comment'), findsOneWidget);

      // Testing if state changes back
      await tester.enterText(textFieldFinder, '');
      await tester.pumpAndSettle();
      expect(tester.widget<TextButton>(textButtonFinder).enabled, isFalse);

      //  Tap the send button
      await tester.tap(textButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(NewsPost), findsOneWidget);
      expect(find.byType(IndividualPageLikeSection), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
    });
  });

  group("Test for likedUserCircleAvatar", () {
    testWidgets("checking if likedUserCircleAvatar widget correctly shows up",
        (WidgetTester tester) async {
      await tester.pumpWidget(createLikedUserCircleAvatar(user));
      await tester.pumpAndSettle();

      expect(find.byType(CircleAvatar), findsOneWidget);
    });
  });
  group("Test for IndividualPageLikeSection", () {
    testWidgets(
        "checking if IndividualPageLikeSection widget correctly shows up",
        (WidgetTester tester) async {
      await tester.pumpWidget(createIndividualPageLikeSection());
      await tester.pumpAndSettle();
      expect(find.text("Liked by"), findsOneWidget);

      expect(find.byType(Row), findsOneWidget);
      expect(
        find.byWidget(likedUserCircleAvatar(user)),
        findsNWidgets(4),
      );
    });
  });

  group("Test for IndividualPostCommentSection", () {
    testWidgets(
        "checking if IndividualPostCommentSection widget correctly shows up",
        (WidgetTester tester) async {
      await tester.pumpWidget(createIndividualPostCommentSectionWidget());
      await tester.pumpAndSettle();

      expect(find.text("Comments"), findsOneWidget);
    });
  });
  group("Test for CommentTemplate", () {
    testWidgets("checking the comment template widgets",
        (WidgetTester tester) async {
      await tester.pumpWidget(createCommentTemplateWidget(comment));
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(
        find.text(
          "${comment.creator!.firstName!} ${comment.creator!.lastName!}",
        ),
        findsOneWidget,
      );
      expect(find.text(comment.text!), findsOneWidget);
    });
  });
}
