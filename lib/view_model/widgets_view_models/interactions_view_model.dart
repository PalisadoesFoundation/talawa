import 'dart:async';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// LikeButtonViewModel class helps to serve the data and to react to user's input for Like Button Widget.
///
///
/// Methods include:
/// * `initialize` - initializes the ViewModel with the Post ID.
/// * `updatePost` - updates the Post data when it is changed.
/// * `dispose` - cleans up the resources used by the ViewModel.
class InteractionsViewModel extends BaseModel {
  // Services
  final _postService = locator<PostService>();

  /// This function is used to toggle user upvote on post.
  ///
  /// **params**:
  /// * `post`: Post to interact with.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleUpVotePost(Post post) async {
    await actionHandlerService.performAction(
      actionType: ActionType.optimistic,
      action: () async {
        await _postService.toggleUpVote(post);
        return null;
      },
      updateUI: () {
        final bool wasUpvoted =
            post.hasVoted == true && post.voteType == 'up_vote';
        final bool wasDownvoted =
            post.hasVoted == true && post.voteType == 'down_vote';

        if (wasDownvoted) {
          // Change from downvote to upvote
          post.downvotesCount = (post.downvotesCount ?? 1) - 1;
          post.upvotesCount = (post.upvotesCount ?? 0) + 1;
          post.voteType = 'up_vote';
        } else if (!wasUpvoted && !wasDownvoted) {
          // Add upvote
          post.upvotesCount = (post.upvotesCount ?? 0) + 1;
          post.hasVoted = true;
          post.voteType = 'up_vote';
        }
        notifyListeners();
      },
    );
  }

  /// This function is used to toggle user downvote on post.
  ///
  /// **params**:
  /// * `post`: Post to interact with.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleDownVotePost(Post post) async {
    await actionHandlerService.performAction(
      actionType: ActionType.optimistic,
      action: () async {
        await _postService.toggleDownVote(post);
        return null;
      },
      updateUI: () {
        final bool wasUpvoted =
            post.hasVoted == true && post.voteType == 'up_vote';
        final bool wasDownvoted =
            post.hasVoted == true && post.voteType == 'down_vote';

        if (wasUpvoted) {
          // Change from upvote to downvote
          post.upvotesCount = (post.upvotesCount ?? 1) - 1;
          post.downvotesCount = (post.downvotesCount ?? 0) + 1;
          post.voteType = 'down_vote';
        } else if (!wasDownvoted && !wasUpvoted) {
          // Add downvote
          post.downvotesCount = (post.downvotesCount ?? 0) + 1;
          post.hasVoted = true;
          post.voteType = 'down_vote';
        }
        notifyListeners();
      },
    );
  }
}
