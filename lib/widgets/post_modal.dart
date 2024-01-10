import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';

/// To add options to the bottom nav bar, increase the height too.
///
///
class PostBottomModal extends StatelessWidget {
  const PostBottomModal({
    super.key,
    this.function,
    this.deletePost,
    required this.post,
  });

  /// This function is passed for the handling the action to be performed when the comment button is clicked.
  ///
  /// to see the function check the place where the widget is called.
  final Function(Post)? function;

  /// To delete the post if user can.
  ///
  /// only work if the post is made by the user
  final Function(Post)? deletePost;

  /// Post object containing all the data related to the post.
  ///
  /// see the post model to get more information regarding this
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Icon(
                  Icons.report_gmailerrorred_outlined,
                  color: Colors.black38,
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
                child: const Text(
                  'Report the post to the Admin',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 20,
                    fontFamily: 'open-sans',
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.black38,
                ),
              ),
              TextButton(
                key: const Key('deletePost'),
                onPressed: () {
                  deletePost != null
                      ? deletePost!(post)
                      // ignore: unnecessary_statements
                      : {};
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
                              navigationService.showTalawaErrorSnackBar(
                                'Post was deleted if you had the rights!',
                                MessageType.info,
                              );
                              Navigator.pop(context);
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
                child: const Text(
                  'The post was deleted',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 20,
                    fontFamily: 'open-sans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
