// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/post_queries.dart';

void main() {
  group("Tests for post_queries.dart", () {
    test("Check if getPostsById works correctly", () {
      const data = """
      query {
        postsByOrganization(id: "sampleID",orderBy: createdAt_DESC )
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
      final fnData = PostQueries().getPostsById("sampleID");
      expect(fnData, data);
    });

    test("Check if addLike works correctly", () {
      const data = """
     mutation likePost(\$postID: ID!) { 
      likePost( id: \$postID,)
      {
        _id
      }
    }
  """;
      final fnData = PostQueries().addLike();
      expect(fnData, data);
    });

    test("Check if removeLike works correctly", () {
      const data = """
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
      final fnData = PostQueries().removeLike();
      expect(fnData, data);
    });

    test("Check if removePost works correctly", () {
      const data = '''   
    mutation RemovePost(\$id: ID!) {
      removePost(id: \$id) {
        _id
      }
    }
    ''';
      final fnData = PostQueries().removePost();
      expect(fnData, data);
    });
    test("Check if uploadPost works correctly", () {
      const data = '''
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
      final fnData = PostQueries().uploadPost();
      expect(fnData, data);
    });
  });
}
