import 'package:flutter/material.dart';
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
    return BaseView<InteractionsViewModel>(
      onModelReady: (model) {
        model.initialize(post.id);
      },
      builder: (context, model, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Column(
            children: [
              SizedBox(
                height: (MediaQuery.sizeOf(context).width / 392) * 35,
                width: (MediaQuery.sizeOf(context).width / 392) * 35,
                child: IconButton(
                  icon: const Icon(
                    Icons.thumb_up_outlined,
                  ),
                  onPressed: () {},
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
          Column(
            children: [
              SizedBox(
                height: (MediaQuery.sizeOf(context).width / 392) * 35,
                width: (MediaQuery.sizeOf(context).width / 392) * 35,
                child: IconButton(
                  icon: const Icon(Icons.thumb_down_outlined),
                  onPressed: () {},
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
          Column(
            children: [
              SizedBox(
                height: (MediaQuery.sizeOf(context).width / 392) * 35,
                width: (MediaQuery.sizeOf(context).width / 392) * 35,
                child: IconButton(
                  icon: const Icon(Icons.comment_outlined),
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
