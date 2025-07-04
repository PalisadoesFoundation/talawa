import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/post_widget.dart';

/// This class receives a List of all the Post widgets and returns a ListView.
class PostListWidget extends StatelessWidget {
  const PostListWidget({
    super.key,
    required this.posts,
    this.redirectToIndividualPage,
    this.deletePost,
  });

  /// list of all the post.
  final List<Post> posts;

  /// Function the deleting the post.
  final Function(Post)? deletePost;

  /// This function will be used to redirect to the Individual Post.
  final Function(Post)? redirectToIndividualPage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            PostWidget(
              key: ValueKey(posts[index].id),
              post: posts[index],
              redirectToIndividualPage: redirectToIndividualPage,
              deletePost: deletePost,
            ),
          ],
        );
      },
    );
  }
}
