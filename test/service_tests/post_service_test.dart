import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/utils/post_queries.dart';
import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });
  final demoJson = {
    'postsByOrganization': [
      {
        '__typename': 'Post',
        '_id': '1',
        'text': 'text #hastag',
        'createdAt': '2023-11-13T19:28:21.095Z',
        'imageUrl': 'https://imageurl',
        'videoUrl': 'https://videoUrl',
        'title': 'demo title',
        'commentCount': 0,
        'likeCount': 0,
        'creator': {
          '__typename': 'User',
          '_id': '1',
          'firstName': 'Ayush',
          'lastName': 'Raghuwanshi',
          'image': 'https://imageUrl'
        },
        'organization': {'__typename': 'Organization', '_id': '1'},
        'likedBy': [],
        'comments': [],
      },
      {
        '__typename': 'Post',
        '_id': '2',
        'text': 'text #hastag',
        'createdAt': '2023-11-13T19:28:21.095Z',
        'imageUrl': 'https://imageurl',
        'videoUrl': 'https://videoUrl',
        'title': 'demo title',
        'commentCount': 0,
        'likeCount': 0,
        'creator': {
          '__typename': 'User',
          '_id': '1',
          'firstName': 'Ayush',
          'lastName': 'Raghuwanshi',
          'image': 'https://imageUrl'
        },
        'organization': {'__typename': 'Organization', '_id': '1'},
        'likedBy': [],
        'comments': [],
      }
    ],
  };
  //Fake CurrentOrgID
  const currentOrgID = 'XYZ';
  //Fake PostID
  const postID = '1';

  group('Test PostService', () {
    test('Test getPosts Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      //Setting up Demo data to be returned
      final query = PostQueries().getPostsById(currentOrgID);
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      final service = PostService();
      await service.getPosts();
      //Fetching Post Stream
      final List<Post> posts = await service.postStream.first;
      //Testing if Two Mock posts got added
      expect(posts.length, 2);
    });

    test('Test addLike Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsById(currentOrgID);
      //Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      final service = PostService();
      //Populating posts Stream
      await service.getPosts();
      //Calling AddLike
      await service.addLike(postID);
      //Fetching Post Stream
      final List<Post> posts = await service.postStream.first;
      //Finding The Post which is supposed to be Liked
      final Post likedPost =
          posts.firstWhere((element) => element.sId == postID);
      //Testing if the post got liked
      expect(likedPost.likedBy!.length, 1);
    });

    test('Test removeLike Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsById(currentOrgID);
      //Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      final service = PostService();
      //Populating posts Stream
      await service.getPosts();
      //Liking Post which is to be Unliked
      await service.addLike(postID);
      //Unliking Post
      await service.removeLike(postID);
      //Fetching Post Stream
      final List<Post> posts = await service.postStream.first;
      //Finding The Post which is supposed to be Unliked
      final Post likedPost =
          posts.firstWhere((element) => element.sId == postID);
      //Testing if the post got unliked
      expect(likedPost.likedBy!.length, 0);
    });

    test('Test addCommentLocally Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsById(currentOrgID);
      //Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      final service = PostService();
      //Populating posts Stream
      await service.getPosts();
      //Adding Comment to a Post
      service.addCommentLocally(postID);
      //Fetching Post Stream
      final List<Post> posts = await service.postStream.first;
      //Finding The Post which is supposed to be commented
      final Post commentedPost =
          posts.firstWhere((element) => element.sId == postID);
      //Testing if the post got a comment
      expect(commentedPost.comments!.length, 1);
    });
  });
}
