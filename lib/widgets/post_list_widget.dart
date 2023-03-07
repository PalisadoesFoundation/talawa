// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/post_widget.dart';

/// This class receives a List of all the Post widgets and returns a ListView.
class PostListWidget extends StatelessWidget {
  const PostListWidget({
    Key? key,
    required this.posts,
    this.function,
  }) : super(key: key);
  final List<Post> posts;
  final Function(Post)? function;

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
            NewsPost(
              post: posts[index],
              function: function,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                height: 8,
                thickness: 8,
              ),
            )
          ],
        );
      },
    );
  }
}
