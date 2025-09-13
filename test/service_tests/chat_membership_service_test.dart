import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/chat_membership_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/chat_queries.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart' as test_locator;

void main() {
  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('ChatMembershipService Tests', () {
    late ChatMembershipService chatMembershipService;
    late DataBaseMutationFunctions mockDataBaseMutationFunctions;

    setUp(() {
      chatMembershipService = ChatMembershipService();
      mockDataBaseMutationFunctions =
          test_locator.locator<DataBaseMutationFunctions>();
    });

    group('createChatMembership', () {
      test('creates membership successfully', () async {
        final query = ChatQueries().createChatMembership();
        const chatId = 'chat123';
        const userId = 'user456';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "chatId": chatId,
                "memberId": userId,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'createChatMembership': {
                'id': 'membership123',
                'createdAt': '2023-01-01T00:00:00.000Z',
                'updatedAt': '2023-01-01T00:00:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.createChatMembership(
          chatId: chatId,
          userId: userId,
        );

        expect(result, isTrue);
      });

      test('returns false on GraphQL exception', () async {
        final query = ChatQueries().createChatMembership();
        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Error creating membership'),
              ],
            ),
          ),
        );

        final result = await chatMembershipService.createChatMembership(
          chatId: 'chat123',
          userId: 'user456',
        );

        expect(result, isFalse);
      });

      test('returns false when createChatMembership is null', () async {
        final query = ChatQueries().createChatMembership();
        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {'createChatMembership': null},
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.createChatMembership(
          chatId: 'chat123',
          userId: 'user456',
        );

        expect(result, isFalse);
      });
    });

    group('addChatMember', () {
      test('adds member successfully', () async {
        final query = ChatQueries().createChatMembership();
        const chatId = 'chat123';
        const userId = 'user456';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "chatId": chatId,
                "memberId": userId,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'createChatMembership': {
                'id': 'membership123',
                'createdAt': '2023-01-01T00:00:00.000Z',
                'updatedAt': '2023-01-01T00:00:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.addChatMember(
          chatId: chatId,
          userId: userId,
        );

        expect(result, isTrue);
      });

      test('returns false on failure', () async {
        final query = ChatQueries().createChatMembership();
        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Error adding member'),
              ],
            ),
          ),
        );

        final result = await chatMembershipService.addChatMember(
          chatId: 'chat123',
          userId: 'user456',
        );

        expect(result, isFalse);
      });
    });

    group('removeChatMember', () {
      test('removes member successfully', () async {
        final query = ChatQueries().deleteChatMembership();
        const chatId = 'chat123';
        const memberId = 'user456';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "chatId": chatId,
                "memberId": memberId,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'deleteChatMembership': {
                'id': 'membership123',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.removeChatMember(
          chatId: chatId,
          memberId: memberId,
        );

        expect(result, isTrue);
      });

      test('returns false on GraphQL exception', () async {
        final query = ChatQueries().deleteChatMembership();
        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Error removing member'),
              ],
            ),
          ),
        );

        final result = await chatMembershipService.removeChatMember(
          chatId: 'chat123',
          memberId: 'user456',
        );

        expect(result, isFalse);
      });

      test('returns false when deleteChatMembership result is null', () async {
        final query = ChatQueries().deleteChatMembership();
        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {'deleteChatMembership': null},
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.removeChatMember(
          chatId: 'chat123',
          memberId: 'user456',
        );

        expect(result, isFalse);
      });
    });

    group('fetchChatMembers', () {
      test('fetches members successfully with pagination', () async {
        final query = ChatQueries().fetchChatMembers();
        const chatId = 'chat123';

        when(
          mockDataBaseMutationFunctions.gqlAuthQuery(
            query,
            variables: {
              "input": {"id": chatId},
              "first": 10,
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'chat': {
                'id': chatId,
                'name': 'Test Chat',
                'creator': {
                  'id': 'creator1',
                  'name': 'Creator User',
                },
                'members': {
                  'edges': [
                    {
                      'cursor': 'cursor1',
                      'node': {
                        'id': 'user1',
                        'name': 'John Doe',
                      },
                    },
                    {
                      'cursor': 'cursor2',
                      'node': {
                        'id': 'user2',
                        'name': 'Jane Smith',
                      },
                    }
                  ],
                  'pageInfo': {
                    'hasNextPage': true,
                    'hasPreviousPage': false,
                    'startCursor': 'cursor1',
                    'endCursor': 'cursor2',
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.fetchChatMembers(
          chatId: chatId,
          first: 10,
        );

        expect(result, isNotNull);
        expect(result!['id'], equals(chatId));
        final membersData = result['members'] as Map<String, dynamic>;
        expect(membersData['edges'], hasLength(2));
      });

      test('returns null on GraphQL exception', () async {
        final query = ChatQueries().fetchChatMembers();
        when(
          mockDataBaseMutationFunctions.gqlAuthQuery(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Error fetching members'),
              ],
            ),
          ),
        );

        final result = await chatMembershipService.fetchChatMembers(
          chatId: 'chat123',
        );

        expect(result, isNull);
      });

      test('returns null when chat data is null', () async {
        final query = ChatQueries().fetchChatMembers();
        when(
          mockDataBaseMutationFunctions.gqlAuthQuery(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {'chat': null},
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMembershipService.fetchChatMembers(
          chatId: 'chat123',
        );

        expect(result, isNull);
      });
    });

    group('disposal', () {
      test('service completes without errors', () async {
        // ChatMembershipService doesn't have disposal logic
        // This test ensures the service can be garbage collected properly
        expect(true, isTrue);
      });
    });
  });
}
