import 'dart:async';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// InteractionsViewModel class helps to serve the data and to react to user's input for Post Interaction Widget.
///
///
/// Methods include:
/// * `toggleUpVotePost` - toggles upvote on a post
/// * `toggleDownVotePost` - toggles downvote on a post
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
      actionType: ActionType.critical,
      action: () async {
        await _postService.toggleUpVote(post);
        return null;
      },
      updateUI: () {
        final bool wasUpvoted =
            post.hasVoted == true && post.voteType == VoteType.upVote;
        final bool wasDownvoted =
            post.hasVoted == true && post.voteType == VoteType.downVote;

        if (wasUpvoted) {
          // Remove upvote
          post.upvotesCount = (post.upvotesCount ?? 0) - 1;
          post.hasVoted = false;
          post.voteType = VoteType.none;
        } else if (wasDownvoted) {
          // Change from downvote to upvote
          post.downvotesCount = (post.downvotesCount ?? 1) - 1;
          post.upvotesCount = (post.upvotesCount ?? 0) + 1;
          post.voteType = VoteType.upVote;
        } else {
          // Add Upvote
          post.upvotesCount = (post.upvotesCount ?? 0) + 1;
          post.hasVoted = true;
          post.voteType = VoteType.upVote;
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
      actionType: ActionType.critical,
      action: () async {
        await _postService.toggleDownVote(post);
        return null;
      },
      updateUI: () {
        final bool wasUpvoted =
            post.hasVoted == true && post.voteType == VoteType.upVote;
        final bool wasDownvoted =
            post.hasVoted == true && post.voteType == VoteType.downVote;

        if (wasDownvoted) {
          // Remove downvote
          post.downvotesCount = (post.downvotesCount ?? 1) - 1;
          post.hasVoted = false;
          post.voteType = VoteType.none;
        } else if (wasUpvoted) {
          // Change from upvote to downvote
          post.upvotesCount = (post.upvotesCount ?? 1) - 1;
          post.downvotesCount = (post.downvotesCount ?? 0) + 1;
          post.voteType = VoteType.downVote;
        } else {
          // Add downvote
          post.downvotesCount = (post.downvotesCount ?? 0) + 1;
          post.hasVoted = true;
          post.voteType = VoteType.downVote;
        }
        notifyListeners();
      },
    );
  }
}
