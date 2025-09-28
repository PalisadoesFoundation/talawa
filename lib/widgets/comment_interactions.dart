import 'package:flutter/material.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/view_model/widgets_view_models/comment_interactions_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// Widget to interact with comment e.g upvote, downvote.
class CommentInteractions extends StatelessWidget {
  const CommentInteractions({
    super.key,
    required this.comment,
  });

  /// Details of comment.
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentInteractionsViewModel>(
      builder: (context, model, child) => Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon:
                      comment.hasVoted == true && comment.voteType == 'up_vote'
                          ? const Icon(
                              Icons.thumb_up,
                              color: Colors.blue,
                              size: 16,
                            )
                          : const Icon(
                              Icons.thumb_up_outlined,
                              size: 16,
                            ),
                  onPressed: () => model.toggleUpVoteComment(comment),
                ),
              ),
              Text(
                "${comment.upvotesCount ?? 0}",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: comment.hasVoted == true &&
                          comment.voteType == 'down_vote'
                      ? const Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                          size: 16,
                        )
                      : const Icon(
                          Icons.thumb_down_outlined,
                          size: 16,
                        ),
                  onPressed: () => model.toggleDownVoteComment(comment),
                ),
              ),
              Text(
                "${comment.downvotesCount ?? 0}",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
