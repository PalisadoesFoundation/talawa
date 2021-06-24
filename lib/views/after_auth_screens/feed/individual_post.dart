import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/post_widget.dart';

class IndividualPostView extends StatelessWidget {
  const IndividualPostView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      AppLocalizations.of(context)!.strictTranslate(text),
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}

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
  final List<Comments> comments;

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

  final Comments comment;

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
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  AppLocalizations.of(context)!
                      .strictTranslate("FirstName LastName"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Text(
                comment.sId!,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ))
      ],
    );
  }
}

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
