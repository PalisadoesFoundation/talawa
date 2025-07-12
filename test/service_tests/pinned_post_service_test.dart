import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/pinned_post_service.dart';
import 'package:talawa/utils/pinned_post_queries.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  setUp(() {
    testSetupLocator();
    registerServices();
  });
  tearDown(() {
    locator.reset();
  });

  test('pinnedPosts getter returns internal pinnedPosts list', () {
    // Arrange
    final pinnedPostService = PinnedPostService();

    // Act & Assert - Test initial state
    expect(pinnedPostService.pinnedPosts, isA<List<Post>>());
    expect(pinnedPostService.pinnedPosts, isEmpty);

    // The getter should return the same reference as the internal list
    final currentPosts = pinnedPostService.pinnedPosts;
    expect(identical(currentPosts, pinnedPostService.pinnedPosts), isTrue);
  });

  test('fetchDataFromApi returns pinned posts if data is valid', () async {
    final dbFunctions = locator<DataBaseMutationFunctions>();
    final pinnedPostService = PinnedPostService();

    final query = PinnedPostQueries().getPinnedPostsByOrgID();

    final postsData = {
      'organization': {
        'pinnedPosts': {
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
                'caption': 'Pinned Post',
              },
            }
          ],
        },
      },
    };

    when(dbFunctions.gqlAuthQuery(query, variables: anyNamed('variables')))
        .thenAnswer(
      (_) async => QueryResult(
        options: QueryOptions(document: gql(query)),
        data: postsData,
        source: QueryResultSource.network,
      ),
    );

    final posts = await pinnedPostService.fetchDataFromApi();
    expect(posts, isA<List<Post>>());
    expect(posts.first.caption, 'Pinned Post');
    expect(posts.first.isPinned, true);
  });
  test('fetchDataFromApi throws if organization is missing', () {
    final mockDbFunctions = locator<DataBaseMutationFunctions>();
    final service = PinnedPostService();

    final query = PinnedPostQueries().getPinnedPostsByOrgID();

    when(mockDbFunctions.gqlAuthQuery(query, variables: anyNamed('variables')))
        .thenAnswer(
      (_) async => QueryResult(
        options: QueryOptions(document: gql('')),
        data: {}, // No 'organization' key
        source: QueryResultSource.network,
      ),
    );

    expect(
      () async => await service.fetchDataFromApi(),
      throwsA(
        predicate(
          (e) =>
              e is Exception && e.toString().contains('Organization not found'),
        ),
      ),
    );
  });
  test(
      'setOrgStreamSubscription updates _currentOrg when stream emits new value',
      () async {
    final dbFunctions = locator<DataBaseMutationFunctions>();
    final pinnedPostsQuery = PinnedPostQueries().getPinnedPostsByOrgID();

    final pinnedPostsVariables = {
      'orgId': '1',
      'first': 10,
      'after': null,
      'before': null,
      'last': null,
    };

    final pinnedPostsData = {
      'organization': {
        'pinnedPosts': {
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
    when(
      dbFunctions.gqlAuthQuery(
        pinnedPostsQuery,
        variables: pinnedPostsVariables,
      ),
    ).thenAnswer(
      (_) async => QueryResult(
        options: QueryOptions(document: gql(pinnedPostsQuery)),
        data: pinnedPostsData,
        source: QueryResultSource.network,
      ),
    );

    userConfig.initialiseStream();

    final postService = PinnedPostService();
    postService.setOrgStreamSubscription();

    final orgInfo2 = OrgInfo(name: 'Organization temp', id: '1');
    userConfig.currentOrgInfoController.add(orgInfo2);
    await Future.delayed(const Duration(milliseconds: 100));
    expect(postService.currentOrg.name, 'Organization temp');
    expect(postService.currentOrg.id, '1');
  });

  test('fetchPostsInitial loads cached data, adds to stream, then refreshes',
      () async {
    // Arrange
    final pinnedPostService = PinnedPostService();

    final List<List<Post>> streamEvents = [];
    final subscription = pinnedPostService.pinnedPostStream.listen((posts) {
      streamEvents.add(List.from(posts));
    });

    final query = PinnedPostQueries().getPinnedPostsByOrgID();
    // Mock the GraphQL query response
    when(
      databaseFunctions.gqlAuthQuery(
        query,
        variables: {
          'orgId': 'XYZ',
          'first': 10,
          'after': null,
          'before': null,
          'last': null,
        },
      ),
    ).thenAnswer((_) async {
      return QueryResult(
        source: QueryResultSource.network,
        data: {
          'organization': {
            'pinnedPosts': {
              'edges': [
                {
                  'node': {
                    'id': 'post1',
                    'caption': 'Test pinned post',
                    'upVotesCount': 5,
                    'downVotesCount': 1,
                    'commentsCount': 3,
                    'createdAt': '2023-01-01T00:00:00.000Z',
                    'creator': {
                      'id': 'user1',
                      'name': 'Test User',
                      'avatarURL': null,
                    },
                    'organization': {
                      'id': 'org1',
                    },
                    'attachments': [],
                  },
                }
              ],
              'pageInfo': {
                'startCursor': 'cursor1',
                'endCursor': 'cursor1',
                'hasNextPage': false,
                'hasPreviousPage': false,
              },
            },
          },
        },
        options: QueryOptions(document: gql(query)),
      );
    });

    // Act
    await pinnedPostService.fetchPostsInitial();

    // Allow time for async operations
    await Future.delayed(const Duration(milliseconds: 100));

    // Assert
    expect(streamEvents.length, greaterThanOrEqualTo(1));

    // Verify the GraphQL query was called
    verify(
      databaseFunctions.gqlAuthQuery(
        query,
        variables: {
          'orgId': 'XYZ',
          'first': 10,
          'after': null,
          'before': null,
          'last': null,
        },
      ),
    ).called(1);

    // Cleanup
    await subscription.cancel();
  });
  test('fetchDataFromApi throws if pinnedPosts is missing', () {
    final mockDbFunctions = locator<DataBaseMutationFunctions>();
    final service = PinnedPostService();
    final query = PinnedPostQueries().getPinnedPostsByOrgID();

    when(mockDbFunctions.gqlAuthQuery(query, variables: anyNamed('variables')))
        .thenAnswer(
      (_) async => QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'organization': {
            'id': 'org1',
            // No 'pinnedPosts' key
          },
        },
        source: QueryResultSource.network,
      ),
    );

    expect(
      () async => await service.fetchDataFromApi(),
      throwsA(
        predicate(
          (e) =>
              e is Exception && e.toString().contains('Pinned posts not found'),
        ),
      ),
    );
  });
}
