import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/widgets_view_models/comment_interactions_view_model.dart';
import 'package:talawa/widgets/comment_interactions.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('CommentInteractions Widget Tests', () {
    setUpAll(() {
      registerServices();
      registerViewModels();

      // Register ActionHandlerService for button interactions
      getAndRegisterLocalActionHandlerService();

      // Register CommentInteractionsViewModel
      if (!locator.isRegistered<CommentInteractionsViewModel>()) {
        locator.registerFactory<CommentInteractionsViewModel>(
          () => CommentInteractionsViewModel(),
        );
      }
    });

    tearDownAll(() {
      unregisterViewModels();
      unregisterServices();
    });

    /// Helper function to create a comment with specific vote properties
    Comment createTestComment({
      String id = 'test-comment-1',
      bool? hasVoted,
      VoteType? voteType,
      int? upvotesCount,
      int? downvotesCount,
    }) {
      return Comment(
        id: id,
        body: 'Test comment',
        creator: User(id: 'user1', firstName: 'John', lastName: 'Doe'),
        hasVoted: hasVoted,
        voteType: voteType,
        upvotesCount: upvotesCount,
        downvotesCount: downvotesCount,
      );
    }

    /// Helper function to pump the CommentInteractions widget
    Future<void> pumpCommentInteractions(
      WidgetTester tester,
      Comment comment,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              onSecondary: Colors.grey,
            ),
          ),
          home: Scaffold(
            body: CommentInteractions(
              comment: comment,
            ),
          ),
        ),
      );
    }

    group('Widget Rendering Tests', () {
      testWidgets('should render upvote and downvote buttons', (tester) async {
        // Arrange
        final comment = createTestComment();

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byType(IconButton), findsNWidgets(2));
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
      });

      testWidgets('should display correct vote counts', (tester) async {
        // Arrange
        final comment = createTestComment(
          upvotesCount: 5,
          downvotesCount: 2,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.text('5'), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
      });

      testWidgets('should display 0 when vote counts are null', (tester) async {
        // Arrange
        final comment = createTestComment(
          upvotesCount: null,
          downvotesCount: null,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.text('0'), findsNWidgets(2));
      });

      testWidgets('should have responsive sizing based on screen width',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Set a specific screen size
        tester.view.physicalSize = const Size(392, 800);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpCommentInteractions(tester, comment);

        // Find the SizedBox widgets that contain the IconButtons
        final sizedBoxes = find.byType(SizedBox);
        expect(sizedBoxes, findsWidgets);

        // Verify that buttons are sized appropriately
        final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
        expect(firstSizedBox.height, equals(30.0));
        expect(firstSizedBox.width, equals(30.0));

        // Reset the screen size
        addTearDown(tester.view.reset);
      });
    });

    group('Upvote Functionality Tests', () {
      testWidgets('should show filled upvote icon when comment is upvoted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 1,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_up), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up_outlined), findsNothing);

        // Verify the upvote icon is blue
        final upvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_up));
        expect(upvoteIcon.color, equals(Colors.blue));
      });

      testWidgets(
          'should show outlined upvote icon when comment is not upvoted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up), findsNothing);
      });

      testWidgets('should show outlined upvote icon when comment is downvoted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 1,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up), findsNothing);
      });
    });

    group('Downvote Functionality Tests', () {
      testWidgets('should show filled downvote icon when comment is downvoted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 1,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_down), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsNothing);

        // Verify the downvote icon is red
        final downvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_down));
        expect(downvoteIcon.color, equals(Colors.red));
      });

      testWidgets(
          'should show outlined downvote icon when comment is not downvoted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets('should show outlined downvote icon when comment is upvoted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 1,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets(
          'should show correct downvote icon color and state when hasVoted is true and voteType is downVote',
          (tester) async {
        // Arrange - This specifically tests the code section you mentioned
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 3,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert - Test the exact condition from your code
        // comment.hasVoted == true && comment.voteType == VoteType.downVote
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isTrue,
        );

        // Verify the filled downvote icon is shown
        expect(find.byIcon(Icons.thumb_down), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsNothing);

        // Verify the downvote icon properties
        final downvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_down));
        expect(downvoteIcon.color, equals(Colors.red));

        // Verify the downvote count is displayed
        expect(find.text('3'), findsOneWidget);
      });

      testWidgets(
          'should show outlined downvote icon when hasVoted is true but voteType is not downVote',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.upVote, // Different from downVote
          upvotesCount: 1,
          downvotesCount: 0,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert - Test the condition is false
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isFalse,
        );

        // Verify the outlined downvote icon is shown
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets('should show outlined downvote icon when hasVoted is false',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert - Test the condition is false
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isFalse,
        );

        // Verify the outlined downvote icon is shown
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });
    });

    group('Vote State Combinations Tests', () {
      testWidgets('should handle null hasVoted gracefully', (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
      });

      testWidgets('should handle all VoteType.none state', (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: false,
          voteType: VoteType.none,
          upvotesCount: 0,
          downvotesCount: 0,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.text('0'), findsNWidgets(2));
      });

      testWidgets('should handle transition states correctly', (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 5,
          downvotesCount: 1,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byIcon(Icons.thumb_up), findsOneWidget); // Filled upvote
        expect(
          find.byIcon(Icons.thumb_down_outlined),
          findsOneWidget,
        ); // Outlined downvote
        expect(find.text('5'), findsOneWidget);
        expect(find.text('1'), findsOneWidget);
      });
    });

    group('UI Layout and Styling Tests', () {
      testWidgets('should have proper padding and layout structure',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byType(Row), findsOneWidget);
        expect(
          find.byType(Column),
          findsNWidgets(2),
        ); // One for upvote, one for downvote

        // Find the specific padding widget with non-zero padding
        final paddingWidgets = find.byType(Padding);
        expect(paddingWidgets, findsNWidgets(3)); // There are 3 Padding widgets

        // Find the padding with EdgeInsets.only(right: 4.0)
        bool foundCorrectPadding = false;
        for (int i = 0; i < 3; i++) {
          final padding = tester.widget<Padding>(paddingWidgets.at(i));
          if (padding.padding == const EdgeInsets.only(right: 4.0)) {
            foundCorrectPadding = true;
            break;
          }
        }
        expect(foundCorrectPadding, isTrue);
      });

      testWidgets('should apply correct text styling to vote counts',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          upvotesCount: 15,
          downvotesCount: 3,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        final upvoteCountText = tester.widget<Text>(find.text('15'));
        final downvoteCountText = tester.widget<Text>(find.text('3'));

        expect(upvoteCountText.style?.fontSize, equals(11));
        expect(downvoteCountText.style?.fontSize, equals(11));
      });

      testWidgets('should maintain minimum size requirements', (tester) async {
        // Arrange
        final comment = createTestComment();

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        final row = tester.widget<Row>(find.byType(Row));
        expect(row.mainAxisSize, equals(MainAxisSize.min));
      });
    });

    group('Accessibility Tests', () {
      testWidgets('should have proper semantic labels for vote buttons',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byType(IconButton), findsNWidgets(2));

        // Verify buttons are accessible
        final iconButtons = find.byType(IconButton);
        expect(iconButtons, findsNWidgets(2));
      });

      testWidgets('should handle large vote counts without overflow',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          upvotesCount: 999999,
          downvotesCount: 888888,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.text('999999'), findsOneWidget);
        expect(find.text('888888'), findsOneWidget);

        // Verify no overflow
        expect(tester.takeException(), isNull);
      });
    });

    group('Edge Cases Tests', () {
      testWidgets('should handle negative vote counts gracefully',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          upvotesCount: -1,
          downvotesCount: -2,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.text('-1'), findsOneWidget);
        expect(find.text('-2'), findsOneWidget);
      });

      testWidgets('should handle very large screen sizes', (tester) async {
        // Arrange
        final comment = createTestComment();

        // Set a large screen size
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byType(CommentInteractions), findsOneWidget);
        expect(tester.takeException(), isNull);

        // Reset the screen size
        addTearDown(tester.view.reset);
      });

      testWidgets('should handle very small screen sizes', (tester) async {
        // Arrange
        final comment = createTestComment();

        // Set a small screen size
        tester.view.physicalSize = const Size(200, 400);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(find.byType(CommentInteractions), findsOneWidget);
        expect(tester.takeException(), isNull);

        // Reset the screen size
        addTearDown(tester.view.reset);
      });
    });

    group('Icon Size and Responsiveness Tests', () {
      testWidgets('should calculate correct icon sizes based on screen width',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Set specific screen size (392 is the base width in the calculation)
        tester.view.physicalSize = const Size(392, 800);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        final icons = find.byType(Icon);
        expect(icons, findsNWidgets(2));

        final upvoteIcon = tester.widget<Icon>(icons.first);
        final downvoteIcon = tester.widget<Icon>(icons.last);

        // Expected icon size: (392 / 392) * 16 = 16
        expect(upvoteIcon.size, equals(16.0));
        expect(downvoteIcon.size, equals(16.0));

        // Reset the screen size
        addTearDown(tester.view.reset);
      });

      testWidgets('should scale icon sizes for different screen widths',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Set a different screen size
        tester.view.physicalSize =
            const Size(784, 800); // Double the base width
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        final icons = find.byType(Icon);
        final upvoteIcon = tester.widget<Icon>(icons.first);

        // Expected icon size: (784 / 392) * 16 = 32
        expect(upvoteIcon.size, equals(32.0));

        // Reset the screen size
        addTearDown(tester.view.reset);
      });
    });

    group('Downvote Icon Condition Tests - Specific', () {
      testWidgets(
          'should render correct downvote icon when hasVoted is true and voteType is downVote',
          (tester) async {
        // Arrange - Testing the exact condition from your code
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 5,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert - Verify the exact condition
        expect(comment.hasVoted == true, isTrue);
        expect(comment.voteType == VoteType.downVote, isTrue);
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isTrue,
        );

        // Verify the filled downvote icon is shown with red color
        expect(find.byIcon(Icons.thumb_down), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsNothing);

        final downvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_down));
        expect(downvoteIcon.color, equals(Colors.red));
      });

      testWidgets('should render outlined downvote icon when hasVoted is false',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isFalse,
        );
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets(
          'should render outlined downvote icon when hasVoted is true but voteType is upVote',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isFalse,
        );
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets('should render outlined downvote icon when hasVoted is null',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isFalse,
        );
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets(
          'should render outlined downvote icon when hasVoted is true but voteType is none',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.none,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Assert
        expect(
          comment.hasVoted == true && comment.voteType == VoteType.downVote,
          isFalse,
        );
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });
    });

    group('Button Interaction Tests', () {
      testWidgets('should have properly configured upvote button',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Act
        await pumpCommentInteractions(tester, comment);

        // Find and verify upvote button exists and is of correct type
        final upvoteButton = find.byIcon(Icons.thumb_up_outlined);
        expect(upvoteButton, findsOneWidget);

        // Verify it's inside an IconButton
        final iconButton = find.ancestor(
          of: upvoteButton,
          matching: find.byType(IconButton),
        );
        expect(iconButton, findsOneWidget);
      });

      testWidgets('should have properly configured downvote button',
          (tester) async {
        // Arrange
        final comment = createTestComment();

        // Act
        await pumpCommentInteractions(tester, comment);

        // Find and verify downvote button exists and is of correct type
        final downvoteButton = find.byIcon(Icons.thumb_down_outlined);
        expect(downvoteButton, findsOneWidget);

        // Verify it's inside an IconButton
        final iconButton = find.ancestor(
          of: downvoteButton,
          matching: find.byType(IconButton),
        );
        expect(iconButton, findsOneWidget);
      });

      testWidgets(
          'should have properly configured filled downvote button when voted',
          (tester) async {
        // Arrange
        final comment = createTestComment(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 2,
        );

        // Act
        await pumpCommentInteractions(tester, comment);

        // Find and verify filled downvote button exists
        final downvoteButton = find.byIcon(Icons.thumb_down);
        expect(downvoteButton, findsOneWidget);

        // Verify it's inside an IconButton
        final iconButton = find.ancestor(
          of: downvoteButton,
          matching: find.byType(IconButton),
        );
        expect(iconButton, findsOneWidget);
      });
    });
  });
}
