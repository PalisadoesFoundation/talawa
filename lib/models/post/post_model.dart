import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/post_queries.dart';

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
    this.hasVoted = false,
  });

  ///Creating a new Post instance from a map structure.

  ///
  /// params:
  /// None
  /// returns:
  /// * `PostObject`: Dart Object for posts
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    caption = json['caption'] as String?;
    createdAt = json["createdAt"] != null
        ? DateTime.tryParse(json['createdAt'] as String)
        : null;
    creator = json['creator'] != null
        ? User.fromJson(json['creator'] as Map<String, dynamic>)
        : null;
    organization = json['organization'] != null
        ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
        : null;
    attachments = (json['attachments'] as List?)
        ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
        .toList();
    commentsCount = json['commentsCount'] as int?;
    upvotesCount = json['upvotesCount'] as int?;
    downvotesCount = json['downvotesCount'] as int?;
    hasVoted = json['hasVoted'] as bool? ?? false;
    voteType = json['voteType'] as String?;
    isPinned = json['isPinned'] as bool?;
    pinnedAt = json['pinnedAt'] != null
        ? DateTime.tryParse(json['pinnedAt'] as String)
        : null;
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

  @HiveField(4)

  /// Number of downvotes on the post.
  int? downvotesCount;

  /// Attachments associated with the post.
  @HiveField(5)
  List<AttachmentModel>? attachments;

  /// Creation timestamp of the post.
  @HiveField(6)
  DateTime? createdAt;

  /// User who created the post.
  @HiveField(7)
  User? creator;

  /// Variable to check if post is voted by the user.
  @HiveField(8)
  bool hasVoted = false;

  /// Variable to check the type of vote on the post by the user (if not voted then null).
  @HiveField(9)
  String? voteType;

  /// Organization associated with the post.
  @HiveField(10)
  OrgInfo? organization;

  /// Variable to check if post is pinned by the user.
  @HiveField(11)
  bool? isPinned;

  /// Timestamp when the post was pinned.
  @HiveField(12)
  DateTime? pinnedAt;

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
  /// * `id`:  The ID of the post for which to fetch the presigned URL.
  ///
  /// **returns**:
  ///   None
  Future<void> getPresignedUrl(String? id) async {
    if (id == null || id.isEmpty) {
      return;
    }

    /// If the post has attachments, fetch presigned URLs for each attachment.
    if (this.attachments != null && this.attachments!.isNotEmpty) {
      for (final attachment in this.attachments!) {
        if ((attachment.url == null || attachment.url!.isEmpty) &&
            attachment.name != null) {
          final query = PostQueries().getPresignedUrl();
          final variables = {
            "objectName": attachment.name,
            "organizationId": id,
          };
          final QueryResult<Object?>? result;
          try {
            result = await locator<DataBaseMutationFunctions>()
                .gqlAuthMutation(query, variables: variables);
          } catch (e) {
            return;
          }

          if (result.data != null &&
              result.data!.containsKey('createGetfileUrl')) {
            final containsUrl =
                result.data?['createGetfileUrl'] as Map<String, dynamic>;
            final url = containsUrl['presignedUrl'] as String?;
            if (url != null && url.isNotEmpty) {
              attachment.url = url;
            }
          }
        }
      }
    }
  }
}
