import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/domain/post.dart';
import 'package:talawa/models/domain/user.dart';

/// Clean domain model for comments
class Comment {
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

  final String id;
  final String? body;
  final DateTime? createdAt;
  final User? creator;
  final Post? post;
  final bool? hasVoted;
  final int? upvotesCount;
  final int? downvotesCount;
  final VoteType? voteType;

  // Computed properties
  int get totalUpvotes => upvotesCount ?? 0;
  int get totalDownvotes => downvotesCount ?? 0;
  int get netVotes => totalUpvotes - totalDownvotes;
  bool get hasVotes => totalUpvotes > 0 || totalDownvotes > 0;

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
