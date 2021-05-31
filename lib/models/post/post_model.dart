import 'package:json_annotation/json_annotation.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/organization_model.dart';
import 'package:talawa/models/user/user_model.dart';

part 'post_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  Post(this.description, this.createdAt, this.imageUrl, this.videoUrl,
      this.creator, this.organization, this.likedBy, this.comments);

  String? description;
  String? createdAt;
  String? imageUrl;
  String? videoUrl;
  User? creator;
  Organization? organization;
  List<User>? likedBy;
  List<Comment>? comments;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
