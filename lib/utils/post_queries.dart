///This class creates queries related to posts.
class PostQueries {
  /// Getting Posts by Id.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query related to gettingPostsbyOrgID
  String getPostsByOrgID() {
    return '''
    query GetPostsByOrgID(
      \$orgId: String!,
      \$after: String,
      \$before: String,
      \$first: Int,
      \$last: Int
    ) {
      organization(input: { id: \$orgId }) {
        posts(
          first: \$first,
          last: \$last,
          after: \$after,
          before: \$before
        ) {
          edges {
            node {
              id
              caption
              upVotesCount
              downVotesCount
              commentsCount
              createdAt
              creator {
                id
                name
                avatarURL
              }
              organization {
                id
              }
              attachments {
                id
                fileHash
                mimeType
                name
                objectName
              }
            }
            cursor
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

  /// Query to fetch vote details of a post.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query related to fetchingVoteDetails
  String hasUserVoted() {
    return '''
    query HasUserVoted(\$postId: String!) {
      hasUserVoted(input: { postId: \$postId }) {
        hasVoted
      }
    }
  ''';
  }

  /// Getting Presigned URL for uploading a file.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The query related to gettingPresignedUrl
  String getPresignedUrl() {
    return """
    mutation GetFileUrl(\$objectName: String!, \$organizationId: ID!) {
      createGetfileUrl(input: { objectName: \$objectName, organizationId: \$organizationId }) {
        presignedUrl
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
    ''';
  }

  /// Mutation to delete the post.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: query is returned
  String deletePost() {
    return '''
    mutation DeletePost(\$id: ID!) {
      deletePost(creatorId: \$id) {
        id
      }
    }
    ''';
  }
}
