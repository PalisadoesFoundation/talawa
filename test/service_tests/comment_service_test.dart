import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/comment_queries.dart';
import 'package:talawa/utils/post_queries.dart';
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
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: {
            'postId': 'ayush post', //Add your variables here
            'text': 'hey Ayush here!',
          },
        ),
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
        'ayush post',
        'hey Ayush here!',
      );
    });
    test('test for createComments when throws exception', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final query = CommentQueries().createComment();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: {
            'postId': 'ayush post',
            'text': 'hey Ayush here!',
          },
        ),
      ).thenThrow(Exception('Your error message here'));

      final service = CommentService();

      await service.createComments(
        'ayush post',
        'hey Ayush here!',
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
      final String getCommmentQuery =
          PostQueries().getPostById('Ayush s postid');

      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: {
            'post': {
              'comments': [
                {
                  'creator': {
                    '_id': '123',
                    'firstName': 'John',
                    'lastName': 'Doe',
                    'email': 'test@test.com',
                  },
                  'createdAt': '123456',
                  'text': 'test text',
                  'post': 'test post',
                  'likeCount': 'test count',
                },
                {
                  'creator': {
                    '_id': '123',
                    'firstName': 'Ayush',
                    'lastName': 'Doe',
                    'email': 'test@test.com',
                  },
                  'createdAt': '123456',
                  'text': 'test text',
                  'post': 'test post',
                  'likeCount': 'test count',
                },
                {
                  'creator': {
                    '_id': '123',
                    'firstName': 'john',
                    'lastName': 'chauhdary',
                    'email': 'test@test.com',
                  },
                  'createdAt': '123456',
                  'text': 'test text',
                  'post': 'test post',
                  'likeCount': 'test count',
                }
              ],
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost('Ayush s postid');

      if (result.toString().contains('[{creator: '
          '{'
          '_id: 123, '
          'firstName: John, '
          'lastName: Doe, '
          'email: test@test.com},'
          ' createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: '
          '{_id: 123, '
          'firstName: Ayush, '
          'lastName: Doe, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: {_id: 123,'
          ' firstName: john, '
          'lastName: chauhdary, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}]')) {
      } else {
        fail('the result is not maatching');
      }
      expect(result, isNotEmpty);
    });
    test('test for getCommentsForPost for wrong post idd', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommmentQuery =
          PostQueries().getPostById('Ayush s postid');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: {
            'post': {
              'comments': [],
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost('Ayush postid');

      if (result.toString().contains('[{creator: '
          '{'
          '_id: 123, '
          'firstName: John, '
          'lastName: Doe, '
          'email: test@test.com},'
          ' createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: '
          '{_id: 123, '
          'firstName: Ayush, '
          'lastName: Doe, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: {_id: 123,'
          ' firstName: john, '
          'lastName: chauhdary, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}]')) {
        fail('the result is not maatching');
      }
      expect(result, isEmpty);
    });

    test('test for zero comments on post', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommmentQuery =
          PostQueries().getPostById('Ayush s postid');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: {
            'post': {'comments': []},
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost('Ayush postid');

      if (result.toString().contains('[{creator: '
          '{'
          '_id: 123, '
          'firstName: John, '
          'lastName: Doe, '
          'email: test@test.com},'
          ' createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: '
          '{_id: 123, '
          'firstName: Ayush, '
          'lastName: Doe, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: {_id: 123,'
          ' firstName: john, '
          'lastName: chauhdary, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}]')) {
        fail('the result is not maatching');
      }
      expect(result, isEmpty);
    });

    test('test when post is null', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommmentQuery =
          PostQueries().getPostById('Ayush s postid');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: {
            'post': null,
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost('Ayush postid');

      if (result.toString().contains('[{creator: '
          '{'
          '_id: 123, '
          'firstName: John, '
          'lastName: Doe, '
          'email: test@test.com},'
          ' createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: '
          '{_id: 123, '
          'firstName: Ayush, '
          'lastName: Doe, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: {_id: 123,'
          ' firstName: john, '
          'lastName: chauhdary, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}]')) {
        fail('the result is not maatching');
      }
      expect(result, isEmpty);
    });

    test('test when result is null', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommmentQuery =
          PostQueries().getPostById('Ayush s postid');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.getCommentsForPost('Ayush postid');

      if (result.toString().contains('[{creator: '
          '{'
          '_id: 123, '
          'firstName: John, '
          'lastName: Doe, '
          'email: test@test.com},'
          ' createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: '
          '{_id: 123, '
          'firstName: Ayush, '
          'lastName: Doe, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}, '
          '{creator: {_id: 123,'
          ' firstName: john, '
          'lastName: chauhdary, '
          'email: test@test.com}, '
          'createdAt: 123456, '
          'text: test text, '
          'post: test post, '
          'likeCount: test count}]')) {
        fail('the result is not maatching');
      }
      expect(result, isEmpty);
    });
  });
}
