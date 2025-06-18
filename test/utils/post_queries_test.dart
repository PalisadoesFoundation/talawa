// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/post_queries.dart';

void main() {
  group("Tests for post_queries.dart", () {
    test("Check if getPostsById works correctly", () {
      const first = 5;
      const last = 5;
      const data = """
      query {
        organizations(id: "sampleID") {
          posts(first: $first, last:$last,after:  "1", before: "2") { 
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
      final fnData = PostQueries().getPostsByOrgID("sampleID", "1", "2", 5, 5);
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

    test("Check if getPostById works correctly", () {
      const data = """
      query {
        post(id: "abc")
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
      final fnData = PostQueries().getPostById("abc");
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
