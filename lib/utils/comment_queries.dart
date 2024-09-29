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
    return """
     mutation createComment(\$postId: ID!, \$text: String!) { 
      createComment(postId: \$postId, 
        data:{
          text: \$text,
        }
      ){
        _id
      }
    }
  """;
  }

  /// Get all comments for a post.
  ///
  /// **params**:
  /// * `postId`: The id of the post to get comments for.
  ///
  /// **returns**:
  /// * `String`: The query for getting all comments for a post.
  String getPostsComments(String postId) {
    return """
     query {
        post(id: "$postId")
        {  _id,
          comments{
             _id,
            text,
             createdAt
        creator{
          firstName
          lastName
        }
          }
        }
      }
""";
  }
}
