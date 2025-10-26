import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// To add options to the bottom nav bar, increase the height too.
class PostBottomModal extends StatelessWidget {
  const PostBottomModal({
    super.key,
    this.deletePost,
    required this.post,
  });

  /// To delete the post if user can (only work if the post is made by the user).
  final Function(Post)? deletePost;

  /// Post object containing all the data related to the post.
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Icon(
                  Icons.report_gmailerrorred_outlined,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              TextButton(
                key: const Key('reportPost'),
                onPressed: () {
                  navigationService.showTalawaErrorSnackBar(
                    'Your Report has been sent to the Admin',
                    MessageType.info,
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  'Report the post to the Admin',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        if (post.creator?.id != null &&
            post.creator?.id == locator<UserConfig>().currentUser.id)
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              TextButton(
                key: const Key('deletePost'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext builder) {
                      return AlertDialog(
                        title: const Text("Warning"),
                        content: const Text(
                          "Do you really want to delete the post?",
                        ),
                        actions: <Widget>[
                          TextButton(
                            key: const Key('alert_dialog_yes_btn'),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              deletePost?.call(post);
                            },
                            child: const Text("Yes"),
                          ),
                          TextButton(
                            key: const Key('alert_dialog_no_btn'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Delete Post',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          )
      ],
    );
  }
}
