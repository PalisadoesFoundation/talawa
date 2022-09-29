import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/post_queries.dart';

void main() {
  group("Testing Post Queries ", () {
    final postQueries = PostQueries();
    test("getPostsById should return proper query", () {
      expect(postQueries.getPostsById("orgId"), """
      query {
        postsByOrganization(id: "orgId",orderBy: createdAt_DESC )
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
""");
    });

    test("addLike should return proper muration", () {
      expect(postQueries.addLike(), """
     mutation likePost(\$postID: ID!) { 
      likePost( id: \$postID,)
      {
        _id
      }
    }
  """);
    });
    test("removeLike should return proper mutation", () {
      expect(postQueries.removeLike(), """
     mutation unlikePost(\$postID: ID!) { 
      unlikePost( id: \$postID,)
      {
        _id
        likedBy{
        _id
        }
      }
    }
  """);
    });
  });
}
