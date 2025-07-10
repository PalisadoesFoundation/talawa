import 'package:hive/hive.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

part 'comment_model.g.dart';

///This class returns a Comment instance.
@HiveType(typeId: 13)
class Comment {
  Comment({this.body, this.createdAt, this.creator, this.post});
  //Creating a new Comment instance from a map structure.
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      body: json['body'] as String?,
      createdAt: json['createdAt'] as String?,
      creator: json['creator'] == null
          ? null
          //Creating a new User instance from a map structure.
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
            ),
      post: json['post'] != null
          ? Post.fromJson(
              json['post'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  /// The text of the comment.
  @HiveField(0)
  String? body;

  /// The creation date of the comment.
  @HiveField(1)
  String? createdAt;

  /// The creator of the comment.
  @HiveField(2)
  User? creator;

  /// The post associated with the comment.
  @HiveField(3)
  Post? post;
}
