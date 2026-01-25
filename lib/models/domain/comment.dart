import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/domain/post.dart';
import 'package:talawa/models/domain/user.dart';

/// Clean domain model for comments.
///
/// Represents a comment on a post with voting functionality.
class Comment {
  /// Creates a Comment instance.
  const Comment({
    required this.id,
    this.body,
    this.createdAt,
    this.creator,
    this.post,
    this.hasVoted,
    this.upvotesCount,
    this.downvotesCount,
    this.voteType,
  });

  /// Unique identifier for the comment.
  final String id;

  /// The text content of the comment.
  final String? body;

  /// Timestamp when the comment was created.
  final DateTime? createdAt;

  /// User who created the comment.
  final User? creator;

  /// Post that this comment belongs to.
  final Post? post;

  /// Whether the current user has voted on this comment.
  final bool? hasVoted;

  /// Number of upvotes on this comment.
  final int? upvotesCount;

  /// Number of downvotes on this comment.
  final int? downvotesCount;

  /// Type of vote the current user has cast (upvote, downvote, or none).
  final VoteType? voteType;

  /// Total number of upvotes, with zero fallback.
  int get totalUpvotes => upvotesCount ?? 0;

  /// Total number of downvotes, with zero fallback.
  int get totalDownvotes => downvotesCount ?? 0;

  /// Net vote count (upvotes minus downvotes).
  int get netVotes => totalUpvotes - totalDownvotes;

  /// Whether the comment has received any votes.
  bool get hasVotes => totalUpvotes > 0 || totalDownvotes > 0;

  /// Human-readable time elapsed since comment creation.
  String get timeAgo {
    if (createdAt == null) return '';

    final diff = DateTime.now().difference(createdAt!);
    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${diff.inDays ~/ 7}w';
  }
}
