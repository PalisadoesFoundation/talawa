// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';
import 'package:talawa/widgets/post_widget.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

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
        model: CommentsViewModel(),
        comment: Comment(
          id: "Test id",
          creator: User(
            id: '123',
            firstName: 'Ayush',
            lastName: 'Chaudhary',
            email: 'test@test.com',
          ),
          createdAt: '123456',
          body: 'test text',
        ),
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
  setUpAll(() {
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });
  group("testing Individual Post View ", () {
    setUpAll(() {
      when(
        commentsService.getCommentsForPost(
          postId: 'XYZ',
          first: 10,
          after: anyNamed('after'),
        ),
      ).thenAnswer(
        (_) async => {
          'comments': [
            {
              'node': {
                'body': 'Test comment 1',
              },
            },
            {
              'node': {
                'body': 'Test comment 2',
              },
            },
          ],
          'pageInfo': {
            'hasNextPage': true,
            'hasPreviousPage': false,
            'startCursor': null,
            'endCursor': null,
          },
        },
      );
    });
    testWidgets("Check if Send button is disabled",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(createIndividualPostViewWidget(post1: Post(id: 'XYZ')));
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
      expect(find.byType(IndividualPostView), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
    });
    testWidgets("Check if Send button is enabled and working",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(createIndividualPostViewWidget(post1: Post(id: 'XYZ')));
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
      expect(find.byType(IndividualPostView), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
    });
    testWidgets("Checking if state changes when text is cleared",
        (WidgetTester tester) async {
      await tester
          .pumpWidget(createIndividualPostViewWidget(post1: Post(id: 'XYZ')));
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
      expect(find.byType(IndividualPostView), findsOneWidget);
      expect(find.byType(IndividualPostCommentSection), findsOneWidget);
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
  testWidgets('IndividualPostCommentSection exists in the widget tree',
      (tester) async {
    when(
      commentsService.getCommentsForPost(
        postId: 'XYZ',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'body': 'Test comment 1',
            },
          },
          {
            'node': {
              'body': 'Test comment 2',
            },
          },
        ],
        'pageInfo': {
          'hasNextPage': true,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    await tester.pumpWidget(
      MaterialApp(
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
            post: Post(id: "XYZ"),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // Assert: IndividualPostCommentSection exists
    expect(find.byType(PostWidget), findsOneWidget);
    expect(find.byType(IndividualPostCommentSection), findsOneWidget);
  });
  testWidgets(
      'IndividualPostCommentSection displays comments and load more button',
      (tester) async {
    when(
      commentsService.getCommentsForPost(
        postId: 'XYZ',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'body': 'Test comment 1',
            },
          },
          {
            'node': {
              'body': 'Test comment 2',
            },
          },
        ],
        'pageInfo': {
          'hasNextPage': true,
          'hasPreviousPage': false,
          'startCursor': 'cursor1',
          'endCursor': 'cursor2',
        },
      },
    );
    final model = CommentsViewModel();

    // Act: initialise the model
    await model.initialise(Post(id: 'XYZ'));

    await tester.pumpWidget(
      MaterialApp(
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
            postID: 'postID',
            model: model,
          ),
        ),
      ),
    );

    // Assert: Comments header is shown
    await tester.pumpAndSettle();

    // // Assert: Comments header is shown
    expect(find.text('Comments'), findsOneWidget);

    // // Assert: Comments are displayed
    expect(find.text('Test comment 1'), findsOneWidget);
    expect(find.text('Test comment 2'), findsOneWidget);

    // // Assert: Load More button is displayed
    expect(find.text('Load More....'), findsOneWidget);

    // // Act: Tap Load More
    await tester.tap(find.text('Load More....'));
    await tester.pumpAndSettle();

    // // Assert: getComments called again (fetchNextPage)
    verify(
      commentsService.getCommentsForPost(
        postId: 'XYZ',
        after: anyNamed('after'),
      ),
    ).called(greaterThan(1));
  });
}
