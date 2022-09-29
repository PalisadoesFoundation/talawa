import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/comment_queries.dart';

void main() {
  group("Testing Comment Quries ", () {
    final commentQueries = CommentQueries();
    test("createComment should return proper mutation", () {
      expect(commentQueries.createComment(), """
     mutation createComment(\$postId: ID!, \$text: String!) { 
      createComment(postId: \$postId, 
        data:{
          text: \$text,
        }
      ){
        _id
      }
    }
  """);
    });

    test("getPostsComments should return proper query", () {
      expect(commentQueries.getPostsComments("postId"), """
    query{
      commentsByPost(id: "postId"){
        _id
        text
        createdAt
        creator{
          firstName
          lastName
        }
      }
    }
    """);
    });
  });
}
