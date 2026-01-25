<<<<<<< HEAD
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
=======
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
>>>>>>> upstream/develop
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/comment_queries.dart';

/// CommentService class have different member functions which provides service in the context of commenting.
///
/// Services include:
/// * `createComments` - used to add comment on the post.
/// * `getCommentsForPost` - used to get all comments on the post.
class CommentService {
  CommentService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _navigationService = locator<NavigationService>();
  }
  late DataBaseMutationFunctions _dbFunctions;
  late NavigationService _navigationService;

  /// This function is used to add comment on the post.
  ///
  /// To verify things are working, check out the native platform logs.
  /// **params**:
  /// * `postId`: The post id on which comment is to be added.
<<<<<<< HEAD
  /// * `text`: The comment text.
  ///
  /// **returns**:
  ///   None
  Future<void> createComments(String postId, String text) async {
    final String createCommentQuery = CommentQueries().createComment();

    try {
      await _dbFunctions.gqlAuthMutation(
        createCommentQuery,
        variables: {
          'postId': postId, //Add your variables here
          'text': text,
        },
      );

      _navigationService.showTalawaErrorSnackBar(
        "Comment sent",
        MessageType.info,
=======
  /// * `body`: The comment text.
  ///
  /// **returns**:
  /// * `Future<Comment?>`: The created comment.
  Future<Comment?> createComments(String postId, String body) async {
    final String createCommentQuery = CommentQueries().createComment();

    try {
      final result = await _dbFunctions.gqlAuthMutation(
        createCommentQuery,
        variables: {
          'postId': postId,
          'body': body,
        },
      );

      _navigationService.showSnackBar(
        "Comment sent",
      );
      print("Comment created: ${result.data!}");
      return Comment.fromJson(
        result.data!['createComment'] as Map<String, dynamic>,
>>>>>>> upstream/develop
      );
    } on Exception catch (_) {
      _navigationService.showTalawaErrorSnackBar(
        "Something went wrong",
        MessageType.error,
      );
    }
<<<<<<< HEAD
  }

  /// This function is used to get all comments on the post.
  ///
  /// To verify things are working, check out the native platform logs.
  /// **params**:
  /// * `postId`: The post id for which comments are to be fetched.
  ///
  /// **returns**:
  /// * `Future<List<dynamic>>`: promise that will be fulfilled with list of comments.
  ///
  Future<List<dynamic>> getCommentsForPost(String postId) async {
    final String getCommmentQuery = CommentQueries().getPostsComments(postId);

    final QueryResult<Object?> result =
        await _dbFunctions.gqlAuthMutation(getCommmentQuery);

    if (result.data == null) {
      return [];
    }
    final resultData = result.data;

    final resultDataPostComments = (resultData?['post']
        as Map<String, dynamic>)['comments'] as List<dynamic>;
    return resultDataPostComments;
=======
    return null;
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
>>>>>>> upstream/develop
  }
}
