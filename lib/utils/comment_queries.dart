// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

///This class creates the queries dealing with comments.
class CommentQueries {
  //Returns a query for creating a comment
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

  //Returns a query to get the comments of a post
  String getPostsComments(String postId) {
    return """
    query{
      commentsByPost(id: "$postId"){
        _id
        text
        createdAt
        creator{
          firstName
          lastName
        }
      }
    }
    """;
  }
}
