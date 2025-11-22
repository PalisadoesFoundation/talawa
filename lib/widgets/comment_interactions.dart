import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
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
    // Calculate sizes based on screen width for responsive design
    final double iconSize = (MediaQuery.sizeOf(context).width / 392) * 16;
    final double buttonWidth = (MediaQuery.sizeOf(context).width / 392) * 30;
    final double buttonHeight = (MediaQuery.sizeOf(context).width / 392) * 30;

    return BaseView<CommentInteractionsViewModel>(
      builder: (context, model, child) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Upvote button
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Column(
              children: [
                SizedBox(
                  height: buttonHeight,
                  width: buttonWidth,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: comment.hasVoted == true &&
                            comment.voteType == VoteType.upVote
                        ? Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                            size: iconSize,
                          )
                        : Icon(
                            Icons.thumb_up_outlined,
                            size: iconSize,
                          ),
                    onPressed: () => model.toggleUpVoteComment(comment),
                  ),
                ),
                Text(
                  "${comment.upvotesCount ?? 0}",
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Downvote button
          Column(
            children: [
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: comment.hasVoted == true &&
                          comment.voteType == VoteType.downVote
                      ? Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                          size: iconSize,
                        )
                      : Icon(
                          Icons.thumb_down_outlined,
                          size: iconSize,
                        ),
                  onPressed: () => model.toggleDownVoteComment(comment),
                ),
              ),
              Text(
                "${comment.downvotesCount ?? 0}",
                style: TextStyle(
                  fontSize: 11,
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
