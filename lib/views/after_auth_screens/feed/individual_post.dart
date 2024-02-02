import 'package:flutter/material.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_widget.dart';

// Global State, should be removed in next few iterations

/// Comment view model.
late CommentsViewModel _commentViewModel;

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
              // TextField to send the comment on the post.
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
                          MaterialStateProperty.all(Colors.transparent),
                    )
                  : null,
              //check if button is enabled when comment is valid
              onPressed: _isCommentValid
                  ? () {
                      _commentViewModel.createComment(_controller.text);
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
          NewsPost(
            post: widget.post,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenHeight! * 0.010,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // renders the number of users liked the post.
                IndividualPageLikeSection(
                  usersLiked: widget.post.likedBy!,
                ),
                // renders the number of users commented on the post.
                IndividualPostCommentSection(
                  comments: widget.post.comments!,
                  postID: widget.post.sId,
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Generates a `Padding` widget with customizable vertical padding around a text element.
///
/// **params**:
/// * `context`: The build context in which the padding method is called.
/// * `text`: The text on which padding should be applied.
///
/// **returns**:
/// * `Padding`: Padding widget with vertical padding applied to the provided text.
Padding buildPadding(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.006),
    child: Text(
      AppLocalizations.of(context)!.strictTranslate(text),
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

/// IndividualPageLikeSection returns a widget that show the list of all the users liked the post.
class IndividualPageLikeSection extends StatelessWidget {
  const IndividualPageLikeSection({
    super.key,
    required this.usersLiked,
  });

  /// Represents a list of users who have liked a post.
  final List<LikedBy> usersLiked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPadding(
          context,
          AppLocalizations.of(context)!.strictTranslate(
            "Liked by",
          ),
        ),
        Row(
          children: [
            // Looping through the usersLiked list,
            for (int i = 0; i < usersLiked.length; i++)
              // renders the custom widget for invidual user.
              likedUserCircleAvatar(usersLiked[i]),
          ],
        ),
      ],
    );
  }
}

/// Widget representing the comment section of an individual post.
///
/// The `IndividualPostCommentSection` widget displays a list of comments on a post.
class IndividualPostCommentSection extends StatelessWidget {
  const IndividualPostCommentSection({
    super.key,
    required this.comments,
    required this.postID,
  });

  /// List of comments on a post.
  final List<Comments> comments;

  /// ID of a post with associated comments.
  final String postID;

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsViewModel>(
      onModelReady: (model) async {
        await model.initialise(postID);
        // print(model.commentList.first.creator);
        _commentViewModel = model;
      },
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPadding(context, "Comments"),
          // Looping through the commentList list,
          for (int i = 0; i < model.commentList.length; i++)
            // renders the custom widget for invidual user.
            CommentTemplate(comment: model.commentList[i]),
        ],
      ),
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
        const CircleAvatar(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).iconTheme.color!.withOpacity(0.2),
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
                    "${comment.creator!.firstName!} ${comment.creator!.lastName!}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text(
                  comment.text!,
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

/// Generates a Circle Avatar representing a user who liked the post.
///
/// **params**:
/// * `user`: The user who liked the post, represented by the `LikedBy` class.
///
/// **returns**:
/// * `Widget`: Circle Avatar of the user who liked the post.
Widget likedUserCircleAvatar(LikedBy user) {
  return const Padding(
    padding: EdgeInsets.only(right: 10.0, bottom: 16.0),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xfff2f2f2),
          radius: 20,
        ),
        Positioned(
          top: 30,
          right: 0,
          bottom: 20,
          left: 20,
          child: Icon(
            Icons.thumb_up,
            color: Colors.blue,
            size: 20,
          ),
        ),
      ],
    ),
  );
}
