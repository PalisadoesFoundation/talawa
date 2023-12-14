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

  /// Getting Post by Post Id.
  ///
  /// **params**:
  /// * `postId`: The post id
  ///
  /// **returns**:
  /// * `String`: The query related to gettingPostsbyId
  String getPostById(String postId) {
    return """
      query {
        post(id: "$postId")
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
    \$file: String
  ) {
    createPost(
      data: {
        text: \$text
        title: \$title
        imageUrl: \$imageUrl
        videoUrl: \$videoUrl
        organizationId: \$organizationId
      }
      file: \$file
    ) {
      _id
    }
  }
    ''';
  }

  /// Mutation to remove the post.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: query is returned
  String removePost() {
    return '''   
    mutation RemovePost(\$id: ID!) {
      removePost(id: \$id) {
        _id
      }
    }
    ''';
  }
}
