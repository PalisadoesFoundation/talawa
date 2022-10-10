//This class creates queries related to posts.
class PostQueries {
  //Returns a query to get posts by ID.
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

  //Returns a query to add a like to a post.
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

  //Returns a query to remove a like from a post.
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
}
