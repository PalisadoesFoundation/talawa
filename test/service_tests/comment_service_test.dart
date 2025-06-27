import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/comment_queries.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  group('Test for get comment function', () {
    setUpAll(() {
      registerServices();
    });
    tearDownAll(() {
      unregisterServices();
    });
    test('test for createComments when throws exception', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = CommentQueries().createComment();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(query,
            variables: anyNamed('variables')),
      ).thenThrow(Exception('Your error message here'));

      final service = CommentService();

      await service.createComments(
        'post id',
        'body!',
      );

      verify(
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        ),
      ).called(1);
    });
    test('getCommentsForPost returns empty when commentsData is null',
        () async {
      // Simulate result.data['post']['comments'] == null
      final queryResult = QueryResult(
        data: {
          'post': {
            'comments': null,
          }
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql('')),
      );

      final query = CommentQueries().getPostsComments();

      final variables = {
        'postId': 'postID',
        'first': 10,
        'after': null,
        'last': null,
        'before': null,
      };

      when(databaseFunctions.gqlAuthMutation(query, variables: variables))
          .thenAnswer((_) async => queryResult);
      final service = CommentService();

      final result = await service.getCommentsForPost(postId: 'postID');
      expect(result, isNotNull);
      expect(result['comments'], []);
      expect(result['pageInfo'], {});
    });
    test(
        'getCommentsForPost returns empty map and shows error when gqlAuthMutation throws',
        () async {
      final databaseFunctions = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().getPostsComments();

      final variables = {
        'postId': 'test',
        'first': 10,
        'after': null,
        'last': null,
        'before': null,
      };

      when(databaseFunctions.gqlAuthMutation(query, variables: variables))
          .thenThrow(Exception('Network error'));
      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'test');

      verify(navigationService.showTalawaErrorSnackBar(
        "Something went wrong while fetching comments",
        MessageType.error,
      )).called(1);

      expect(result, {'comments': [], 'pageInfo': {}});
    });
    test('test for getCommentsForPost', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final String getCommmentQuery = CommentQueries().getPostsComments();
      final mockResult = QueryResult(
        data: {
          'post': {
            'comments': {
              'edges': [
                {
                  'node': {'id': '1', 'body': 'test'}
                }
              ],
              'pageInfo': {'hasNextPage': false}
            }
          }
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(getCommmentQuery)),
      );
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery,
            variables: anyNamed('variables')),
      ).thenAnswer((_) async => mockResult);

      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'test');

      expect(result['comments'], isNotEmpty);
      expect(result['pageInfo'], contains('hasNextPage'));
    });

    //////this needs to be further tested with more complex data structures
    test('test for zero comments on post', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommmentQuery = CommentQueries().getPostsComments();
      when(dataBaseMutationFunctions.gqlAuthMutation(
        getCommmentQuery,
        variables: anyNamed('variables'),
      )).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: {
            'post': {
              'comments': {
                'edges': [],
                'pageInfo': {},
              },
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'Ayushs postid');

      expect(result['comments'], isEmpty);
      expect(result['pageInfo'], isEmpty);
    });

    test('test when post is null', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommentQuery = CommentQueries().getPostsComments();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommentQuery,
            variables: anyNamed('variables')),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommentQuery)),
          data: {
            'post': null,
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'Ayushs postid');

      expect(result['comments'], isEmpty);
      expect(result['pageInfo'], isEmpty);
    });

    test('test when result is null', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommentQuery = CommentQueries().getPostsComments();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommentQuery,
            variables: anyNamed('variables')),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommentQuery)),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'Ayushs postid');

      expect(result['comments'], isEmpty);
      expect(result['pageInfo'], isEmpty);
    });
    test('test for createComments', () async {
      final query = CommentQueries().createComment();
      when(
        databaseFunctions.gqlAuthMutation(query,
            variables: anyNamed('variables')),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'text': 'hey Ayush here!',
            'postId': 'ayush post',
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();

      await service.createComments(
        'post id',
        'body:hey Ayush here!',
      );
    });
  });
}
