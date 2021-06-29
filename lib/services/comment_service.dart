import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/comment_queries.dart';

class CommentService {
  CommentService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }
  late DataBaseMutationFunctions _dbFunctions;

  Future<void> createComments(String postId, String text) async {
    print("comment service called");
    final String _createCommentQuery = CommentQueries().createComment();
    final result =
        await _dbFunctions.gqlAuthMutation(_createCommentQuery, variables: {
      'postId': postId, //Add your variables here
      'text': text
    });
    print("comment added");
    print(result);
    return result;
  }

  Future getCommentsForPost(String postId) async {
    final String _getCommmentQuery = CommentQueries().getPostsComments(postId);
    final result = await _dbFunctions.gqlAuthMutation(_getCommmentQuery);
    if (result.data != null) {
      return result.data["commentsByPost"] as List;
    }
    return [];
  }
}
