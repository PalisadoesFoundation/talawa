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
      \$last: Int,
      \$userId: ID!
    ) {
      organization(input: { id: \$orgId }) {
        posts(
          first: \$first,
          last: \$last,
          after: \$after,
          before: \$before,
        ) {
          edges {
            node {
              id
              caption
              upVotesCount
              downVotesCount
              commentsCount
              createdAt
              hasUserVoted(userId: \$userId) {
                hasVoted
                voteType
              }
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

  /// Update vote on a post (upvote or downvote, or change vote type).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The mutation for updating vote on a post
  String updateVotePost() {
    return """
     mutation UpdateVotePost(\$postId: ID!, \$type: PostVoteType) { 
      updatePostVote(input: { postId: \$postId, type: \$type }) {
        id
        upVotesCount
        downVotesCount
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
      \$caption: String!
      \$organizationId: ID!
      \$attachments: [AttachmentInput]
      \$userId: ID!
    ) {
      createPost(
        input: {
          caption: \$caption
          organizationId: \$organizationId
          attachments: \$attachments
        }
      ) {
        id
        caption
        upVotesCount
        downVotesCount
        commentsCount
        createdAt
        hasUserVoted(userId: \$userId) {
          hasVoted
          voteType
        }
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
      deletePost(input: {id: \$id}) {
        id
      }
    }
    ''';
  }
}
