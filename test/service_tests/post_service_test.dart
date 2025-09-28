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
    });

    test(
        'setOrgStreamSubscription updates _currentOrg when stream emits new value',
        () async {
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
                },
              }
            ],
          },
        },
      };

      when(dbFunctions.gqlAuthQuery(postsQuery, variables: postsVariables))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(postsQuery)),
          data: postsData,
          source: QueryResultSource.network,
        ),
      );

      final posts = await postService.fetchDataFromApi();
      expect(posts, isA<List<Post>>());
      expect(posts.first.caption, 'Test Post');
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
    test('nextPage fetches new posts and appends them when hasNextPage is true',
        () async {
      final postService = TestablePostService();

      // Set up initial posts
      final initialPost = Post(id: 'initial', caption: 'Initial Post');
      postService.addNewpost(initialPost);

      // Set up pagination info
      postService.pageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        startCursor: null,
        endCursor: 'next_cursor',
      );

      final initialCount = postService.posts.length;
      await postService.nextPage();

      // Should have added new posts
      expect(postService.posts.length, greaterThan(initialCount));
      expect(postService.after, 'next_cursor');
      expect(postService.before, null);
      expect(postService.first, 5);
      expect(postService.last, null);
    });

    test('nextPage does not fetch posts if hasNextPage is false', () async {
      final postService = TestablePostService();

      // Set up initial posts
      final initialPost = Post(id: 'initial', caption: 'Initial Post');
      postService.addNewpost(initialPost);

      postService.pageInfo = PageInfo(
        hasNextPage: false,
        hasPreviousPage: false,
        startCursor: null,
        endCursor: null,
      );

      final initialCount = postService.posts.length;
      await postService.nextPage();

      // Should not have added new posts
      expect(postService.posts.length, equals(initialCount));
    });

    test(
      'fetchPostsInitial loads cached posts, emits them, and calls refreshFeed',
      () async {
        final postService = PostService();
        final posts = [
          Post(id: 'cache1', caption: 'Cache Test'),
          Post(id: 'cache2', caption: 'Cache Test 2'),
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

    test('toggleUpVote completes successfully', () async {
      final postService = PostService();
      final post = Post(id: 'test_post', hasVoted: false);

      // This should complete without throwing
      await expectLater(postService.toggleUpVote(post), completes);
    });

    test('refreshFeed prevents concurrent refreshes', () async {
      final postService = TestablePostService();
      final futures = <Future<void>>[];

      // Start multiple refresh operations concurrently
      for (int i = 0; i < 3; i++) {
        futures.add(postService.refreshFeed());
      }

      // All should complete without error
      await Future.wait(futures);

      // Posts should be set (not multiplied by concurrent calls)
      expect(postService.posts, isNotEmpty);
      expect(postService.posts.length, 2); // From TestablePostService mock
    });
  });
}

/// A testable version of PostService to mock the fetchDataFromApi method.
/// This is useful for testing purposes where you want to control the API response.
class TestablePostService extends PostService {
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

  @override
  Future<List<Post>> fetchDataFromApi() async {
    // Mock new posts for pagination
    return [
      Post(
        id: 'paginated_post_1',
        caption: 'Paginated Post 1',
        commentsCount: 0,
        hasVoted: false,
        voteType: null,
      ),
      Post(
        id: 'paginated_post_2',
        caption: 'Paginated Post 2',
        commentsCount: 0,
        hasVoted: false,
        voteType: null,
      ),
    ];
  }
}
