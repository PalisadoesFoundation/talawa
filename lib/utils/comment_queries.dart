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
          upVotesCount
          downVotesCount
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
    query GetPostComments(\$postId: String!, \$first: Int, \$after: String, \$before: String, \$last: Int, \$userId: ID!) {
      post(input: { id: \$postId }) {
        comments(first: \$first, after: \$after, before: \$before, last: \$last) {
          edges {
            node {
              body
              id
              upVotesCount
              downVotesCount
              post {
                id
              }
              hasUserVoted(userId: \$userId) {
                hasVoted
                voteType
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

  /// Update vote on a comment (upvote or downvote, or change vote type).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The mutation for updating vote on a comment
  String updateVoteComment() {
    return '''
      mutation UpdateVoteComment(\$commentId: ID!, \$type: CommentVoteType) {
        updateCommentVote(input: { commentId: \$commentId, type: \$type  }) {
          id
          upVotesCount
          downVotesCount
        }
      }
    ''';
  }
}
