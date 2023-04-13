///This class creates queries related to posts.
class PostQueries {
  /// Getting Posts by Id.
  ///
  /// **params**:
  /// * `orgId`: The organisation id
  ///
  /// **returns**:
  /// * `String`: The query related to gettingPostsbyId
  String getPostsById(String orgId) {
    return """
      query {
        postsByOrganization(id: "$orgId",orderBy: createdAt_DESC )
        { 
          _id
          text
          createdAt
          imageUrl
          videoUrl
          title
          commentCount
          likeCount
          creator{
            _id
            firstName
            lastName
            image
          }
          organization{
            _id
          }
          likedBy{
            _id
          }
          comments{
            _id
          }
        }
      }
""";
  }

  /// Add Like to a post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query related to addingLike
  String addLike() {
    return """
     mutation likePost(\$postID: ID!) { 
      likePost( id: \$postID,)
      {
        _id
      }
    }
  """;
  }

  /// Remove Like from a post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query related to removingLike
  String removeLike() {
    return """
     mutation unlikePost(\$postID: ID!) { 
      unlikePost( id: \$postID,)
      {
        _id
        likedBy{
        _id
        }
      }
    }
  """;
  }

  /// Upload a post to database.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query related to uploadingPost.
  String uploadPost() {
    return '''
    mutation CreatePost(
    \$text: String!
    \$title: String!
    \$imageUrl: URL
    \$videoUrl: URL
    \$organizationId: ID!
  ) {
    createPost(
      data: {
        text: \$text
        title: \$title
        imageUrl: \$imageUrl
        videoUrl: \$videoUrl
        organizationId: \$organizationId
      }
    ) {
      _id
    }
  }
    ''';
  }
}
