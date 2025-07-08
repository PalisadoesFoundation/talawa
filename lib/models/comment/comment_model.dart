import 'package:hive/hive.dart';
import 'package:talawa/models/user/user_info.dart';

part 'comment_model.g.dart';

///This class returns a Comment instance.
@HiveType(typeId: 13)
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

  /// The text of the comment.
  @HiveField(0)
  String? text;

  /// The creation date of the comment.
  @HiveField(1)
  String? createdAt;

  /// The creator of the comment.
  @HiveField(2)
  User? creator;

  /// The post associated with the comment.
  @HiveField(3)
  String? post;

  /// The like count of the comment.
  @HiveField(4)
  String? likeCount;
}
