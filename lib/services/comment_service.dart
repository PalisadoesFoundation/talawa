import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/comment_queries.dart';

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
  /// parameters:
  /// * [postId] - Post id where comment need to be added.
  /// * [text] - content of the comment.
  Future<void> createComments(String postId, String text) async {
    print("comment service called");
    final String _createCommentQuery = CommentQueries().createComment();
    final result = await _dbFunctions.gqlAuthMutation(
      _createCommentQuery,
      variables: {
        'postId': postId, //Add your variables here
        'text': text
      },
    );
    print("comment added");
    print(result);
    return result;
  }

  /// This function is used to fetch all comments on the post.
  ///
  /// parameters:
  /// * [postId] - Post id for which comments need to be fetched.
  Future getCommentsForPost(String postId) async {
    final String _getCommmentQuery = CommentQueries().getPostsComments(postId);
    final result = await _dbFunctions.gqlAuthMutation(_getCommmentQuery);
    if (result.data != null) {
      return result.data["commentsByPost"] as List;
    }
    return [];
  }
}
