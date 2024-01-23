import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/comment_queries.dart';
import 'package:talawa/utils/post_queries.dart';

/// CommentService class have different member functions which provides service in the context of commenting.
///
/// Services include:
/// * `createComments` - used to add comment on the post.
/// * `getCommentsForPost` - used to get all comments on the post.
class CommentService {
  CommentService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }
  late DataBaseMutationFunctions _dbFunctions;

  /// This function is used to add comment on the post.
  ///
  /// To verify things are working, check out the native platform logs.
  /// **params**:
  /// * `postId`: The post id on which comment is to be added.
  /// * `text`: The comment text.
  ///
  /// **returns**:
  ///   None
  Future<void> createComments(String postId, String text) async {
    final String createCommentQuery = CommentQueries().createComment();
    final result = await _dbFunctions.gqlAuthMutation(
      createCommentQuery,
      variables: {
        'postId': postId, //Add your variables here
        'text': text,
      },
    );
    return result;
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
    final String getCommmentQuery = PostQueries().getPostCommentsById(postId);

    final dynamic result = await _dbFunctions.gqlAuthMutation(getCommmentQuery);

    if (result == null) {
      return [];
    }
    final resultData = (result as QueryResult<Object?>).data;

    final resultDataPostComments = (resultData?['post']
        as Map<String, dynamic>)['comments'] as List<dynamic>;
    return resultDataPostComments;
  }
}
