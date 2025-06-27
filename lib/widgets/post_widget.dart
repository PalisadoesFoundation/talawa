import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/caption_text_widget.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/post_container.dart';
import 'package:talawa/widgets/post_modal.dart';

/// Stateless class to show the fetched post.
class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
    this.redirectToIndividualPage,
    this.deletePost,
  });

  /// Post object containing all the data related to the post.
  final Post post;

  /// This function is passed for the handling the action to be performed when the comment button is clicked.
  final Function(Post)? redirectToIndividualPage;

  /// To delete the post if user can (only work if the post is made by the user).
  final Function(Post)? deletePost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CustomAvatar(
                isImageNull: post.creator?.image == null,
                firstAlphabet:
                    post.creator?.firstName?.substring(0, 1).toUpperCase(),
                imageUrl: post.creator?.image,
                fontSize: 20,
              ),
              title: Text(
                "${post.creator?.firstName} ${post.creator?.lastName}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              trailing: IconButton(
                key: const Key('reportButton'),
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context1) => Container(
                    key: const Key('reportPost'),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: PostBottomModal(
                      post: post,
                      deletePost: deletePost,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.report_gmailerrorred_outlined,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            GestureDetector(
              /// showing caption if attachments are not present.
              child: post.attachments != null && post.attachments!.isNotEmpty
                  ? PostContainer(fileAttachmentList: post.attachments)
                  : CaptionTextWidget(caption: post.caption ?? ''),
              onTap: () => redirectToIndividualPage?.call(post),
            ),
            Column(
              children: [
                Interactions(
                    post: post,
                    redirectToIndividualPage: redirectToIndividualPage),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// showing caption if attachments are present.
                    if (post.attachments != null &&
                        post.attachments!.isNotEmpty)
                      CaptionTextWidget(caption: post.caption ?? ''),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
  final Function(Post p1)? redirectToIndividualPage;

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
