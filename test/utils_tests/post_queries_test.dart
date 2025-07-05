import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/post_queries.dart';

void main() {
  final postQueries = PostQueries();

  test('getPostsByOrgID returns valid query', () {
    final query = postQueries.getPostsByOrgID();
    expect(query, contains('query GetPostsByOrgID'));
    expect(query, contains('\$orgId'));
    expect(query, contains('organization(input: { id: \$orgId })'));
    expect(query, contains('posts('));
  });

  test('hasUserVoted returns valid query', () {
    final query = postQueries.hasUserVoted();
    expect(query, contains('query HasUserVoted'));
    expect(query, contains('\$postId'));
    expect(query, contains('hasUserVoted(input: { postId: \$postId })'));
  });

  test('getPresignedUrl returns valid mutation', () {
    final query = postQueries.getPresignedUrl();
    expect(query, contains('mutation GetFileUrl'));
    expect(query, contains('\$objectName'));
    expect(query, contains('\$organizationId'));
    expect(
      query,
      contains(
        'createGetfileUrl(input: { objectName: \$objectName, organizationId: \$organizationId })',
      ),
    );
  });

  test('addLike returns valid mutation', () {
    final query = postQueries.addLike();
    expect(query, contains('mutation likePost'));
    expect(query, contains('\$postID'));
    expect(query, contains('likePost( id: \$postID,'));
  });

  test('uploadPost returns valid mutation', () {
    final query = postQueries.uploadPost();
    expect(query, contains('mutation CreatePost'));
    expect(query, contains('\$text'));
    expect(query, contains('\$title'));
    expect(query, contains('\$organizationId'));
    expect(query, contains('createPost('));
  });

  test('deletePost returns valid mutation', () {
    final query = postQueries.deletePost();
    expect(query, contains('mutation DeletePost'));
    expect(query, contains('\$id'));
    expect(query, contains('deletePost(input: {id: \$id})'));
  });
}
