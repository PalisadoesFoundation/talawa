import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/comment_queries.dart';

void main() {
  group("Tests for comment_queries.dart", () {
    test("Check if getPostsComments works correctly", () {
      const data = """
     query {
        post(id: "abc")
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
      final fnData = CommentQueries().getPostsComments("abc");
      expect(fnData, data);
    });

    test("Check if createComment works correctly", () {
      const data = """
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
      final fnData = CommentQueries().createComment();
      expect(fnData, data);
    });
  });
}
