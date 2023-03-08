// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/post_list_widget.dart';

/// PinnedPostPage returns a widget that shows the list of all the pinned post.
class PinnedPostPage extends StatelessWidget {
  const PinnedPostPage({Key? key, required this.pinnedPosts}) : super(key: key);
  final List<Post> pinnedPosts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Pinned Posts'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
      ),
      body: ListView(
        children: [PostListWidget(posts: pinnedPosts)],
      ),
    );
  }
}
