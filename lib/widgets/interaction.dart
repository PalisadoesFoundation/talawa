import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// Widget to interact with post e.g upvote, downvote, comments.
class Interactions extends StatelessWidget {
  const Interactions({
    super.key,
    required this.post,
    required this.redirectToIndividualPage,
  });

  /// Details of post.
  final Post post;

  /// Function to redirect to individual Page.
  final Function(Post p)? redirectToIndividualPage;

  @override
  Widget build(BuildContext context) {
    // Calculate sizes based on screen width for responsive design
    final double buttonHeight = (MediaQuery.sizeOf(context).width / 392) * 35;
    final double buttonWidth = (MediaQuery.sizeOf(context).width / 392) * 35;
    final double iconSize = (MediaQuery.sizeOf(context).width / 392) * 20;

    return BaseView<InteractionsViewModel>(
      builder: (context, model, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upvote button
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: buttonHeight,
                  width: buttonWidth,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: post.hasVoted == true &&
                            post.voteType == VoteType.upVote
                        ? Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                            size: iconSize,
                          )
                        : Icon(
                            Icons.thumb_up_outlined,
                            size: iconSize,
                          ),
                    onPressed: () => model.toggleUpVotePost(post),
                  ),
                ),
                Text(
                  "${post.upvotesCount ?? 0}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Downvote button
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: buttonHeight,
                  width: buttonWidth,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: post.hasVoted == true &&
                            post.voteType == VoteType.downVote
                        ? Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                            size: iconSize,
                          )
                        : Icon(
                            Icons.thumb_down_outlined,
                            size: iconSize,
                          ),
                    onPressed: () => model.toggleDownVotePost(post),
                  ),
                ),
                Text(
                  "${post.downvotesCount ?? 0}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Comments button
          Column(
            children: [
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.comment_outlined,
                    size: iconSize,
                  ),
                  onPressed: () => redirectToIndividualPage?.call(post),
                ),
              ),
              Text(
                "${post.commentsCount ?? 0}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Post created duration
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              post.getPostCreatedDuration(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
