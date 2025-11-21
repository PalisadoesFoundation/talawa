import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';
import 'package:talawa/widgets/interaction.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('Interactions Widget Tests', () {
    setUpAll(() {
      registerServices();
      registerViewModels();

      // Register ActionHandlerService for button interactions
      getAndRegisterLocalActionHandlerService();

      // Register InteractionsViewModel
      if (!locator.isRegistered<InteractionsViewModel>()) {
        locator.registerFactory<InteractionsViewModel>(
          () => InteractionsViewModel(),
        );
      }
    });

    tearDownAll(() {
      unregisterViewModels();
      unregisterServices();
    });

    /// Helper function to create a post with specific vote properties
    Post createTestPost({
      String id = 'test-post-1',
      String caption = 'Test post caption',
      bool? hasVoted,
      VoteType? voteType,
      int? upvotesCount,
      int? downvotesCount,
      int? commentsCount,
      DateTime? createdAt,
      bool setCreatedAtNull = false,
    }) {
      return Post(
        id: id,
        caption: caption,
        creator: User(id: 'user1', name: 'John Doe'),
        hasVoted: hasVoted,
        voteType: voteType,
        upvotesCount: upvotesCount,
        downvotesCount: downvotesCount,
        commentsCount: commentsCount,
        createdAt: setCreatedAtNull
            ? null
            : (createdAt ?? DateTime.now().subtract(const Duration(hours: 2))),
      );
    }

    /// Helper function to pump the Interactions widget
    Future<void> pumpInteractions(
      WidgetTester tester,
      Post post, {
      Function(Post)? redirectCallback,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              onSecondary: Colors.grey,
            ),
          ),
          home: Scaffold(
            body: Interactions(
              post: post,
              redirectToIndividualPage: redirectCallback,
            ),
          ),
        ),
      );
    }

    group('Widget Rendering Tests', () {
      testWidgets('should render upvote, downvote, and comment buttons',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byType(IconButton), findsNWidgets(3));
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.comment_outlined), findsOneWidget);
      });

      testWidgets('should display correct vote and comment counts',
          (tester) async {
        // Arrange
        final post = createTestPost(
          upvotesCount: 15,
          downvotesCount: 3,
          commentsCount: 8,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('15'), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
        expect(find.text('8'), findsOneWidget);
      });

      testWidgets('should display 0 when counts are null', (tester) async {
        // Arrange
        final post = createTestPost(
          upvotesCount: null,
          downvotesCount: null,
          commentsCount: null,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('0'), findsNWidgets(3));
      });

      testWidgets('should display post creation duration', (tester) async {
        // Arrange
        final post = createTestPost(
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('2 Hours Ago'), findsOneWidget);
      });

      testWidgets('should have responsive sizing based on screen width',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Set a specific screen size
        tester.view.physicalSize = const Size(392, 800);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpInteractions(tester, post);

        // Find the SizedBox widgets that contain the IconButtons
        final sizedBoxes = find.byType(SizedBox);
        expect(sizedBoxes, findsWidgets);

        // Verify that buttons are sized appropriately
        final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.first);
        expect(firstSizedBox.height, equals(35.0));
        expect(firstSizedBox.width, equals(35.0));

        // Reset the screen size
        addTearDown(tester.view.reset);
      });
    });

    group('Upvote Functionality Tests', () {
      testWidgets('should show filled upvote icon when post is upvoted',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 1,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_up), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up_outlined), findsNothing);

        // Verify the upvote icon is blue
        final upvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_up));
        expect(upvoteIcon.color, equals(Colors.blue));
      });

      testWidgets('should show outlined upvote icon when post is not upvoted',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up), findsNothing);
      });

      testWidgets('should have tappable upvote button', (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post);

        // Find the upvote button and tap it
        final upvoteButton = find.byIcon(Icons.thumb_up_outlined);
        await tester.tap(upvoteButton);
        await tester.pump();

        // Assert - Button should be tappable (no exceptions thrown)
        expect(tester.takeException(), isNull);
      });

      testWidgets('should show outlined upvote icon when post is downvoted',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 1,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_up), findsNothing);
      });
    });

    group('Downvote Functionality Tests', () {
      testWidgets('should show filled downvote icon when post is downvoted',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 1,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_down), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsNothing);

        // Verify the downvote icon is red
        final downvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_down));
        expect(downvoteIcon.color, equals(Colors.red));
      });

      testWidgets(
          'should show outlined downvote icon when post is not downvoted',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets('should have tappable downvote button', (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post);

        // Find the downvote button and tap it
        final downvoteButton = find.byIcon(Icons.thumb_down_outlined);
        await tester.tap(downvoteButton);
        await tester.pump();

        // Assert - Button should be tappable (no exceptions thrown)
        expect(tester.takeException(), isNull);
      });

      testWidgets('should show outlined downvote icon when post is upvoted',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 1,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets(
          'should show correct downvote icon color and state when hasVoted is true and voteType is downVote',
          (tester) async {
        // Arrange - This specifically tests the downvote condition
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.downVote,
          downvotesCount: 5,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert - Test the exact condition from the code
        // post.hasVoted == true && post.voteType == VoteType.downVote
        expect(
          post.hasVoted == true && post.voteType == VoteType.downVote,
          isTrue,
        );

        // Verify the filled downvote icon is shown
        expect(find.byIcon(Icons.thumb_down), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsNothing);

        // Verify the downvote icon properties
        final downvoteIcon = tester.widget<Icon>(find.byIcon(Icons.thumb_down));
        expect(downvoteIcon.color, equals(Colors.red));

        // Verify the downvote count is displayed
        expect(find.text('5'), findsOneWidget);
      });

      testWidgets(
          'should show outlined downvote icon when hasVoted is true but voteType is not downVote',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.upVote, // Different from downVote
          upvotesCount: 1,
          downvotesCount: 0,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert - Test the condition is false
        expect(
          post.hasVoted == true && post.voteType == VoteType.downVote,
          isFalse,
        );

        // Verify the outlined downvote icon is shown
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });

      testWidgets('should show outlined downvote icon when hasVoted is false',
          (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert - Test the condition is false
        expect(
          post.hasVoted == true && post.voteType == VoteType.downVote,
          isFalse,
        );

        // Verify the outlined downvote icon is shown
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down), findsNothing);
      });
    });

    group('Comment Button Functionality Tests', () {
      testWidgets(
          'should call redirectToIndividualPage when comment button is tapped',
          (tester) async {
        // Arrange
        bool callbackCalled = false;
        Post? passedPost;

        final testPost = createTestPost(
          id: 'post123',
          caption: 'Test caption',
          commentsCount: 5,
        );

        // Act
        await pumpInteractions(
          tester,
          testPost,
          redirectCallback: (post) {
            callbackCalled = true;
            passedPost = post;
          },
        );

        // Find and tap the comment button
        final commentButton = find.byIcon(Icons.comment_outlined);
        await tester.tap(commentButton);
        await tester.pumpAndSettle();

        // Assert
        expect(callbackCalled, isTrue);
        expect(passedPost, isNotNull);
        expect(passedPost?.id, equals('post123'));
        expect(identical(passedPost, testPost), isTrue);
      });

      testWidgets('should handle null redirectToIndividualPage callback',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post, redirectCallback: null);

        // Find and tap the comment button
        final commentButton = find.byIcon(Icons.comment_outlined);
        await tester.tap(commentButton);
        await tester.pump();

        // Assert - Should not throw an exception
        expect(tester.takeException(), isNull);
      });

      testWidgets('should display comment count correctly', (tester) async {
        // Arrange
        final post = createTestPost(commentsCount: 42);

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('42'), findsOneWidget);
      });
    });

    group('Vote State Combinations Tests', () {
      testWidgets('should handle null hasVoted gracefully', (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
      });

      testWidgets('should handle all VoteType.none state', (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: false,
          voteType: VoteType.none,
          upvotesCount: 0,
          downvotesCount: 0,
          commentsCount: 0,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_up_outlined), findsOneWidget);
        expect(find.byIcon(Icons.thumb_down_outlined), findsOneWidget);
        expect(find.text('0'), findsNWidgets(3));
      });

      testWidgets('should handle transition states correctly', (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 10,
          downvotesCount: 2,
          commentsCount: 5,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byIcon(Icons.thumb_up), findsOneWidget); // Filled upvote
        expect(
          find.byIcon(Icons.thumb_down_outlined),
          findsOneWidget,
        ); // Outlined downvote
        expect(find.text('10'), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
        expect(find.text('5'), findsOneWidget);
      });
    });

    group('UI Layout and Styling Tests', () {
      testWidgets('should have proper padding and layout structure',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byType(Row), findsOneWidget);
        expect(
          find.byType(Column),
          findsNWidgets(3),
        ); // Upvote, downvote, and comment columns

        // Find padding widgets with specific EdgeInsets
        final paddingWidgets = find.byType(Padding);
        expect(paddingWidgets, findsWidgets);

        // Check for right padding on upvote and downvote buttons
        bool foundUpvotePadding = false;
        bool foundDownvotePadding = false;
        bool foundDurationPadding = false;

        for (int i = 0; i < paddingWidgets.evaluate().length; i++) {
          final padding = tester.widget<Padding>(paddingWidgets.at(i));
          if (padding.padding == const EdgeInsets.only(right: 8.0)) {
            if (!foundUpvotePadding) {
              foundUpvotePadding = true;
            } else {
              foundDownvotePadding = true;
            }
          } else if (padding.padding ==
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)) {
            foundDurationPadding = true;
          }
        }

        expect(foundUpvotePadding, isTrue);
        expect(foundDownvotePadding, isTrue);
        expect(foundDurationPadding, isTrue);
      });

      testWidgets('should apply correct text styling to counts and duration',
          (tester) async {
        // Arrange
        final post = createTestPost(
          upvotesCount: 25,
          downvotesCount: 8,
          commentsCount: 12,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        final upvoteCountText = tester.widget<Text>(find.text('25'));
        final downvoteCountText = tester.widget<Text>(find.text('8'));
        final commentCountText = tester.widget<Text>(find.text('12'));

        // Verify counts have proper color
        expect(upvoteCountText.style?.color, isNotNull);
        expect(downvoteCountText.style?.color, isNotNull);
        expect(commentCountText.style?.color, isNotNull);

        // Verify duration text has proper styling
        final durationText = tester.widget<Text>(find.text('2 Hours Ago'));
        expect(durationText.style?.fontSize, equals(12));
      });

      testWidgets('should maintain proper layout with Spacer', (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byType(Spacer), findsOneWidget);

        final row = tester.widget<Row>(find.byType(Row));
        expect(row.crossAxisAlignment, equals(CrossAxisAlignment.start));
      });
    });

    group('Accessibility Tests', () {
      testWidgets(
          'should have proper semantic structure for interaction buttons',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byType(IconButton), findsNWidgets(3));

        // Verify buttons are accessible
        final iconButtons = find.byType(IconButton);
        expect(iconButtons, findsNWidgets(3));
      });

      testWidgets('should handle large counts without overflow',
          (tester) async {
        // Arrange
        final post = createTestPost(
          upvotesCount: 999999,
          downvotesCount: 888888,
          commentsCount: 777777,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('999999'), findsOneWidget);
        expect(find.text('888888'), findsOneWidget);
        expect(find.text('777777'), findsOneWidget);

        // Verify no overflow
        expect(tester.takeException(), isNull);
      });
    });

    group('Edge Cases Tests', () {
      testWidgets('should handle negative counts gracefully', (tester) async {
        // Arrange
        final post = createTestPost(
          upvotesCount: -1,
          downvotesCount: -2,
          commentsCount: -5,
        );

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('-1'), findsOneWidget);
        expect(find.text('-2'), findsOneWidget);
        expect(find.text('-5'), findsOneWidget);
      });

      testWidgets('should handle very large screen sizes', (tester) async {
        // Arrange
        final post = createTestPost();

        // Set a large screen size
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byType(Interactions), findsOneWidget);
        expect(tester.takeException(), isNull);

        // Reset the screen size
        addTearDown(tester.view.reset);
      });

      testWidgets('should handle very small screen sizes', (tester) async {
        // Arrange
        final post = createTestPost();

        // Set a small screen size
        tester.view.physicalSize = const Size(300, 400);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.byType(Interactions), findsOneWidget);
        // Note: Small screens may cause overflow, so we don't check for null exception

        // Reset the screen size
        addTearDown(tester.view.reset);
      });
    });

    group('Icon Size and Responsiveness Tests', () {
      testWidgets('should calculate correct icon sizes based on screen width',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Set specific screen size (392 is the base width in the calculation)
        tester.view.physicalSize = const Size(392, 800);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpInteractions(tester, post);

        // Assert
        final icons = find.byType(Icon);
        expect(icons, findsNWidgets(3));

        final upvoteIcon = tester.widget<Icon>(icons.first);

        // Expected icon size: (392 / 392) * 20 = 20
        expect(upvoteIcon.size, equals(20.0));

        // Reset the screen size
        addTearDown(tester.view.reset);
      });

      testWidgets('should scale icon sizes for different screen widths',
          (tester) async {
        // Arrange
        final post = createTestPost();

        // Set a different screen size
        tester.view.physicalSize =
            const Size(784, 800); // Double the base width
        tester.view.devicePixelRatio = 1.0;

        // Act
        await pumpInteractions(tester, post);

        // Assert
        final icons = find.byType(Icon);
        final upvoteIcon = tester.widget<Icon>(icons.first);

        // Expected icon size: (784 / 392) * 20 = 40
        expect(upvoteIcon.size, equals(40.0));

        // Reset the screen size
        addTearDown(tester.view.reset);
      });
    });

    group('Multiple Button Interaction Tests', () {
      testWidgets('should handle rapid tapping of different buttons',
          (tester) async {
        // Arrange
        final post = createTestPost();
        bool commentCallbackCalled = false;

        // Act
        await pumpInteractions(
          tester,
          post,
          redirectCallback: (post) {
            commentCallbackCalled = true;
          },
        );

        final upvoteButton = find.byIcon(Icons.thumb_up_outlined);
        final downvoteButton = find.byIcon(Icons.thumb_down_outlined);
        final commentButton = find.byIcon(Icons.comment_outlined);

        // Rapidly tap different buttons
        await tester.tap(upvoteButton);
        await tester.tap(downvoteButton);
        await tester.tap(commentButton);
        await tester.pump();

        // Assert - All buttons should be tappable
        expect(commentCallbackCalled, isTrue);
        expect(tester.takeException(), isNull);
      });

      testWidgets('should handle tapping filled vote buttons', (tester) async {
        // Arrange
        final post = createTestPost(
          hasVoted: true,
          voteType: VoteType.upVote,
          upvotesCount: 5,
        );

        // Act
        await pumpInteractions(tester, post);

        // Find and tap the filled upvote button
        final upvoteButton = find.byIcon(Icons.thumb_up);
        await tester.tap(upvoteButton);
        await tester.pump();

        // Assert - Button should be tappable
        expect(tester.takeException(), isNull);
      });
    });

    group('Post Duration Display Tests', () {
      testWidgets('should display "unknown date" when createdAt is null',
          (tester) async {
        // Arrange
        final post = createTestPost(setCreatedAtNull: true);

        // Act
        await pumpInteractions(tester, post);

        // Assert
        expect(find.text('unknown date'), findsOneWidget);
      });

      testWidgets('should display correct duration for different time periods',
          (tester) async {
        // Test seconds ago
        final secondsPost = createTestPost(
          createdAt: DateTime.now().subtract(const Duration(seconds: 30)),
        );
        await pumpInteractions(tester, secondsPost);
        expect(find.text('30 Seconds Ago'), findsOneWidget);
        await tester.pumpWidget(Container());

        // Test minutes ago
        final minutesPost = createTestPost(
          createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
        );
        await pumpInteractions(tester, minutesPost);
        expect(find.text('15 Minutes Ago'), findsOneWidget);
        await tester.pumpWidget(Container());

        // Test hours ago
        final hoursPost = createTestPost(
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        );
        await pumpInteractions(tester, hoursPost);
        expect(find.text('5 Hours Ago'), findsOneWidget);
        await tester.pumpWidget(Container());

        // Test days ago
        final daysPost = createTestPost(
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
        );
        await pumpInteractions(tester, daysPost);
        expect(find.text('10 Days Ago'), findsOneWidget);
        await tester.pumpWidget(Container());
      });
    });
  });
}
