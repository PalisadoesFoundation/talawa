import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

class Post {
  Post(
      {this.description,
      this.createdAt,
      this.image,
      this.videoUrl,
      this.creator,
      // this.organization,
      this.likedBy,
      this.comments});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
      image: json['image'] as String?,
      videoUrl: json['videoUrl'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>,
              fromOrg: true),
      // organization: json['organization'] == null
      //     ? null
      //     : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      likedBy: (json['likedBy'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String? description;
  String? createdAt;
  String? image;
  String? videoUrl;
  User? creator;
  // OrgInfo? organization;
  List<User>? likedBy;
  List<Comment>? comments;
}
