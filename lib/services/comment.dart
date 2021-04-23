import 'package:flutter/material.dart';
import 'package:talawa/model/comment.dart';

class CommentHandler with ChangeNotifier {
  final List<CommentModel> _comments = [];

  ///Returns the comment to a given post
  String comment(String postId) {
    final CommentModel comment =
        _comments.firstWhere((element) => element.postId == postId, orElse: () {
      return CommentModel("", "");
    });

    return comment.comment;
  }

  ///Store entry of a given comment on post
  void commentEntry(String postId, String comment) {
    final int index =
        _comments.indexWhere((element) => element.postId == postId);

    if (index == -1) {
      _comments.add(CommentModel(postId, comment));
    } else {
      _comments[index] = CommentModel(postId, comment);
    }
  }

  ///Store entry of a given comment on post
  void commentCompleted(String postId, String comment) {
    final int index =
        _comments.indexWhere((element) => element.postId == postId);
    if (index != -1) {
      _comments.add(CommentModel(postId, comment));
      _comments.removeAt(index);
      notifyListeners();
    }
  }
}
