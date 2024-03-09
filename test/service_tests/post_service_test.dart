import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';

import '../helpers/test_helpers.dart';

/// Tests post_service.dart.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  setUp(() {
    registerServices();
  });
  final demoJson = {
    '__typename': 'Query',
    'organizations': [
      {
        '__typename': 'Organization',
        'posts': {
          '__typename': 'PostsConnection',
          'edges': [
            {
              '__typename': 'PostEdge',
              'node': {
                '__typename': 'Post',
                '_id': '65e1aac38836aa003e4b8318',
                'title': 'testing',
                'text': 'test post',
                'imageUrl':
                    'http://10.0.2.2:4000/images/5vFxR-8xE2GD-5Tu3E1QYimage.png',
                'videoUrl': null,
                'creator': {
                  '__typename': 'User',
                  '_id': '65378abd85008f171cf2990d',
                  'firstName': 'Vyvyan',
                  'lastName': 'Kerry',
                  'email': 'testadmin1@example.com',
                },
                'createdAt': '2024-03-01T10:15:31.168Z',
                'likeCount': 0,
                'commentCount': 0,
                'likedBy': [],
                'comments': [],
                'pinned': true,
              },
              'cursor': '65e1aac38836aa003e4b8318',
            },
            {
              '__typename': 'PostEdge',
              'node': {
                '__typename': 'Post',
                '_id': '6589bdd92caa9d8d69087515',
                'title': 'Winter Wonderland: Ice Skating Extravaganza',
                'text':
                    'Gliding gracefully on frozen lakes, surrounded by enchanting winter landscape—ice skating extravaganza, a dance in a winter wonderland.',
                'imageUrl': null,
                'videoUrl': null,
                'creator': {
                  '__typename': 'User',
                  '_id': '658938ba2caa9d8d6908748a',
                  'firstName': 'Peggy',
                  'lastName': 'Bowers',
                  'email': 'testuser11@example.com',
                },
                'createdAt': '2024-03-01T10:15:31.168Z',
                'likeCount': 0,
                'commentCount': 0,
                'likedBy': [],
                'comments': [],
              },
              'cursor': '6589bdd92caa9d8d69087515',
            }
          ],
          'postInfo': {
            '__typename': 'DefaultConnectionPageInfo',
            'startCursor': '65e1aac38836aa003e4b8318',
            'endCursor': '6589bd9b2caa9d8d6908750f',
            'hasNextPage': true,
            'hasPreviousPage': false,
          },
        },
      }
    ],
  };

  //Fake CurrentOrgID
  const currentOrgID = 'XYZ';
  //Fake PostID
  const postID = '65e1aac38836aa003e4b8318';

  group('Test PostService', () {
    test('Test refreshFeed method', () async {
      final service = PostService();
      // Populating refreshing feed
      await service.refreshFeed();
      verify(service.getPosts()).called(2);
    });

    test('Test addNewPost method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
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
      service.addNewpost(Post(sId: '1', creator: User()));

      final List<Post> posts = await service.postStream.first;
      expect(posts.length, 3);
    });
    test('Test getPosts Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      //Setting up Demo data to be returned
      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
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

      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
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

      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
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

      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
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
    test('Test updatedPostStream Stream', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
      // Mocking GetPosts
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
      // Populating posts Stream
      await service.getPosts();

      // Listen to updatedPostStream and collect emitted values
      final List<Post> updatedPosts = [];
      final subscription = service.updatedPostStream.listen((post) {
        updatedPosts.add(post);
      });

      // Trigger an event that should update the post
      await service.addLike(postID);

      // Wait for the stream to emit values
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Adjust the delay as needed

      // Verify that the correct post was emitted
      expect(updatedPosts.length, 1);
      expect(updatedPosts[0].sId, postID);
      // Cancel the subscription to avoid memory leaks
      await subscription.cancel();
    });
    test(
        'Test setOrgStreamSubscription method after the organization is updated',
        () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query =
          PostQueries().getPostsById(currentOrgID, null, null, 5, null);
      // Mocking GetPosts
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
      // Populating posts Stream
      await service.getPosts();

      // Set up mock for currentOrgInfoStream
      final mockUserConfig = locator<UserConfig>();
      final orgInfoStreamController = StreamController<OrgInfo>();
      when(mockUserConfig.currentOrgInfoStream)
          .thenAnswer((_) => orgInfoStreamController.stream);

      // Call setOrgStreamSubscription
      service.setOrgStreamSubscription();

      // Trigger an event that should update the organization
      orgInfoStreamController.add(OrgInfo(id: 'newOrgId'));

      // Wait for the setOrgStreamSubscription logic to execute
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Adjust the delay as needed

      // Verify that refresh token was called to check getPost method was called correctly.
      verify(service.getPosts()).called(1);

      // Close the stream controller to avoid memory leaks
      await orgInfoStreamController.close();
    });

   
  });
}
