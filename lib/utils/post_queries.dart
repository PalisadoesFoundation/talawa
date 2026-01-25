///This class creates queries related to posts.
class PostQueries {
  /// Getting Posts by Id.
  ///
  /// **params**:
<<<<<<< HEAD
  /// * `orgId`: The organisation id
  /// * `after`: The cursor after which the posts are to be fetched
  /// * `before`: The cursor before which the posts are to be fetched
  /// * `first`: The number of posts to be fetched from the start
  /// * `last`: The number of posts to be fetched from the end
  ///
  /// **returns**:
  /// * `String`: The query related to gettingPostsbyId
  String getPostsById(
    String orgId,
    String? after,
    String? before,
    int? first,
    int? last,
  ) {
    print(after);
    final String? afterValue = after != null ? '"$after"' : null;
    final String? beforeValue = before != null ? '"$before"' : null;

    return """
      query {
        organizations(id: "$orgId") {
          posts(first: $first, last:$last,after:  $afterValue, before: $beforeValue) { 
          edges {
          node {
            _id
            title
            text
            imageUrl
            videoUrl
            creator {
              _id
              firstName
              lastName
              email
            }
            createdAt
            likeCount
            commentCount
              likedBy{
            _id
          }
          comments{
            _id
          }
            pinned
          }
          cursor
        }
        pageInfo {
          startCursor
          endCursor
          hasNextPage
          hasPreviousPage
        }
        totalCount
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
=======
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
>>>>>>> upstream/develop
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

<<<<<<< HEAD
  /// Remove Like from a post.
=======
  /// Update vote on a post (upvote or downvote, or change vote type).
>>>>>>> upstream/develop
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
<<<<<<< HEAD
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
=======
  /// * `String`: The mutation for updating vote on a post
  String updateVotePost() {
    return """
     mutation UpdateVotePost(\$postId: ID!, \$type: PostVoteType) { 
      updatePostVote(input: { postId: \$postId, type: \$type }) {
        id
        upVotesCount
        downVotesCount
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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

  /// Mutation to remove the post.
=======
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
>>>>>>> upstream/develop
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: query is returned
<<<<<<< HEAD
  String removePost() {
    return '''
    mutation RemovePost(\$id: ID!) {
      removePost(id: \$id) {
        _id
=======
  String deletePost() {
    return '''
    mutation DeletePost(\$id: ID!) {
      deletePost(input: {id: \$id}) {
        id
>>>>>>> upstream/develop
      }
    }
    ''';
  }
}
