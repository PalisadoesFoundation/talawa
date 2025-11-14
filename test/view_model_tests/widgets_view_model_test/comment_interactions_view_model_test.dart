import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/view_model/widgets_view_models/comment_interactions_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late CommentInteractionsViewModel viewModel;
  late MockActionHandlerService mockActionHandlerService;

  setUp(() {
    // Register basic services from test helpers (without ActionHandlerService)
    registerServices();

    // Register our local ActionHandlerService mock specifically for this test
    mockActionHandlerService = getAndRegisterLocalActionHandlerService();

    viewModel = CommentInteractionsViewModel();

    // Reset mocks and set up behavior
    reset(mockActionHandlerService);

    // Set up the mock to execute both action and updateUI callbacks
    when(
      mockActionHandlerService.performAction(
        actionType: anyNamed('actionType'),
        action: anyNamed('action'),
        updateUI: anyNamed('updateUI'),
      ),
    ).thenAnswer((invocation) async {
      // Execute the action callback first
      final action = invocation.namedArguments[const Symbol('action')]
          as Future<dynamic> Function();
      await action();

      // Then execute the updateUI callback
      final updateUI = invocation.namedArguments[const Symbol('updateUI')]
          as void Function()?;
      updateUI?.call();
    });
  });

  tearDown(() {
    // Clean up our specific ActionHandlerService registration
    if (locator.isRegistered<ActionHandlerService>()) {
      locator.unregister<ActionHandlerService>();
    }

    // Clean up general services
    unregisterServices();
  });
  group('CommentInteractionsViewModel Tests', () {
    group('toggleUpVoteComment', () {
      test('should add upvote when comment has no vote', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 6);
        expect(comment.downvotesCount, 3);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });

      test('should remove upvote when comment is already upvoted', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 4);
        expect(comment.downvotesCount, 3);
        expect(comment.hasVoted, false);
        expect(comment.voteType, VoteType.none);
      });

      test('should change from downvote to upvote', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.downVote,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 6);
        expect(comment.downvotesCount, 2);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });

      test('should handle null vote counts gracefully', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: null,
          downvotesCount: null,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 1);
        expect(comment.downvotesCount, null);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });

      test('should handle null hasVoted field', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 6);
        expect(comment.downvotesCount, 3);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });
    });

    group('toggleDownVoteComment', () {
      test('should add downvote when comment has no vote', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 5);
        expect(comment.downvotesCount, 4);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.downVote);
      });

      test('should remove downvote when comment is already downvoted',
          () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.downVote,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 5);
        expect(comment.downvotesCount, 2);
        expect(comment.hasVoted, false);
        expect(comment.voteType, VoteType.none);
      });

      test('should change from upvote to downvote', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 4);
        expect(comment.downvotesCount, 4);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.downVote);
      });

      test('should handle null vote counts gracefully', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: null,
          downvotesCount: null,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, null);
        expect(comment.downvotesCount, 1);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.downVote);
      });

      test('should handle null hasVoted field', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 5);
        expect(comment.downvotesCount, 4);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.downVote);
      });

      test(
          'should handle edge case of upvote count being 1 when changing to downvote',
          () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 1,
          downvotesCount: 0,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 0);
        expect(comment.downvotesCount, 1);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.downVote);
      });
    });

    group('UI State Notifications', () {
      test('should notify listeners when upvoting', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        bool listenerCalled = false;
        viewModel.addListener(() {
          listenerCalled = true;
        });

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(listenerCalled, true);
      });

      test('should notify listeners when downvoting', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        bool listenerCalled = false;
        viewModel.addListener(() {
          listenerCalled = true;
        });

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert
        expect(listenerCalled, true);
      });

      test('should notify listeners when removing votes', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        bool listenerCalled = false;
        viewModel.addListener(() {
          listenerCalled = true;
        });

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(listenerCalled, true);
      });
    });

    group('Service Integration', () {
      test('should work with ActionHandlerService for upvote', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert - Service integration is working (updateUI was called)
        expect(comment.upvotesCount, 6);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });

      test('should work with ActionHandlerService for downvote', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVoteComment(comment);

        // Assert - Service integration is working (updateUI was called)
        expect(comment.downvotesCount, 4);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.downVote);
      });
    });

    group('Edge Cases and Error Handling', () {
      test('should handle comment with zero votes', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 0,
          downvotesCount: 0,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert
        expect(comment.upvotesCount, 1);
        expect(comment.downvotesCount, 0);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });

      test('should handle multiple rapid vote changes', () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act - Multiple rapid changes
        // Step 1: Add upvote (5->6 upvotes, hasVoted=true, voteType=upVote)
        await viewModel.toggleUpVoteComment(comment);
        // Step 2: Change to downvote (6->5 upvotes, 3->4 downvotes, voteType=downVote)
        await viewModel.toggleDownVoteComment(comment);
        // Step 3: Change back to upvote (5->6 upvotes, 4->3 downvotes, voteType=upVote)
        await viewModel.toggleUpVoteComment(comment);

        // Assert - Final state should be upvoted
        expect(comment.upvotesCount, 6);
        expect(comment.downvotesCount, 3);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });

      test('should preserve comment data integrity during vote operations',
          () async {
        // Arrange
        final comment = Comment(
          id: 'comment1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVoteComment(comment);

        // Assert - Other properties should remain unchanged
        expect(comment.id, 'comment1');
        expect(comment.upvotesCount, 6);
        expect(comment.hasVoted, true);
        expect(comment.voteType, VoteType.upVote);
      });
    });
  });
}
