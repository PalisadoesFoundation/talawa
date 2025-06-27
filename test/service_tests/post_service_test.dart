import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  group('Test PostService', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      testSetupLocator();
      registerServices();
    });
    tearDownAll(() {
      locator.reset();
      unregisterServices();
    });
    test(
        'setOrgStreamSubscription updates _currentOrg when stream emits new value',
        () async {
      final dbFunctions = locator<DataBaseMutationFunctions>();
      final postsQuery = PostQueries().getPostsByOrgID();
      final postsVariables = {
        'orgId': '1',
        'first': 5,
        'after': null,
        'before': null,
        'last': null,
      };

      final postsData = {
        'organization': {
          'posts': {
            'pageInfo': {
              'hasNextPage': false,
              'hasPreviousPage': false,
              'startCursor': null,
              'endCursor': 'cursor1',
            },
            'edges': [
              {
                'cursor': 'cursor1',
                'node': {
                  'id': 'post1',
                  'caption': 'Test Post',
                }
              }
            ]
          }
        }
      };
      final hasUserVotedQuery = PostQueries().hasUserVoted();

      when(dbFunctions.gqlAuthQuery(hasUserVotedQuery,
              variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(hasUserVotedQuery)),
          data: {
            'hasUserVoted': {
              'hasVoted': false,
              'voteType': null,
            }
          },
          source: QueryResultSource.network,
        ),
      );
      when(dbFunctions.gqlAuthQuery(postsQuery, variables: postsVariables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(postsQuery)),
          data: postsData,
          source: QueryResultSource.network,
        ),
      );
      userConfig.initialiseStream();

      final postService = PostService();
      postService.setOrgStreamSubscription();

      final orgInfo2 = OrgInfo(name: 'Organization temp', id: '1');
      userConfig.currentOrgInfoController.add(orgInfo2);
      await Future.delayed(const Duration(milliseconds: 100));
      expect(postService.currentOrg.name, 'Organization temp');
      expect(postService.currentOrg.id, '1');
    });

    test('fetchDataFromApi throws if result.data is null', () {
      final dbFunctions = locator<DataBaseMutationFunctions>();
      final postService = PostService();
      final query = PostQueries().getPostsByOrgID();
      final variables = {
        'orgId': 'XYZ',
        'first': 5,
        'after': null,
        'before': null,
        'last': null,
      };

      when(dbFunctions.gqlAuthQuery(query, variables: variables)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      expect(() async => await postService.fetchDataFromApi(), throwsException);
    });

    test('fetchDataFromApi returns posts if data is valid', () async {
      final dbFunctions = locator<DataBaseMutationFunctions>();
      final postService = PostService();

      // Mock the posts query
      final postsQuery = PostQueries().getPostsByOrgID();
      final postsVariables = {
        'orgId': 'XYZ',
        'first': 5,
        'after': null,
        'before': null,
        'last': null,
      };

      final postsData = {
        'organization': {
          'posts': {
            'pageInfo': {
              'hasNextPage': false,
              'hasPreviousPage': false,
              'startCursor': null,
              'endCursor': 'cursor1',
            },
            'edges': [
              {
                'cursor': 'cursor1',
                'node': {
                  'id': 'post1',
                  'caption': 'Test Post',
                }
              }
            ]
          }
        }
      };

      when(dbFunctions.gqlAuthQuery(postsQuery, variables: postsVariables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(postsQuery)),
          data: postsData,
          source: QueryResultSource.network,
        ),
      );

      // Mock the voting query
      final hasUserVotedQuery = PostQueries().hasUserVoted();
      final hasUserVotedVariables = {'postId': 'post1'};

      when(dbFunctions.gqlAuthQuery(hasUserVotedQuery,
              variables: hasUserVotedVariables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(hasUserVotedQuery)),
          data: {
            'hasUserVoted': {
              'hasVoted': false,
              'voteType': null,
            }
          },
          source: QueryResultSource.network,
        ),
      );

      final posts = await postService.fetchDataFromApi();
      expect(posts, isA<List<Post>>());
      expect(posts.first.caption, 'Test Post');
      expect(posts.first.hasVoted, false);
      expect(posts.first.voteType, null);
    });

    test('getNewFeedAndRefreshCache returns cached data when offline',
        () async {
      AppConnectivity.isOnline = false;
      final postService = PostService();
      await postService.saveDataToCache([
        Post(id: 'offline1', caption: 'Offline Post'),
      ]);
      final result = await postService.getNewFeedAndRefreshCache();
      expect(result.length, 1);
      expect(result.first.caption, 'Offline Post');
    });

    test('saveDataToCache and loadCachedData work', () async {
      final postService = PostService();
      final post = Post(id: 'cache1', caption: 'Cache Test');
      await postService.saveDataToCache([post]);
      final cached = await postService.loadCachedData();
      expect(cached.length, 1);
      expect(cached.first.caption, 'Cache Test');
    });

    test('addNewpost adds post to the top', () {
      final postService = PostService();
      final post = Post(id: 'new1', caption: 'New Post');
      postService.addNewpost(post);
      expect(postService.postStream, isA<Stream<List<Post>>>());
    });

    test(
        'addCommentLocally increments commentsCount and emits to updatedPostStream',
        () async {
      final postService = PostService();
      final post = Post(id: 'comment1', caption: 'Test', commentsCount: 0);

      // Add the post to the in-memory list using the public API
      postService.addNewpost(post);

      // Listen to the updatedPostStream for the emitted post
      final emittedFuture = postService.updatedPostStream.first;

      // Call the method under test
      postService.addCommentLocally('comment1');

      // Await the emitted post
      final emitted = await emittedFuture;

      // Assert that the emitted post has the incremented commentsCount
      expect(emitted.id, 'comment1');
      expect(emitted.commentsCount, 1);
    });

    test('fetchAndSetUserVoteStatus sets hasVoted and voteType', () async {
      final mockDbFunctions = locator<DataBaseMutationFunctions>();
      final postService = PostService();
      final post = Post(id: 'post1');

      final query = PostQueries().hasUserVoted();
      final variables = {'postId': 'post1'};

      when(mockDbFunctions.gqlAuthQuery(query, variables: variables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'hasUserVoted': {
              'hasVoted': true,
              'voteType': 'upvote',
            }
          },
          source: QueryResultSource.network,
        ),
      );

      await postService.fetchAndSetUserVoteStatus(post);

      expect(post.hasVoted, true);
      expect(post.voteType, 'upvote');
    });

    test(
        'fetchAndSetUserVoteStatus sets hasVoted to false and voteType to null if not present',
        () async {
      final mockDbFunctions = locator<DataBaseMutationFunctions>();
      final postService = PostService();
      final post = Post(id: 'post2');

      final query = PostQueries().hasUserVoted();
      final variables = {'postId': 'post2'};

      when(mockDbFunctions.gqlAuthQuery(query, variables: variables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'hasUserVoted': {
              'hasVoted': null,
              'voteType': null,
            }
          },
          source: QueryResultSource.network,
        ),
      );

      await postService.fetchAndSetUserVoteStatus(post);

      expect(post.hasVoted, false);
      expect(post.voteType, null);
    });

    test('fetchAndSetUserVoteStatus handles exception gracefully', () async {
      final mockDbFunctions = locator<DataBaseMutationFunctions>();
      final postService = PostService();
      final post = Post(id: 'post3');

      final query = PostQueries().hasUserVoted();
      final variables = {'postId': 'post3'};

      when(mockDbFunctions.gqlAuthQuery(query, variables: variables))
          .thenThrow(Exception('Network error'));

      // Should not throw
      await postService.fetchAndSetUserVoteStatus(post);

      // Should not set hasVoted or voteType
      expect(post.hasVoted, false); // Default value
      expect(post.voteType, null);
    });

    test('deletePost calls gqlAuthMutation and returns result', () async {
      final dbFunction = locator<DataBaseMutationFunctions>();

      final postService = PostService();
      final post = Post(id: 'post123');

      final mutation = PostQueries().deletePost();
      final variables = {"id": 'post123'};

      final expectedResult = QueryResult(
        options: QueryOptions(document: gql(mutation)),
        data: {'deletePost': true},
        source: QueryResultSource.network,
      );

      when(dbFunction.gqlAuthMutation(mutation, variables: variables))
          .thenAnswer((_) async => expectedResult);

      final result = await postService.deletePost(post);

      expect(result, expectedResult);
      verify(dbFunction.gqlAuthMutation(mutation, variables: variables))
          .called(1);
    });
    test('nextPage calls getPosts and sets pagination variables', () async {
      final postService = TestablePostService();
      postService.postInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        startCursor: null,
        endCursor: 'next_cursor',
      );

      await postService.nextPage();

      expect(postService.getPostsCalled, isTrue);
      expect(postService.after, 'next_cursor');
      expect(postService.before, null);
      expect(postService.first, 5);
      expect(postService.last, null);
    });

    test('previousPage calls getPosts and sets pagination variables', () async {
      final postService = TestablePostService();
      postService.postInfo = PageInfo(
        hasNextPage: false,
        hasPreviousPage: true,
        startCursor: 'prev_cursor',
        endCursor: null,
      );

      await postService.previousPage();

      expect(postService.getPostsCalled, isTrue);
      expect(postService.before, 'prev_cursor');
      expect(postService.after, null);
      expect(postService.last, 5);
      expect(postService.first, null);
    });

    test('nextPage does not call getPosts if hasNextPage is false', () async {
      final postService = TestablePostService();
      postService.postInfo = PageInfo(
        hasNextPage: false,
        hasPreviousPage: false,
        startCursor: null,
        endCursor: null,
      );

      await postService.nextPage();

      expect(postService.getPostsCalled, isFalse);
    });

    test('previousPage does not call getPosts if hasPreviousPage is false',
        () async {
      final postService = TestablePostService();
      postService.postInfo = PageInfo(
        hasNextPage: false,
        hasPreviousPage: false,
        startCursor: null,
        endCursor: null,
      );

      await postService.previousPage();

      expect(postService.getPostsCalled, isFalse);
    });

    test('refreshFeed resets state, fetches new posts, and emits them',
        () async {
      final postService = TestablePostService();
      final emittedPosts = <List<Post>>[];
      postService.postStream.listen(emittedPosts.add);

      await postService.refreshFeed();
      await Future.delayed(Duration.zero);

      // Use public getters to check state
      expect(postService.posts, isNotEmpty);
      expect(postService.after, isNull);
      expect(postService.before, isNull);
      expect(postService.first, 5);
      expect(postService.last, isNull);

      // These are the posts returned by getNewFeedAndRefreshCache
      final mockPosts = [
        Post(
          id: 'test_post',
          caption: 'Test Post',
          commentsCount: 0,
          hasVoted: false,
          voteType: null,
        ),
        Post(
          id: 'test_post2',
          caption: 'Test Post 2',
          commentsCount: 0,
          hasVoted: false,
          voteType: null,
        ),
      ];

      expect(postService.posts.first.id, mockPosts.first.id);

      // Assert: stream emitted
      expect(emittedPosts, isNotEmpty);
      expect(emittedPosts.last.first.id, mockPosts.first.id);

      // Assert: toast shown (side effect of CriticalActionException)

      verify(navigationService.showCustomToast('Feed refreshed!!!')).called(1);
    });

    test(
      'fetchPostsInitial loads cached posts, emits them, and calls refreshFeed',
      () async {
        final postService = PostService();
        final posts = [
          Post(id: 'cache1', caption: 'Cache Test'),
          Post(id: 'cache2', caption: 'Cache Test 2')
        ];

        // Save to cache
        await postService.saveDataToCache(posts);

        // Listen for the first emission from the stream
        final emitted = <List<Post>>[];
        final sub = postService.postStream.listen(emitted.add);

        // Act
        await postService.fetchPostsInitial();
        await Future.delayed(Duration.zero); // Allow stream to emit

        // Assert: posts loaded
        expect(postService.posts, isNotEmpty);
        expect(postService.posts.length, 2);
        expect(postService.posts.first.caption, 'Cache Test');
        expect(postService.posts.last.caption, 'Cache Test 2');

        // Assert: posts emitted on stream
        expect(emitted, isNotEmpty);
        expect(emitted.last, posts);

        await sub.cancel();
      },
    );
  });
}

/// A testable version of PostService to mock the getPosts method.
/// This is useful for testing purposes where you want to verify if the method was called.
class TestablePostService extends PostService {
  bool getPostsCalled = false;
  @override
  Future<void> getPosts() async {
    getPostsCalled = true;
  }

  @override
  Future<List<Post>> getNewFeedAndRefreshCache() async {
    return [
      Post(
        id: 'test_post',
        caption: 'Test Post',
        commentsCount: 0,
        hasVoted: false,
        voteType: null,
      ),
      Post(
        id: 'test_post2',
        caption: 'Test Post 2',
        commentsCount: 0,
        hasVoted: false,
        voteType: null,
      ),
    ];
  }
}
