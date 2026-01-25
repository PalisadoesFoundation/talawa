import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/comment_queries.dart';

void main() {
  group('CommentQueries', () {
    late CommentQueries queries;

    setUp(() {
      queries = CommentQueries();
    });

    test('createComment returns correct mutation string', () {
      final result = queries.createComment();
      expect(result, contains('mutation CreateComment'));
      expect(result, contains('createComment(input: { postId:'));
      expect(result, contains('body'));
      expect(result, contains('id'));
      expect(result, contains('creator'));
    });

    test('getPostsComments returns correct query string', () {
      final result = queries.getPostsComments();
      expect(result, contains('query GetPostComments'));
      expect(result, contains('post(input: { id:'));
      expect(result, contains('comments('));
      expect(result, contains('edges'));
      expect(result, contains('creator'));
    });

    test('updateVoteComment returns correct mutation string', () {
      final result = queries.updateVoteComment();
      expect(result, contains('mutation UpdateVoteComment'));
      expect(result, contains('updateCommentVote(input: { commentId:'));
      expect(result, contains('upVotesCount'));
      expect(result, contains('downVotesCount'));
    });
  });
}
