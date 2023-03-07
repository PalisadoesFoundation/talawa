// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa/models/user/user_info.dart';

///This class returns a Comment instance.
class Comment {
  Comment({this.text, this.createdAt, this.creator, this.post, this.likeCount});
  //Creating a new Comment instance from a map structure.
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
      creator: json['creator'] == null
          ? null
          //Creating a new User instance from a map structure.
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
              fromOrg: true,
            ),
      post: json['post'] as String?,
      likeCount: json['likeCount'] as String?,
    );
  }

  String? text;
  String? createdAt;
  User? creator;
  String? post;
  String? likeCount;
}
