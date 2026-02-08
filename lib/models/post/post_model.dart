import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/image_service.dart';

part 'post_model.g.dart';

///This class creates a Post model.

@HiveType(typeId: 6)
class Post {
  Post({
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
  });

  ///Creating a new Post instance from a map structure.

  ///
  /// params:
  /// None
  /// returns:
  /// * `PostObject`: Dart Object for posts
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
  }

  /// unique identifier for post.
  @HiveField(0)
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

  /// User who created the post.
  @HiveField(6)
  User? creator;

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

  /// Retry count for failed post operations.
  ///
  /// This field tracks the number of retry attempts for operations
  /// like creating, updating, or deleting the post. It is not persisted
  /// in Hive as it's only relevant during runtime retry logic.
  int retryCount = 0;

  /// Last retry timestamp.
  ///
  /// Records when the last retry attempt was made for this post's
  /// operations. Used for debugging and retry delay calculations.
  DateTime? lastRetryAt;

  /// Increment retry count.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void incrementRetry() {
    retryCount++;
    lastRetryAt = DateTime.now();
  }

  /// Check if max retries exceeded.
  ///
  /// **params**:
  /// * `max`: Maximum number of retries allowed (default: 3).
  ///
  /// **returns**:
  /// * `bool`: True if retry count has reached or exceeded the maximum.
  bool hasExceededMaxRetries({int max = 3}) => retryCount >= max;

  /// Reset retry state.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void resetRetryState() {
    retryCount = 0;
    lastRetryAt = null;
  }

  /// this is to get duration of post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: date is returned in ago form.
  String getPostCreatedDuration() {
    if (this.createdAt == null) {
      return "unknown date";
    }
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

  /// this is to get duration of pinned post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
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
  }
}
