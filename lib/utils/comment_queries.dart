class CommentQueries {
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
