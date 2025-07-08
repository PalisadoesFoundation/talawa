import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
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
  /// * `body`: The comment text.
  ///
  /// **returns**:
  ///   None
  Future<void> createComments(String postId, String body) async {
    final String createCommentQuery = CommentQueries().createComment();

    try {
      await _dbFunctions.gqlAuthMutation(
        createCommentQuery,
        variables: {
          'postId': postId,
          'body': body,
        },
      );

      _navigationService.showSnackBar(
        "Comment sent",
      );
    } on Exception catch (_) {
      _navigationService.showTalawaErrorSnackBar(
        "Something went wrong",
        MessageType.error,
      );
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
}
