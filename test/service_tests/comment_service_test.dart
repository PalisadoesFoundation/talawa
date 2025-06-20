import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/comment_queries.dart';
import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group('test for comment servicce', () {
    test('test for createComments', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = CommentQueries().createComment();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(query,
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
  });
}
