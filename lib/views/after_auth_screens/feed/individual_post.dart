import 'package:flutter/material.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/post_widget.dart';

/// IndividualPostView returns a widget that has mutable state _IndividualPostViewState.
class IndividualPostView extends StatefulWidget {
  const IndividualPostView({super.key, required this.post});

  /// Individual Post.
  final Post post;

  @override
  _IndividualPostViewState createState() => _IndividualPostViewState();
}

class _IndividualPostViewState extends State<IndividualPostView> {
  final TextEditingController _controller = TextEditingController();
  bool _isCommentValid = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsViewModel>(onModelReady: (model) async {
      await model.initialise(widget.post.id!);
    }, builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        bottomSheet: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  key: const Key('indi_post_tf_key'),
                  controller: _controller,
                  textInputAction: TextInputAction.send,
                  onChanged: (msg) {
                    if (msg.isEmpty && _isCommentValid == true) {
                      setState(() {
                        _isCommentValid = false;
                      });
                    }
                    if (msg.isEmpty == false && _isCommentValid == false) {
                      setState(() {
                        _isCommentValid = true;
                      });
                    }
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.strictTranslate(
                      "Write your comment here..",
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    focusColor: Colors.black,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              // Button to send the comment.
              TextButton(
                key: const Key('sendButton'),
                style: _isCommentValid == false
                    ? ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                      )
                    : null,
                //check if button is enabled when comment is valid
                onPressed: _isCommentValid
                    ? () {
                        model.createComment(_controller.text);
                        _controller.text = "";

                        setState(() {
                          _isCommentValid = false;
                        });
                      }
                    : null,
                child: Text(
                  AppLocalizations.of(context)!.strictTranslate(
                    "Send",
                  ),
                  style: !_isCommentValid
                      ? const TextStyle(color: Colors.grey)
                      : null,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            // Post
            PostWidget(
              post: widget.post,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenHeight! * 0.010,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // renders the number of users commented on the post.
                  IndividualPostCommentSection(
                      postID: widget.post.id!, model: model),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

/// Widget representing the comment section of an individual post.
///
/// The `IndividualPostCommentSection` widget displays a list of comments on a post.
class IndividualPostCommentSection extends StatelessWidget {
  const IndividualPostCommentSection({
    super.key,
    // required this.comments,
    required this.postID,
    required this.model,
  });

  // /// List of comments on a post.

  /// ID of a post with associated comments.
  final String postID;

  /// Instance of CommentsViewModel to manage comments.
  final CommentsViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.006),
          child: Text(
            AppLocalizations.of(context)!.strictTranslate("Comments"),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        // Looping through the commentList list,
        for (int i = 0; i < model.commentList.length; i++)
          // renders the custom widget for invidual user.
          CommentTemplate(comment: model.commentList[i]),
        if (model.hasNextPage)
          TextButton(
            onPressed: () => model.fetchNextPage(),
            child: const Text('Load More....'),
          ),
      ],
    );
  }
}

/// CommentTemplate returns a widget of the individual user commented on the post.
class CommentTemplate extends StatelessWidget {
  const CommentTemplate({
    super.key,
    required this.comment,
  });

  /// Instance of comment.
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAvatar(
          isImageNull: comment.creator?.image == null,
          firstAlphabet:
              comment.creator?.firstName?.substring(0, 1).toUpperCase(),
          imageUrl: comment.creator?.image,
          fontSize: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .iconTheme
                  .color!
                  .withAlpha((0.2 * 255).toInt()),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "${comment.creator?.firstName} ${comment.creator?.lastName}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text(
                  comment.body ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
