import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

class Post {
  Post({
    required this.sId,
    this.description,
    this.createdAt,
    this.imageUrl,
    this.videoUrl,
    required this.creator,
    this.organization,
    this.likedBy,
    this.comments,
  });

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String;
    description = json['text'] as String?;
    createdAt = DateTime.fromMillisecondsSinceEpoch(
      int.parse(json['createdAt'] as String),
    );
    imageUrl = json['imageUrl'] as String?;
    videoUrl = json['videoUrl'] as String?;
    creator = json['creator'] != null
        ? User.fromJson(json['creator'] as Map<String, dynamic>, fromOrg: true)
        : null;
    organization = json['organization'] != null
        ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
        : null;
    if (json['likedBy'] != null) {
      likedBy = <LikedBy>[];
      json['likedBy'].forEach((v) {
        likedBy?.add(LikedBy.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments?.add(Comments.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  late String sId;
  String? description;
  DateTime? createdAt;
  String? imageUrl;
  String? videoUrl;
  User? creator;
  OrgInfo? organization;
  List<LikedBy>? likedBy;
  List<Comments>? comments;

  String getPostCreatedDuration() {
    if (DateTime.now().difference(this.createdAt!).inSeconds < 60) {
      return '${DateTime.now().difference(this.createdAt!).inSeconds} Seconds Ago';
    } else if (DateTime.now().difference(this.createdAt!).inMinutes < 60) {
      return '${DateTime.now().difference(this.createdAt!).inMinutes} Minutes Ago';
    } else if (DateTime.now().difference(this.createdAt!).inHours < 24) {
      return '${DateTime.now().difference(this.createdAt!).inHours} Hours Ago';
    } else if (DateTime.now().difference(this.createdAt!).inDays < 30) {
      return '${DateTime.now().difference(this.createdAt!).inDays} Days Ago';
    } else if (DateTime.now().difference(this.createdAt!).inDays < 365) {
      return '${DateTime.now().difference(this.createdAt!).inDays ~/ 30} Months Ago';
    } else {
      return '${DateTime.now().difference(this.createdAt!).inDays ~/ 365} Years Ago';
    }
  }
}

class LikedBy {
  LikedBy({this.sId});
  LikedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }

  String? sId;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}

class Comments {
  Comments({this.sId});
  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }

  String? sId;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}
