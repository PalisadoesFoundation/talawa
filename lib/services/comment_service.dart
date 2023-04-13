// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

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
    final String createCommentQuery = CommentQueries().createComment();
    final result = await _dbFunctions.gqlAuthMutation(
      createCommentQuery,
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
    final String getCommmentQuery = CommentQueries().getPostsComments(postId);
    final result = await _dbFunctions.gqlAuthMutation(getCommmentQuery);
    if (result.data != null) {
      return result.data["commentsByPost"] as List;
    }
    return [];
  }
}
