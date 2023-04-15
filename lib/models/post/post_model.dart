// ignore_for_file: avoid_dynamic_calls

import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

///This class creates a Post model.
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

  ///Creating a new Post instance from a map structure.

  ///
  /// params:
  /// None
  /// returns:
  /// * `PostObject`: Dart Object for posts
  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String;
    description = json['text'] as String?;
    createdAt = DateTime.parse(json['createdAt'] as String);
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

  /// unique identifier for post.
  late String sId;

  /// description for post.
  String? description;

  /// createdAt for post.
  DateTime? createdAt;

  /// imageUrl for post.
  String? imageUrl;

  /// videoUrl for post.
  String? videoUrl;

  /// creator for post.
  User? creator;

  /// organization for post.
  OrgInfo? organization;

  /// likedBy for post.
  List<LikedBy>? likedBy;

  /// comments for post.
  List<Comments>? comments;

  /// this is to get duration of post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: date is returned in ago form.
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

/// This class convert between json and object for likedby.
class LikedBy {
  LikedBy({this.sId});

  /// JSON factory constructor.
  LikedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }

  /// These are dart object.
  ///
  /// params:
  /// * `sId` : unique identifier for post
  String? sId;

  /// Convert dart object to json.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: json is returned.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}

/// This class convert between json and object for comments.
class Comments {
  Comments({this.sId});

  /// Convert json to dart object.
  ///
  /// params:
  /// None
  /// returns:
  /// * `Map<String, dynamic>`: Dart object is returned.
  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
  }

  /// these are dart object.
  ///
  /// params:
  /// * `sId` : unique identifier for post
  String? sId;

  /// Convert dart object to json.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: json is returned.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}
