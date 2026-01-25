<<<<<<< HEAD
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
=======
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/image_service.dart';
>>>>>>> upstream/develop

part 'post_model.g.dart';

///This class creates a Post model.

@HiveType(typeId: 6)
class Post {
  Post({
<<<<<<< HEAD
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
=======
    this.id,
    this.caption,
    this.createdAt,
    this.attachments,
    this.creator,
    this.organization,
    this.commentsCount,
    this.upvotesCount,
    this.downvotesCount,
    this.voteType,
    this.isPinned,
    this.pinnedAt,
    this.hasVoted,
>>>>>>> upstream/develop
  });

  ///Creating a new Post instance from a map structure.

  ///
  /// params:
  /// None
  /// returns:
  /// * `PostObject`: Dart Object for posts
<<<<<<< HEAD
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
=======
  factory Post.fromJson(Map<String, dynamic> json) {
    final hasUserVoted = json['hasUserVoted'] as Map<String, dynamic>?;

    return Post(
      id: json['id'] as String?,
      caption: json['caption'] as String?,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json['createdAt'] as String)?.toLocal()
          : null,
      creator: json['creator'] != null
          ? User.fromJson(json['creator'] as Map<String, dynamic>)
          : null,
      organization: json['organization'] != null
          ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
          : null,
      attachments: (json['attachments'] as List?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: json['commentsCount'] as int?,
      upvotesCount: json['upVotesCount'] as int?,
      downvotesCount: json['downVotesCount'] as int?,
      isPinned: json['isPinned'] as bool?,
      pinnedAt: json['pinnedAt'] != null
          ? DateTime.tryParse(json['pinnedAt'] as String)?.toLocal()
          : null,
      hasVoted: hasUserVoted?['hasVoted'] as bool?,
      voteType: VoteType.fromApiString(hasUserVoted?["voteType"] as String?),
    );
>>>>>>> upstream/develop
  }

  /// unique identifier for post.
  @HiveField(0)
<<<<<<< HEAD
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
=======
  String? id;

  /// Caption of the post.
  @HiveField(1)
  String? caption;

  /// Number of Comments on the post.
  @HiveField(2)
  int? commentsCount;

  /// Number of upvotes on the post.
  @HiveField(3)
  int? upvotesCount;

  /// Attachments associated with the post.
  @HiveField(4)
  List<AttachmentModel>? attachments;

  /// Creation timestamp of the post.
  @HiveField(5)
  DateTime? createdAt;
>>>>>>> upstream/develop

  /// User who created the post.
  @HiveField(6)
  User? creator;

<<<<<<< HEAD
  /// Organization associated with the post.
  @HiveField(7)
  OrgInfo? organization;

  /// List of users who liked the post.
  @HiveField(8)
  List<LikedBy>? likedBy;

  /// List of comments on the post.
  @HiveField(9)
  List<Comments>? comments;
=======
  /// Variable to check if post is voted by the user.
  @HiveField(7)
  bool? hasVoted;

  /// Variable to check the type of vote on the post by the user (if not voted then null).
  @HiveField(8)
  VoteType? voteType;

  /// Organization associated with the post.
  @HiveField(9)
  OrgInfo? organization;

  /// Variable to check if post is pinned by the user.
  @HiveField(10)
  bool? isPinned;

  /// Timestamp when the post was pinned.
  @HiveField(11)
  DateTime? pinnedAt;

  /// Number of downvotes on the post.
  @HiveField(12)
  int? downvotesCount;

  /// Image service instance to handle file operations
  static final ImageService _imageService = locator<ImageService>();
>>>>>>> upstream/develop

  /// this is to get duration of post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: date is returned in ago form.
  String getPostCreatedDuration() {
<<<<<<< HEAD
=======
    if (this.createdAt == null) {
      return "unknown date";
    }
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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
=======

  /// this is to get duration of pinned post.
>>>>>>> upstream/develop
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
<<<<<<< HEAD
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
=======
  /// * `String`: date is returned in ago form.
  String getPostPinnedDuration() {
    if (this.pinnedAt == null) {
      return "unknown date";
    }
    if (DateTime.now().difference(this.pinnedAt!).inSeconds < 60) {
      return '${DateTime.now().difference(this.pinnedAt!).inSeconds} Seconds Ago';
    } else if (DateTime.now().difference(this.pinnedAt!).inMinutes < 60) {
      return '${DateTime.now().difference(this.pinnedAt!).inMinutes} Minutes Ago';
    } else if (DateTime.now().difference(this.pinnedAt!).inHours < 24) {
      return '${DateTime.now().difference(this.pinnedAt!).inHours} Hours Ago';
    } else if (DateTime.now().difference(this.pinnedAt!).inDays < 30) {
      return '${DateTime.now().difference(this.pinnedAt!).inDays} Days Ago';
    } else if (DateTime.now().difference(this.pinnedAt!).inDays < 365) {
      return '${DateTime.now().difference(this.pinnedAt!).inDays ~/ 30} Months Ago';
    } else {
      return '${DateTime.now().difference(this.pinnedAt!).inDays ~/ 365} Years Ago';
    }
  }

  /// Method to get the presigned URL for a file attachment.
  ///
  /// **params**:
  /// * `organizationId`:  The organization ID for which to fetch the presigned URL.
  ///
  /// **returns**:
  ///   None
  Future<void> getPresignedUrl(String? organizationId) async {
    if (organizationId == null || organizationId.isEmpty) {
      return;
    }
    if (this.attachments != null && this.attachments!.isNotEmpty) {
      for (final attachment in this.attachments!) {
        if ((attachment.url == null || attachment.url!.isEmpty) &&
            attachment.name != null) {
          try {
            final url = await _imageService.getFileFromMinio(
              objectName: attachment.name!,
              organizationId: organizationId,
            );
            attachment.url = url;
          } catch (e) {
            debugPrint(
              'Error getting presigned URL for ${attachment.name}: $e',
            );
          }
        }
      }
    }
>>>>>>> upstream/develop
  }
}
