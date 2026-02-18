import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late InteractionsViewModel viewModel;
  late MockActionHandlerService mockActionHandlerService;
  setUp(() {
    // Register basic services from test helpers (without ActionHandlerService)
    registerServices();

    // Register our local ActionHandlerService mock specifically for this test
    mockActionHandlerService = getAndRegisterLocalActionHandlerService();

    viewModel = InteractionsViewModel();

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
  group('InteractionsViewModel Tests', () {
    group('toggleUpVotePost', () {
      test('should add upvote when post has no vote', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(post.upvotesCount, 6);
        expect(post.downvotesCount, 3);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });

      test('should remove upvote when post is already upvoted', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(post.upvotesCount, 4);
        expect(post.downvotesCount, 3);
        expect(post.hasVoted, false);
        expect(post.voteType, VoteType.none);
      });

      test('should change from downvote to upvote', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.downVote,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(post.upvotesCount, 6);
        expect(post.downvotesCount, 2);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });

      test('should handle null vote counts gracefully', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: null,
          downvotesCount: null,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(post.upvotesCount, 1);
        expect(post.downvotesCount, null);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });

      test('should handle null hasVoted field', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(post.upvotesCount, 6);
        expect(post.downvotesCount, 3);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });
    });

    group('toggleDownVotePost', () {
      test('should add downvote when post has no vote', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(post.upvotesCount, 5);
        expect(post.downvotesCount, 4);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.downVote);
      });

      test('should remove downvote when post is already downvoted', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.downVote,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(post.upvotesCount, 5);
        expect(post.downvotesCount, 2);
        expect(post.hasVoted, false);
        expect(post.voteType, VoteType.none);
      });

      test('should change from upvote to downvote', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(post.upvotesCount, 4);
        expect(post.downvotesCount, 4);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.downVote);
      });

      test('should handle null vote counts gracefully', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: null,
          downvotesCount: null,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(post.upvotesCount, null);
        expect(post.downvotesCount, 1);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.downVote);
      });

      test('should handle null hasVoted field', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: null,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(post.upvotesCount, 5);
        expect(post.downvotesCount, 4);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.downVote);
      });

      test(
          'should handle edge case of upvote count being 1 when changing to downvote',
          () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 1,
          downvotesCount: 0,
          hasVoted: true,
          voteType: VoteType.upVote,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(post.upvotesCount, 0);
        expect(post.downvotesCount, 1);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.downVote);
      });
    });

    group('UI State Notifications', () {
      test('should notify listeners when upvoting', () async {
        // Arrange
        final post = Post(
          id: 'post1',
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
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(listenerCalled, true);
      });

      test('should notify listeners when downvoting', () async {
        // Arrange
        final post = Post(
          id: 'post1',
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
        await viewModel.toggleDownVotePost(post);

        // Assert
        expect(listenerCalled, true);
      });

      test('should notify listeners when removing votes', () async {
        // Arrange
        final post = Post(
          id: 'post1',
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
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(listenerCalled, true);
      });
    });

    group('Service Integration', () {
      test('should work with ActionHandlerService for upvote', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert - Service integration is working (updateUI was called)
        expect(post.upvotesCount, 6);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });

      test('should work with ActionHandlerService for downvote', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleDownVotePost(post);

        // Assert - Service integration is working (updateUI was called)
        expect(post.downvotesCount, 4);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.downVote);
      });
    });

    group('Edge Cases and Error Handling', () {
      test('should handle post with zero votes', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 0,
          downvotesCount: 0,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert
        expect(post.upvotesCount, 1);
        expect(post.downvotesCount, 0);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });

      test('should handle multiple rapid vote changes', () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act - Multiple rapid changes
        // Step 1: Add upvote (5->6 upvotes, hasVoted=true, voteType=upVote)
        await viewModel.toggleUpVotePost(post);
        // Step 2: Change to downvote (6->5 upvotes, 3->4 downvotes, voteType=downVote)
        await viewModel.toggleDownVotePost(post);
        // Step 3: Change back to upvote (5->6 upvotes, 4->3 downvotes, voteType=upVote)
        await viewModel.toggleUpVotePost(post);

        // Assert - Final state should be upvoted
        expect(post.upvotesCount, 6);
        expect(post.downvotesCount, 3);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });

      test('should preserve post data integrity during vote operations',
          () async {
        // Arrange
        final post = Post(
          id: 'post1',
          upvotesCount: 5,
          downvotesCount: 3,
          hasVoted: false,
          voteType: VoteType.none,
        );

        // Act
        await viewModel.toggleUpVotePost(post);

        // Assert - Other properties should remain unchanged
        expect(post.id, 'post1');
        expect(post.upvotesCount, 6);
        expect(post.hasVoted, true);
        expect(post.voteType, VoteType.upVote);
      });
    });
  });
}
