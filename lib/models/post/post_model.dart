import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

part 'post_model.g.dart';

///This class creates a Post model.

@HiveType(typeId: 6)
class Post {
  Post({
    required this.sId,
    this.description,
    this.createdAt,
    this.imageUrl,
    this.base64String,
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
    base64String = json['base64String'] as String?;
    videoUrl = json['videoUrl'] as String?;
    creator = json['creator'] != null
        ? User.fromJson(json['creator'] as Map<String, dynamic>, fromOrg: true)
        : null;
    organization = json['organization'] != null
        ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
        : null;
    if (json['likedBy'] != null) {
      likedBy = <LikedBy>[];
      (json['likedBy'] as List).forEach((v) {
        likedBy?.add(LikedBy.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      (json['comments'] as List).forEach((v) {
        comments?.add(Comments.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  /// unique identifier for post.
  @HiveField(0)
  late String sId;

  /// Description of the post.
  @HiveField(1)
  String? description;

  /// Creation timestamp of the post.
  @HiveField(2)
  DateTime? createdAt;

  /// URL of the image attached to the post.
  @HiveField(3)
  String? imageUrl;

  /// Base64 encoded string of an image attached to the post.
  @HiveField(4)
  String? base64String;

  /// URL of a video attached to the post.
  @HiveField(5)
  String? videoUrl;

  /// User who created the post.
  @HiveField(6)
  User? creator;

  /// Organization associated with the post.
  @HiveField(7)
  OrgInfo? organization;

  /// List of users who liked the post.
  @HiveField(8)
  List<LikedBy>? likedBy;

  /// List of comments on the post.
  @HiveField(9)
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
@HiveType(typeId: 8)
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
  @HiveField(0)
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
@HiveType(typeId: 9)
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
  @HiveField(0)
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
