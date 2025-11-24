///This class creates the queries dealing with comments.
class CommentQueries {
  /// Creating a comment.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query for creating a comment
  String createComment() {
    return '''
      mutation CreateComment(\$postId: ID!, \$body: String!) {
        createComment(input: { postId: \$postId, body: \$body }) {
          body
          id
        }
      }
    ''';
  }

  /// Get all comments for a post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query for getting all comments for a post.
  String getPostsComments() {
    return '''
    query GetPostComments(\$postId: String!, \$first: Int, \$after: String, \$before: String, \$last: Int) {
      post(input: { id: \$postId }) {
        comments(first: \$first, after: \$after, before: \$before, last: \$last) {
          edges {
            node {
              body
              id
              post {
                id
              }
              createdAt
              creator {
                name
                avatarURL
              }
            }
          }
          pageInfo {
            endCursor
            hasNextPage
            hasPreviousPage
            startCursor
          }
        }
      }
    }
  ''';
  }
}
