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

final comment = Comment(
  creator: User(
    id: '123',
    firstName: 'Ankit',
    lastName: 'Varshney',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  body: 'test text',
);

final myBirthday = DateTime.utc(2004, DateTime.june, 16, 5, 30, 0, 0, 0);
final post = Post(
  creator: User(
    id: '123',
    firstName: 'John',
    lastName: 'Doe',
    email: 'test@test.com',
  ),
  id: "sid",
  createdAt: myBirthday,
  caption: 'test description',
  organization: OrgInfo(admins: users),
);

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
        return const IndividualPostCommentSection(
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
  setUpAll(() {
    SizeConfig().test();
    testSetupLocator();
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

      expect(find.byType(PostWidget), findsOneWidget);
      expect(find.byType(Interactions), findsOneWidget);
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

      expect(find.byType(PostWidget), findsOneWidget);
      expect(find.byType(Interactions), findsOneWidget);
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

      expect(find.byType(PostWidget), findsOneWidget);
      expect(find.byType(Interactions), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
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
      expect(find.text(comment.body!), findsOneWidget);
    });
  });
}
