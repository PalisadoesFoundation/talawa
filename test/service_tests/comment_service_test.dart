// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
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
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: {
            'postId': 'ayush post', //Add your variables here
            'text': 'hey Ayush here!'
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
    test('test for getCommentsForPost', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();

      final String getCommmentQuery =
          CommentQueries().getPostsComments('Ayush s postid');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(getCommmentQuery),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(getCommmentQuery)),
          data: {
            'commentsByPost': [
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
            ]
          },
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();

      final result = await service.getCommentsForPost('Ayush s postid');

      print(result);
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
          CommentQueries().getPostsComments('Ayush');
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

      final result = await service.getCommentsForPost('Ayush');

      print(result);
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
