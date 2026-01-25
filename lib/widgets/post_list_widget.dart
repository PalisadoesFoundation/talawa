import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/post_widget.dart';

/// This class receives a List of all the Post widgets and returns a ListView.
class PostListWidget extends StatelessWidget {
  const PostListWidget({
    super.key,
    required this.posts,
<<<<<<< HEAD
    this.function,
=======
    this.redirectToIndividualPage,
>>>>>>> upstream/develop
    this.deletePost,
  });

  /// list of all the post.
  final List<Post> posts;

<<<<<<< HEAD
  /// This function is passed for the handling the action to be performed when the comment button is clicked.
  final Function(Post)? function;

  /// Function the deleting the post.
  final Function(Post)? deletePost;

=======
  /// Function the deleting the post.
  final Function(Post)? deletePost;

  /// This function will be used to redirect to the Individual Post.
  final Function(Post)? redirectToIndividualPage;

>>>>>>> upstream/develop
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
<<<<<<< HEAD
            NewsPost(
              key: ValueKey(posts[index].sId),
              post: posts[index],
              function: function,
=======
            PostWidget(
              key: ValueKey(posts[index].id),
              post: posts[index],
              redirectToIndividualPage: redirectToIndividualPage,
>>>>>>> upstream/develop
              deletePost: deletePost,
            ),
          ],
        );
      },
    );
  }
}
