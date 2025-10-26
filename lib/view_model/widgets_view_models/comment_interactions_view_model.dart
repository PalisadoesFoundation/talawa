import 'dart:async';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// CommentInteractionsViewModel class helps to serve the data and to react to user's input for Comment Voting Widget.
///
/// Methods include:
/// * `toggleUpVoteComment` - toggles upvote on a comment
/// * `toggleDownVoteComment` - toggles downvote on a comment
class CommentInteractionsViewModel extends BaseModel {
  // Services
  final _commentService = locator<CommentService>();

  /// This function is used to toggle user upvote on comment.
  ///
  /// **params**:
  /// * `comment`: Comment to interact with.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleUpVoteComment(Comment comment) async {
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      action: () async {
        await _commentService.toggleUpVoteComment(
          comment.id!,
          comment.voteType,
          comment.hasVoted ?? false,
        );
        return null;
      },
      updateUI: () {
        final bool wasUpvoted =
            comment.hasVoted == true && comment.voteType == VoteType.upVote;
        final bool wasDownvoted =
            comment.hasVoted == true && comment.voteType == VoteType.downVote;

        if (wasUpvoted) {
          // Remove upvote
          comment.upvotesCount = (comment.upvotesCount ?? 0) - 1;
          comment.hasVoted = false;
          comment.voteType = VoteType.none;
        } else if (wasDownvoted) {
          // Change from downvote to upvote
          comment.downvotesCount = (comment.downvotesCount ?? 0) - 1;
          comment.upvotesCount = (comment.upvotesCount ?? 0) + 1;
          comment.voteType = VoteType.upVote;
        } else {
          // Add upvote
          comment.upvotesCount = (comment.upvotesCount ?? 0) + 1;
          comment.hasVoted = true;
          comment.voteType = VoteType.upVote;
        }
        notifyListeners();
      },
    );
  }

  /// This function is used to toggle user downvote on comment.
  ///
  /// **params**:
  /// * `comment`: Comment to interact with.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleDownVoteComment(Comment comment) async {
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      action: () async {
        await _commentService.toggleDownVoteComment(
          comment.id!,
          comment.voteType,
          comment.hasVoted ?? false,
        );
        return null;
      },
      updateUI: () {
        final bool wasUpvoted =
            comment.hasVoted == true && comment.voteType == VoteType.upVote;
        final bool wasDownvoted =
            comment.hasVoted == true && comment.voteType == VoteType.downVote;

        if (wasDownvoted) {
          comment.downvotesCount = (comment.downvotesCount ?? 0) - 1;
          comment.hasVoted = false;
          comment.voteType = VoteType.none;
        } else if (wasUpvoted) {
          // Change from upvote to downvote
          comment.upvotesCount = (comment.upvotesCount ?? 1) - 1;
          comment.downvotesCount = (comment.downvotesCount ?? 0) + 1;
          comment.voteType = VoteType.downVote;
        } else {
          // Add downvote
          comment.downvotesCount = (comment.downvotesCount ?? 0) + 1;
          comment.hasVoted = true;
          comment.voteType = VoteType.downVote;
        }
        notifyListeners();
      },
    );
  }
}
