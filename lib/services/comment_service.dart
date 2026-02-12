import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/retry_queue.dart';
import 'package:talawa/utils/comment_queries.dart';

/// Pattern for detecting authentication/authorization errors that should not be retried.
final RegExp _authErrorPattern = RegExp(
    r'\b(auth|authentication|authorization|unauthorized|unauthenticated|forbidden)\b');

/// CommentService class have different member functions which provides service in the context of commenting.
///
/// Services include:
/// * `createComments` - used to add comment on the post with retry support.
/// * `getCommentsForPost` - used to get all comments on the post.
class CommentService {
  /// Creates a CommentService instance.
  ///
  /// **params**:
  ///   None
  CommentService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _navigationService = locator<NavigationService>();
  }

  late DataBaseMutationFunctions _dbFunctions;
  late NavigationService _navigationService;

  /// This function is used to add comment on the post with retry support.
  ///
  /// The function uses the retry queue to automatically retry the operation
  /// with exponential backoff if it fails due to network issues.
  ///
  /// **params**:
  /// * `postId`: The post id on which comment is to be added.
  /// * `body`: The comment text.
  ///
  /// **returns**:
  /// * `Future<Comment?>`: The created comment, or null if all retries failed.
  Future<Comment?> createComments(String postId, String body) async {
    final String createCommentQuery = CommentQueries().createComment();
    final queue = locator<RetryQueue>();

    // Create deterministic key based on postId and normalized body
    final normalizedBody = body.trim();
    final bodyHash = sha1.convert(utf8.encode(normalizedBody)).toString();
    final retryKey = 'create-comment-$postId-$bodyHash';

    final result = await queue.execute(
      () async {
        final queryResult = await _dbFunctions.gqlAuthMutation(
          createCommentQuery,
          variables: {
            'postId': postId,
            'body': body,
          },
        );
        if (queryResult.data == null) {
          throw Exception('Failed to create comment: No data returned');
        }
        return queryResult;
      },
      key: retryKey,
      onRetry: (attempt, error) {
        debugPrint(
          'CommentService: Retry attempt $attempt for comment on post $postId: $error',
        );
      },
      shouldRetry: (error) {
        // Do not retry on auth/authz errors
        final errorStr = error.toString().toLowerCase();
        return !_authErrorPattern.hasMatch(errorStr);
      },
    );

    if (result.succeeded) {
      // Guard against null data
      if (result.data == null || result.data!.data == null) {
        _navigationService.showTalawaErrorSnackBar(
          "Failed to send comment after retries",
          MessageType.error,
        );
        return null;
      }

      final commentData = result.data!.data!['createComment'];
      if (commentData == null) {
        _navigationService.showTalawaErrorSnackBar(
          "Failed to send comment after retries",
          MessageType.error,
        );
        return null;
      }

      _navigationService.showTalawaErrorSnackBar(
        "Comment sent",
        MessageType.info,
      );
      return Comment.fromJson(commentData as Map<String, dynamic>);
    } else {
      _navigationService.showTalawaErrorSnackBar(
        "Failed to send comment after retries",
        MessageType.error,
      );
      return null;
    }
  }

  /// This function is used to get comments on the post.
  ///
  /// **params**:
  /// * `postId`: The post id for which comments are to be fetched.
  /// * `first`: The number of comments to fetch (default is 10).
  /// * `after`: The cursor for pagination to fetch comments after a specific point.
  /// * `last`: The number of comments to fetch from the end (optional).
  /// * `before`: The cursor for pagination to fetch comments before a specific point (optional).
  ///
  /// **returns**:
  /// * `Future<Map<String, dynamic>>`: A map containing the list of comments and pagination information.
  Future<Map<String, dynamic>> getCommentsForPost({
    required String postId,
    int first = 10,
    String? after,
    int? last,
    String? before,
  }) async {
    final String getCommentQuery = CommentQueries().getPostsComments();
    final variables = {
      'postId': postId,
      'first': first,
      'after': after,
      'last': last,
      'before': before,
      'userId': userConfig.currentUser.id,
    };

    final QueryResult<Object?> result;
    try {
      result = await _dbFunctions.gqlAuthMutation(
        getCommentQuery,
        variables: variables,
      );
    } catch (e) {
      _navigationService.showTalawaErrorSnackBar(
        "Something went wrong while fetching comments",
        MessageType.error,
      );
      return {'comments': [], 'pageInfo': {}};
    }

    final postData = result.data?['post'] as Map<String, dynamic>?;
    if (postData == null) {
      return {'comments': [], 'pageInfo': {}};
    }
    final commentsData = postData['comments'] as Map<String, dynamic>?;
    if (commentsData == null) {
      return {'comments': [], 'pageInfo': {}};
    }
    return {
      'comments': commentsData['edges'] ?? [],
      'pageInfo': commentsData['pageInfo'] ?? {},
    };
  }

  /// This function is used to toggle upvote on a comment.
  ///
  /// **params**:
  /// * `commentId`: The comment id to vote on.
  /// * `currentVoteType`: The current vote type (if any).
  /// * `hasVoted`: Whether the user has already voted.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleUpVoteComment(
    String commentId,
    VoteType? currentVoteType,
    bool hasVoted,
  ) async {
    try {
      String mutation;
      Map<String, dynamic> variables;

      if (hasVoted && currentVoteType == VoteType.upVote) {
        mutation = CommentQueries().updateVoteComment();
        variables = {
          'commentId': commentId,
          'type': null,
        };
      } else {
        mutation = CommentQueries().updateVoteComment();
        variables = {
          'commentId': commentId,
          'type': VoteType.upVote.toApiString(),
        };
      }

      await _dbFunctions.gqlAuthMutation(mutation, variables: variables);
    } catch (e) {
      debugPrint('Error toggling upvote: $e');
    }
  }

  /// This function is used to toggle downvote on a comment.
  ///
  /// **params**:
  /// * `commentId`: The comment id to vote on.
  /// * `currentVoteType`: The current vote type (if any).
  /// * `hasVoted`: Whether the user has already voted.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleDownVoteComment(
    String commentId,
    VoteType? currentVoteType,
    bool hasVoted,
  ) async {
    try {
      String mutation;
      Map<String, dynamic> variables;

      if (hasVoted && currentVoteType == VoteType.downVote) {
        mutation = CommentQueries().updateVoteComment();
        variables = {
          'commentId': commentId,
          'type': null,
        };
      } else {
        mutation = CommentQueries().updateVoteComment();
        variables = {
          'commentId': commentId,
          'type': VoteType.downVote.toApiString(),
        };
      }

      await _dbFunctions.gqlAuthMutation(mutation, variables: variables);
    } catch (e) {
      debugPrint('Error toggling downvote: $e');
    }
  }
}
