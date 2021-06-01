import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/post_list_widget.dart';

class PinnedPostPage extends StatelessWidget {
  const PinnedPostPage({Key? key, required this.pinnedPosts}) : super(key: key);
  final List<Post> pinnedPosts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: const Text('Pinned Posts'),
      ),
      body: ListView(
        children: [PostListWidget(posts: pinnedPosts)],
      ),
    );
  }
}
