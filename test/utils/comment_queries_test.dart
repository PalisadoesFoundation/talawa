import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/comment_queries.dart';

void main() {
  group('CommentQueries', () {
    final queries = CommentQueries();

    test('createComment returns correct mutation', () {
      final mutation =
          queries.createComment().replaceAll(RegExp(r'\s+'), ' ').trim();
      expect(
          mutation,
          contains(
              'mutation CreateComment(\$postId: ID!, \$body: String!) { createComment(input: { postId: \$postId, body: \$body }) { body id } }'));
    });

    test('getPostsComments returns correct query', () {
      final query =
          queries.getPostsComments().replaceAll(RegExp(r'\s+'), ' ').trim();
      expect(
          query,
          contains(
              'query GetPostComments(\$postId: String!, \$first: Int, \$after: String, \$before: String, \$last: Int) { post(input: { id: \$postId }) { comments(first: \$first, after: \$after, before: \$before, last: \$last) { edges { node { body id post { id } createdAt creator { name avatarURL } } } pageInfo { endCursor hasNextPage hasPreviousPage startCursor } } } }'));
    });
  });
}
