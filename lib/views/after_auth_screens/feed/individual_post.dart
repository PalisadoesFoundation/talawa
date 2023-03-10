// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_widget.dart';

// Global State, should be removed in next few iterations
late CommentsViewModel _commentViewModel;

/// IndividualPostView returns a widget that has mutable state _IndividualPostViewState.
class IndividualPostView extends StatefulWidget {
  const IndividualPostView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _IndividualPostViewState createState() => _IndividualPostViewState();
}

/// _IndividualPostViewState returns a widget to show Individual Post View state. This widget
/// includes to send the  comment on the post, shows list of all users liked and commented on the post.
class _IndividualPostViewState extends State<IndividualPostView> {
  final TextEditingController _controller = TextEditingController();

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
                onSubmitted: (msg) {
                  _commentViewModel.createComment(msg);
                  _controller.text = "";
                },
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  hintText: "Write your comment here..",
                  contentPadding: EdgeInsets.all(8.0),
                  focusColor: Colors.black,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            // Button to send the comment.
            TextButton(
              onPressed: () {
                _commentViewModel.createComment(_controller.text);
                _controller.text = "";
              },
              child: const Text("Send"),
            )
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Padding buildPadding(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      AppLocalizations.of(context)!.strictTranslate(text),
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

/// IndividualPageLikeSection returns a widget that show the list of all the users liked the post.
class IndividualPageLikeSection extends StatelessWidget {
  const IndividualPageLikeSection({
    Key? key,
    required this.usersLiked,
  }) : super(key: key);

  final List<LikedBy> usersLiked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPadding(context, "Liked by"),
        Row(
          children: [
            // Looping through the usersLiked list,
            for (int i = 0; i < usersLiked.length; i++)
              // renders the custom widget for invidual user.
              likedUserCircleAvatar(usersLiked[i])
          ],
        ),
      ],
    );
  }
}

/// IndividualPostCommentSection returns a widget that show the list of all the users commented on the post.
class IndividualPostCommentSection extends StatelessWidget {
  const IndividualPostCommentSection({
    Key? key,
    required this.comments,
    required this.postID,
  }) : super(key: key);
  final List<Comments> comments;
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
            CommentTemplate(comment: model.commentList[i])
        ],
      ),
    );
  }
}

/// CommentTemplate returns a widget of the individual user commented on the post.
class CommentTemplate extends StatelessWidget {
  const CommentTemplate({
    Key? key,
    required this.comment,
  }) : super(key: key);

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
        )
      ],
    );
  }
}

/// likedUserCircleAvatar returns a widget of the individual user liked the post.
Widget likedUserCircleAvatar(LikedBy user) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, bottom: 16.0),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xfff2f2f2),
          radius: 20,
        ),
        const Positioned(
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
