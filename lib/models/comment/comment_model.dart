import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/user/user_model.dart';

part 'comment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  Comment(this.text, this.createdAt, this.creator, this.post, this.likeCount);
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  String? text;
  String? createdAt;
  User? creator;
  String? post;
  String? likeCount;

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
