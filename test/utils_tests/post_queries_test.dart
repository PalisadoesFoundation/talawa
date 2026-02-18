import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/post_queries.dart';

void main() {
  group('PostQueries', () {
    test('getPostsByOrgID returns correct GraphQL query', () {
      final query = PostQueries().getPostsByOrgID();

      expect(query, contains('query GetPostsByOrgID'));
      expect(query, contains(r'$orgId: String!'));
      expect(query, contains('organization(input: { id: \$orgId })'));
      expect(query, contains('posts('));
      expect(query, contains('edges {'));
      expect(query, contains('node {'));
      expect(query, contains('id'));
      expect(query, contains('caption'));
      expect(query, contains('upVotesCount'));
      expect(query, contains('downVotesCount'));
      expect(query, contains('commentsCount'));
      expect(query, contains('createdAt'));
      expect(query, contains('hasUserVoted(userId: \$userId)'));
      expect(query, contains('creator {'));
      expect(query, contains('organization {'));
      expect(query, contains('attachments {'));
      expect(query, contains('pageInfo {'));
    });

    test('updateVotePost returns correct GraphQL mutation', () {
      final query = PostQueries().updateVotePost();

      expect(query, contains('mutation UpdateVotePost'));
      expect(query, contains(r'$postId: ID!'));
      expect(query, contains(r'$type: PostVoteType'));
      expect(
        query,
        contains(
          'updatePostVote(input: { postId: \$postId, type: \$type })',
        ),
      );
      expect(query, contains('id'));
      expect(query, contains('upVotesCount'));
      expect(query, contains('downVotesCount'));
    });

    test('uploadPost returns correct GraphQL mutation', () {
      final query = PostQueries().uploadPost();

      expect(query, contains('mutation CreatePost'));
      expect(query, contains(r'$caption: String!'));
      expect(query, contains(r'$organizationId: ID!'));
      expect(query, contains(r'$attachments: [AttachmentInput]'));
      expect(query, contains(r'$userId: ID!'));
      expect(query, contains('createPost('));
      expect(query, contains('caption: \$caption'));
      expect(query, contains('organizationId: \$organizationId'));
      expect(query, contains('attachments: \$attachments'));
      expect(query, contains('id'));
      expect(query, contains('caption'));
      expect(query, contains('upVotesCount'));
      expect(query, contains('downVotesCount'));
      expect(query, contains('commentsCount'));
      expect(query, contains('createdAt'));
      expect(query, contains('hasUserVoted(userId: \$userId)'));
      expect(query, contains('creator {'));
      expect(query, contains('organization {'));
      expect(query, contains('attachments {'));
    });

    test('deletePost returns correct GraphQL mutation', () {
      final query = PostQueries().deletePost();

      expect(query, contains('mutation DeletePost'));
      expect(query, contains(r'$id: ID!'));
      expect(query, contains('deletePost(input: {id: \$id})'));
      expect(query, contains('id'));
    });
  });
}
