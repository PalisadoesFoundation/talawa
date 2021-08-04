import 'package:talawa/models/user/user_info.dart';

class Comment {
  Comment({this.text, this.createdAt, this.creator, this.post, this.likeCount});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>,
              fromOrg: true),
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
