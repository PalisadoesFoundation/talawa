import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:googleapis/blogger/v3.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';
import '../feed/individual_post_test.dart';

// ... (other imports)

/// a_line_ending_with_end_punctuation.
///
/// more_info_if_required
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  SizeConfig().test();
  testSetupLocator();

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

  group('Test for CommentTemplate', () {
    testWidgets('Check if the CommentTemplate shows up', (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.byType(Row);

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the name is displayed in CommentTemplate',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('Ayush Chaudhary');

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the comment text is displayed in CommentTemplate',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('test text');

      expect(findStack, findsNWidgets(1));
    });
  });

  // Add more test groups for other widgets

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
}
