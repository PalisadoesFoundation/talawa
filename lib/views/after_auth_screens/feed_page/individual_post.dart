import 'package:flutter/material.dart';
import 'package:talawa/color_pallete.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_model.dart';
import 'package:talawa/widgets/post_widget.dart';

class InividualPostView extends StatelessWidget {
  const InividualPostView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          NewsPost(
            post: post,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IndividualPageLikeSection(
                  usersLiked: post.likedBy!,
                ),
                IndividualPostCommentSection(comments: post.comments!)
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
      text,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}

class IndividualPageLikeSection extends StatelessWidget {
  const IndividualPageLikeSection({
    Key? key,
    required this.usersLiked,
  }) : super(key: key);

  final List<User> usersLiked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPadding(context, "Liked by"),
        Row(
          children: [
            for (int i = 0; i < usersLiked.length; i++)
              likedUserCircleAvatar(usersLiked[i])
          ],
        ),
      ],
    );
  }
}

class IndividualPostCommentSection extends StatelessWidget {
  const IndividualPostCommentSection({Key? key, required this.comments})
      : super(key: key);
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPadding(context, "Comments"),
        for (int i = 0; i < comments.length; i++)
          CommentTemplate(comment: comments[i])
      ],
    );
  }
}

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
          decoration: const BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                    "${comment.creator!.firstName} ${comment.creator!.lastName}"),
              ),
              Text(
                comment.text!,
                style: TextStyle(
                    fontSize: 16,
                    color: talawaGrey,
                    fontFamily: "open-sans",
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

Widget likedUserCircleAvatar(User user) {
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
