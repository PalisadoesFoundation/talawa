import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
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
              }
            }
          ]
        }
      }
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
        .thenAnswer((_) async => QueryResult(
              options: QueryOptions(document: gql('')),
              data: {}, // No 'organization' key
              source: QueryResultSource.network,
            ));

    expect(
      () async => await service.fetchDataFromApi(),
      throwsA(predicate((e) =>
          e is Exception && e.toString().contains('Organization not found'))),
    );
  });

  test('fetchDataFromApi throws if pinnedPosts is missing', () {
    final mockDbFunctions = locator<DataBaseMutationFunctions>();
    final service = PinnedPostService();
    final query = PinnedPostQueries().getPinnedPostsByOrgID();

    when(mockDbFunctions.gqlAuthQuery(query, variables: anyNamed('variables')))
        .thenAnswer((_) async => QueryResult(
              options: QueryOptions(document: gql('')),
              data: {
                'organization': {
                  'id': 'org1',
                  // No 'pinnedPosts' key
                },
              },
              source: QueryResultSource.network,
            ));

    expect(
      () async => await service.fetchDataFromApi(),
      throwsA(predicate((e) =>
          e is Exception && e.toString().contains('Pinned posts not found'))),
    );
  });
}
