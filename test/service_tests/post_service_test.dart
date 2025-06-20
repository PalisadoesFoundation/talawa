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
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';

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
    locator.registerSingleton<ActionHandlerService>(ActionHandlerService());
  });
  tearDown(() {
    locator.unregister<ActionHandlerService>();
  });
  final demoJson = {
    'organization': {
      'posts': {
        'edges': [
          {
            'node': {
              'id': 'post1',
              'caption': 'Welcome to the event!',
              'upVotesCount': 17,
              'downVotesCount': 3,
              'commentsCount': 8,
              'createdAt': '2025-06-20T12:00:00Z',
              'creator': {
                'id': 'user1',
                'name': 'Alice',
                'avatarURL': 'https://example.com/avatar1.png'
              },
              'organization': {'id': 'org1'},
              'attachments': [
                {
                  'id': 'att1',
                  'fileHash': 'abc123',
                  'mimeType': 'image/png',
                  'name': 'banner.png',
                  'objectName': 'banner_2025.png'
                },
                {
                  'id': 'att2',
                  'fileHash': 'def456',
                  'mimeType': 'application/pdf',
                  'name': 'agenda.pdf',
                  'objectName': 'agenda_2025.pdf'
                }
              ]
            },
            'cursor': 'cursor1'
          },
          {
            'node': {
              'id': 'post2',
              'caption': "Don't miss our next meetup!",
              'upVotesCount': 5,
              'downVotesCount': 1,
              'commentsCount': 2,
              'createdAt': '2025-06-19T09:30:00Z',
              'creator': {
                'id': 'user2',
                'name': 'Bob',
                'avatarURL': 'https://example.com/avatar2.png'
              },
              'organization': {'id': 'org1'},
              'attachments': [
                {
                  'id': 'att3',
                  'fileHash': 'ghi789',
                  'mimeType': 'image/jpeg',
                  'name': 'photo.jpg',
                  'objectName': 'photo_2025.jpg'
                }
              ]
            },
            'cursor': 'cursor2'
          }
        ],
        'pageInfo': {
          'endCursor': 'cursor2',
          'hasNextPage': true,
          'hasPreviousPage': false,
          'startCursor': 'cursor1'
        }
      }
    }
  };

  final demoJsonPage2 = {
    'organization': {
      'posts': {
        'edges': [
          {
            'node': {
              'id': 'post3',
              'caption': 'Second Page Post 1',
              'upVotesCount': 9,
              'downVotesCount': 0,
              'commentsCount': 4,
              'createdAt': '2025-06-18T15:00:00Z',
              'creator': {
                'id': 'user3',
                'name': 'Carol',
                'avatarURL': 'https://example.com/avatar3.png'
              },
              'organization': {'id': 'org2'},
              'attachments': [
                {
                  'id': 'att4',
                  'fileHash': 'jkl012',
                  'mimeType': 'image/gif',
                  'name': 'funny.gif',
                  'objectName': 'funny_2025.gif'
                }
              ]
            },
            'cursor': 'cursor3'
          },
          {
            'node': {
              'id': 'post4',
              'caption': 'Second Page Post 2',
              'upVotesCount': 2,
              'downVotesCount': 2,
              'commentsCount': 1,
              'createdAt': '2025-06-18T16:30:00Z',
              'creator': {
                'id': 'user4',
                'name': 'Dave',
                'avatarURL': 'https://example.com/avatar4.png'
              },
              'organization': {'id': 'org1'},
              'attachments': [
                {
                  'id': 'att5',
                  'fileHash': 'mno345',
                  'mimeType': 'image/png',
                  'name': 'slide.png',
                  'objectName': 'slide_2025.png'
                }
              ]
            },
            'cursor': 'cursor4'
          }
        ],
        'pageInfo': {
          'endCursor': 'cursor4',
          'hasNextPage': false,
          'hasPreviousPage': true,
          'startCursor': 'cursor3'
        }
      }
    }
  };
  const currentOrgID = 'org1';
  const postID = '65e1aac38836aa003e4b8318';

  group('Test PostService', () {
    test('deletePost', () {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = PostQueries().getPostsByOrgID();
      when(
        dataBaseMutationFunctions.gqlAuthQuery(query, variables: {
          'orgID': currentOrgID,
          'after': null,
          'before': null,
          'first': 5,
          'last': null,
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          PostQueries().deletePost(),
          variables: {
            'id': 'azad',
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(PostQueries().deletePost())),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );
      final service = PostService();
      final post = Post(id: 'id', creator: User(id: 'azad'));
      service.deletePost(post);
    });
    test('Test refreshFeed method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsByOrgID();
      //Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      final service = PostService();

      await service.refreshFeed();
      verify(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
        ),
      ).called(1);
    });

    test('Test addNewPost method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = PostQueries().getPostsByOrgID();
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
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
      service.addNewpost(Post(id: '1', creator: User()));

      final List<Post> posts = await service.postStream.first;
      expect(posts.length, 3);
    });
    test('Test getPosts Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      //Setting up Demo data to be returned
      final query = PostQueries().getPostsByOrgID();
      when(
        dataBaseMutationFunctions.gqlAuthQuery(query, variables: {
          'orgID': currentOrgID,
          'after': null,
          'before': null,
          'first': 5,
          'last': null,
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );
      locator.unregister<PostService>();
      locator.registerSingleton<PostService>(PostService());
      final service = locator<PostService>();

      final orgFeedViewModel = OrganizationFeedViewModel();
      orgFeedViewModel.initialise(isTest: true);

      // // print(service.st)

      await service.getPosts();
      // //Fetching Post Stream
      // final List<Post> posts = await service.postStream.first;
      // //Testing if Two Mock posts got added
      // expect(posts.length, 2);
    });

    test('Test addCommentLocally Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsByOrgID();
      //Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
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
          posts.firstWhere((element) => element.id == postID);
      //Testing if the post got a comment
      expect(commentedPost.commentsCount, 1);
    });
    test('Test updatedPostStream Stream', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsByOrgID();
      // Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          PostQueries().addLike(),
          variables: {"postID": postID},
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(
            document: gql(
              PostQueries().addLike(),
            ),
          ),
          data: null,
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

      // Wait for the stream to emit values
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Adjust the delay as needed

      // Verify that the correct post was emitted
      expect(updatedPosts.length, 1);
      expect(updatedPosts[0].id, postID);
      // Cancel the subscription to avoid memory leaks
      await subscription.cancel();
    });
    test(
        'Test setOrgStreamSubscription method after the organization is updated',
        () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final queryNewOrg = PostQueries().getPostsByOrgID();

      final query = PostQueries().getPostsByOrgID();
      // Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
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
          queryNewOrg,
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

      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          queryNewOrg,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      await service.getPosts();

      // Verify that refresh token was called to check getPost method was called correctly.
      verify(
        dataBaseMutationFunctions.gqlAuthQuery(
          queryNewOrg,
        ),
      ).called(2);

      // Close the stream controller to avoid memory leaks
      await orgInfoStreamController.close();
    });
    test("Test the nextPage  and previous page funcitonality", () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = PostQueries().getPostsByOrgID();
      // Mocking GetPosts
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': null,
            'first': 5,
            'last': null,
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );
      final query2 = PostQueries().getPostsByOrgID();
      when(
        dataBaseMutationFunctions.gqlAuthQuery(query2, variables: {
          'orgID': currentOrgID,
          'after': '6589bd9b2caa9d8d6908750f',
          'before': null,
          'first': 5,
          'last': null,
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query2)),
          data: demoJsonPage2,
          source: QueryResultSource.network,
        ),
      );

      final service = PostService();
      // Populating posts Stream
      await service.getPosts();
      //Fetching next posts
      await service.nextPage();
      expect(service.after, "6589bd9b2caa9d8d6908750f");
      expect(service.first, 5);
      expect(service.before, null);
      expect(service.last, null);
      verify(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
        ),
      );

      final query3 = PostQueries().getPostsByOrgID();
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query3,
          variables: {
            'orgID': currentOrgID,
            'after': null,
            'before': '65e1aac38836aa003e4b8319',
            'first': null,
            'last': 5,
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query2)),
          data: demoJsonPage2,
          source: QueryResultSource.network,
        ),
      );

      await service.previousPage();
      expect(service.after, null);
      expect(service.last, 5);
      expect(service.before, "65e1aac38836aa003e4b8319");
      expect(service.first, null);
      verify(
        dataBaseMutationFunctions.gqlAuthQuery(
          query3,
        ),
      );
    });
  });
}
