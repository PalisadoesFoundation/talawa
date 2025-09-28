import 'package:hive/hive.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

part 'comment_model.g.dart';

///This class returns a Comment instance.
@HiveType(typeId: 12)
class Comment {
  Comment({
    this.body,
    this.createdAt,
    this.creator,
    this.post,
    this.id,
    this.hasVoted,
    this.upvotesCount,
    this.downvotesCount,
    this.voteType,
  });
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
      id: json["id"] as String?,
      hasVoted: json["hasVoted"] as bool? ?? false,
      upvotesCount: json["upvotesCount"] as int?,
      downvotesCount: json["downvotesCount"] as int?,
      voteType: json["voteType"] as String?,
    );
  }

  /// id of the comment.
  @HiveField(0)
  String? id;

  /// The text of the comment.
  @HiveField(1)
  String? body;

  /// The creation date of the comment.
  @HiveField(2)
  String? createdAt;

  /// The creator of the comment.
  @HiveField(3)
  User? creator;

  /// The post associated with the comment.
  @HiveField(4)
  Post? post;

  /// Variable to check if post is voted by the user.
  @HiveField(5)
  bool? hasVoted;

  /// Number of upvotes on the comment.
  @HiveField(6)
  int? upvotesCount;

  /// Number of downvotes on the comment.
  @HiveField(7)
  int? downvotesCount;

  /// Variable to check the type of vote on the comment by the user (if not voted then null).
  @HiveField(8)
  String? voteType;
}
