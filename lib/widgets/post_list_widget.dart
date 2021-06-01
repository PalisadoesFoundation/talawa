import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/post_widget.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({
    Key? key,
    required this.posts,
    this.function,
  }) : super(key: key);
  final List<Post> posts;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < posts.length; i++)
          Column(
            children: [
              NewsPost(
                post: posts[i],
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
          )
      ],
    );
  }
}
