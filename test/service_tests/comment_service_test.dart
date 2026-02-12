import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/retry_queue.dart';
import 'package:talawa/utils/comment_queries.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  group('CommentService', () {
    late RetryQueue retryQueue;

    setUp(() {
      registerServices();
      // Replace the default RetryQueue with a fast one for tests
      if (locator.isRegistered<RetryQueue>()) {
        locator.unregister<RetryQueue>();
      }
      retryQueue = RetryQueue(
        config: RetryConfig(
          maxAttempts: 2,
          initialDelay: Duration(milliseconds: 1),
          maxDelay: Duration(milliseconds: 5),
        ),
      );
      locator.registerSingleton(retryQueue);
    });

    tearDown(() {
      retryQueue.cancelAll();
      if (locator.isRegistered<RetryQueue>()) {
        locator.unregister<RetryQueue>();
      }
      unregisterServices();
    });

    test('createComments returns Comment on success', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().createComment();
      final mockData = {
        'createComment': {
          'id': 'c1',
          'body': 'test',
        },
      };
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: mockData,
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      final result = await service.createComments('pid', 'body');
      expect(result, isNotNull);
      expect(result!.id, 'c1');
      expect(result.body, 'test');
    });

    test('createComments shows error and returns null on exception', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().createComment();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenThrow(Exception('fail'));
      final service = CommentService();
      final result = await service.createComments('pid', 'body');
      expect(result, isNull);
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Failed to send comment after retries",
          MessageType.error,
        ),
      ).called(1);
    });

    test('createComments returns null when mutation returns no data', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().createComment();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: null,
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      final result = await service.createComments('pid', 'body');
      expect(result, isNull);
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Failed to send comment after retries",
          MessageType.error,
        ),
      ).called(1);
    });

    test('getCommentsForPost returns comments and pageInfo', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().getPostsComments();
      final mockData = {
        'post': {
          'comments': {
            'edges': [
              {
                'node': {'id': '1', 'body': 'test'},
              },
            ],
            'pageInfo': {'hasNextPage': false},
          },
        },
      };
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: mockData,
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'pid');
      expect(result['comments'], isNotEmpty);
      expect(result['pageInfo'], contains('hasNextPage'));
    });

    test('getCommentsForPost returns empty if post is null', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().getPostsComments();
      final mockData = {'post': null};
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: mockData,
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'pid');
      expect(result['comments'], isEmpty);
      expect(result['pageInfo'], isEmpty);
    });

    test('getCommentsForPost returns empty if comments is null', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().getPostsComments();
      final mockData = {
        'post': {
          'comments': null,
        },
      };
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: mockData,
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'pid');
      expect(result['comments'], isEmpty);
      expect(result['pageInfo'], isEmpty);
    });

    test('getCommentsForPost returns empty and shows error on exception',
        () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().getPostsComments();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenThrow(Exception('fail'));
      final service = CommentService();
      final result = await service.getCommentsForPost(postId: 'pid');
      expect(result['comments'], isEmpty);
      expect(result['pageInfo'], isEmpty);
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong while fetching comments",
          MessageType.error,
        ),
      ).called(1);
    });

    test('toggleUpVoteComment calls gqlAuthMutation with correct variables',
        () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().updateVoteComment();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {},
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      await service.toggleUpVoteComment('cid', null, false);
      verify(
        db.gqlAuthMutation(
          query,
          variables: {
            'commentId': 'cid',
            'type': 'up_vote',
          },
        ),
      ).called(1);
      await service.toggleUpVoteComment('cid', VoteType.upVote, true);
      verify(
        db.gqlAuthMutation(
          query,
          variables: {
            'commentId': 'cid',
            'type': null,
          },
        ),
      ).called(1);
    });

    test('toggleDownVoteComment calls gqlAuthMutation with correct variables',
        () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().updateVoteComment();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {},
          source: QueryResultSource.network,
        ),
      );
      final service = CommentService();
      await service.toggleDownVoteComment('cid', null, false);
      verify(
        db.gqlAuthMutation(
          query,
          variables: {
            'commentId': 'cid',
            'type': 'down_vote',
          },
        ),
      ).called(1);
      await service.toggleDownVoteComment('cid', VoteType.downVote, true);
      verify(
        db.gqlAuthMutation(
          query,
          variables: {
            'commentId': 'cid',
            'type': null,
          },
        ),
      ).called(1);
    });

    test('toggleUpVoteComment handles errors gracefully', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().updateVoteComment();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenThrow(Exception('Network error'));
      final service = CommentService();

      // Should not throw, error is caught and logged
      await service.toggleUpVoteComment('cid', null, false);

      verify(
        db.gqlAuthMutation(
          query,
          variables: {
            'commentId': 'cid',
            'type': 'up_vote',
          },
        ),
      ).called(1);
    });

    test('toggleDownVoteComment handles errors gracefully', () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().updateVoteComment();
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenThrow(Exception('Network error'));
      final service = CommentService();

      // Should not throw, error is caught and logged
      await service.toggleDownVoteComment('cid', null, false);

      verify(
        db.gqlAuthMutation(
          query,
          variables: {
            'commentId': 'cid',
            'type': 'down_vote',
          },
        ),
      ).called(1);
    });

    test('createComments respects shouldRetry callback for auth errors',
        () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().createComment();

      // First call throws auth error, second succeeds
      var callCount = 0;
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer((_) async {
        callCount++;
        if (callCount == 1) {
          throw Exception('Authentication failed');
        }
        return QueryResult(
          options: QueryOptions(document: gql(query)),
          data: null,
          source: QueryResultSource.network,
        );
      });

      final service = CommentService();
      final result = await service.createComments('pid', 'body');

      // Should not retry auth errors, so only 1 call
      expect(callCount, 1);
      expect(result, isNull);
    });

    test('createComments shows success message on successful creation',
        () async {
      final db = locator<DataBaseMutationFunctions>();
      final query = CommentQueries().createComment();
      final mockData = {
        'createComment': {
          'id': 'c1',
          'body': 'test',
        },
      };
      when(db.gqlAuthMutation(query, variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: mockData,
          source: QueryResultSource.network,
        ),
      );

      final service = CommentService();
      final result = await service.createComments('pid', 'body');

      expect(result, isNotNull);
      // Note: showTalawaErrorSnackBar is the app's general-purpose snackbar
      // method used for all message types (info, error, etc.), not just errors.
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Comment sent",
          MessageType.info,
        ),
      ).called(1);
    });
  });
}
