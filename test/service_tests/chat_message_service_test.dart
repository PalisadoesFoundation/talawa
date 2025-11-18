import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/chat_message_service.dart';
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

  group('ChatMessageService Tests', () {
    late ChatMessageService chatMessageService;
    late DataBaseMutationFunctions mockDataBaseMutationFunctions;

    setUp(() {
      chatMessageService = ChatMessageService();
      mockDataBaseMutationFunctions =
          test_locator.locator<DataBaseMutationFunctions>();
    });

    group('getChatDetails', () {
      test('fetches chat details successfully', () async {
        final query = ChatQueries().fetchChatMessagesByChatId();
        const chatId = 'chat123';

        when(
          mockDataBaseMutationFunctions.gqlAuthQuery(
            query,
            variables: {
              "input": {"id": chatId},
              "last": 15,
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'chat': {
                'id': chatId,
                'name': 'Test Chat',
                'description': 'Test Description',
                'createdAt': '2023-01-01T00:00:00.000Z',
                'updatedAt': '2023-01-01T00:00:00.000Z',
                'creator': {
                  'id': 'user1',
                  'name': 'Creator User',
                },
                'messages': {
                  'edges': [
                    {
                      'cursor': 'msg_cursor_1',
                      'node': {
                        'id': 'msg1',
                        'body': 'Hello World',
                        'creator': {
                          'id': 'user1',
                          'name': 'John Doe',
                        },
                        'createdAt': '2023-01-01T00:00:00.000Z',
                      },
                    }
                  ],
                  'pageInfo': {
                    'hasNextPage': true,
                    'hasPreviousPage': true,
                    'startCursor': 'msg_cursor_1',
                    'endCursor': 'msg_cursor_1',
                  },
                },
                'members': {
                  'pageInfo': {
                    'hasNextPage': false,
                    'hasPreviousPage': false,
                    'startCursor': null,
                    'endCursor': null,
                  },
                  'edges': [],
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMessageService.getChatDetails(chatId);

        expect(result, isNotNull);
        expect(result!.id, equals(chatId));
        expect(result.name, equals('Test Chat'));
        expect(result.messages, isNotNull);
        expect(result.messages!.length, equals(1));
        expect(result.messages![0].body, equals('Hello World'));

        // Check pagination info is set up
        expect(chatMessageService.hasMoreMessages(chatId), isTrue);
      });

      test('returns null on GraphQL exception', () async {
        final query = ChatQueries().fetchChatMessagesByChatId();
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
                const GraphQLError(message: 'Error fetching chat'),
              ],
            ),
          ),
        );

        final result = await chatMessageService.getChatDetails('chat123');

        expect(result, isNull);
      });

      test('returns null when chat data is null', () async {
        final query = ChatQueries().fetchChatMessagesByChatId();
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

        final result = await chatMessageService.getChatDetails('chat123');

        expect(result, isNull);
      });
    });

    group('loadMoreMessages', () {
      test('loads more messages successfully', () async {
        const chatId = 'chat123';
        const beforeCursor = 'cursor1';

        // First set up pagination info
        chatMessageService.beforeCursor[chatId] = beforeCursor;

        final query = ChatQueries().fetchChatMessagesByChatId();
        when(
          mockDataBaseMutationFunctions.gqlAuthQuery(
            query,
            variables: {
              "input": {"id": chatId},
              "last": 15,
              "before": beforeCursor,
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'chat': {
                'messages': {
                  'edges': [
                    {
                      'cursor': 'msg_cursor_old',
                      'node': {
                        'id': 'msg_old',
                        'body': 'Older message',
                        'creator': {
                          'id': 'user1',
                          'name': 'John Doe',
                        },
                        'createdAt': '2023-01-01T00:00:00.000Z',
                      },
                    }
                  ],
                  'pageInfo': {
                    'hasNextPage': false,
                    'hasPreviousPage': false,
                    'startCursor': 'msg_cursor_old',
                    'endCursor': 'msg_cursor_old',
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMessageService.loadMoreMessages(chatId);

        expect(result, isA<List<ChatMessage>>());
        expect(result.length, equals(1));
        expect(result[0].body, equals('Older message'));
      });

      test('returns empty list when no cursor available', () async {
        final result = await chatMessageService.loadMoreMessages('new_chat');

        expect(result, isEmpty);
      });

      test('returns empty list when cursor is empty', () async {
        const chatId = 'chat123';
        // Manually set empty cursor
        chatMessageService.beforeCursor[chatId] = '';

        final result = await chatMessageService.loadMoreMessages(chatId);

        expect(result, isEmpty);
      });
    });

    group('hasMoreMessages', () {
      test('returns true when pagination info shows more messages', () async {
        const chatId = 'chat123';

        // First, mock a query that sets up pagination
        final query = ChatQueries().fetchChatMessagesByChatId();
        when(
          mockDataBaseMutationFunctions.gqlAuthQuery(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'chat': {
                'id': chatId,
                'name': 'Test Chat',
                'messages': {
                  'nodes': [
                    {
                      'id': 'msg1',
                      'body': 'Hello World',
                      'sender': {
                        'id': 'user1',
                        'firstName': 'Test',
                        'lastName': 'User',
                      },
                      'createdAt': '2023-01-01T00:00:00Z',
                    }
                  ],
                  'pageInfo': {
                    'hasNextPage': false,
                    'hasPreviousPage':
                        true, // This makes hasMoreMessages return true
                    'startCursor': 'cursor1',
                    'endCursor': 'cursor2',
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        // Call getChatDetails to setup pagination info
        await chatMessageService.getChatDetails(chatId);

        // Now test hasMoreMessages
        final result = chatMessageService.hasMoreMessages(chatId);

        expect(result, isTrue);
      });

      test('returns false when no pagination info', () {
        final result = chatMessageService.hasMoreMessages('unknown_chat');

        expect(result, isFalse);
      });
    });

    group('sendMessage', () {
      test('sends message successfully', () async {
        final query = ChatQueries().createChatMessage();
        const chatId = 'chat123';
        const messageBody = 'Hello World';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "chatId": chatId,
                "body": messageBody,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'createChatMessage': {
                'id': 'msg123',
                'body': messageBody,
                'creator': {
                  'id': 'user1',
                  'name': 'John Doe',
                },
                'createdAt': '2023-01-01T00:00:00.000Z',
                'updatedAt': '2023-01-01T00:00:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMessageService.sendMessage(
          chatId: chatId,
          body: messageBody,
        );

        expect(result, isNotNull);
        expect(result!.id, equals('msg123'));
        expect(result.body, equals(messageBody));
      });

      test('returns null on GraphQL exception', () async {
        final query = ChatQueries().createChatMessage();
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
                const GraphQLError(message: 'Error sending message'),
              ],
            ),
          ),
        );

        final result = await chatMessageService.sendMessage(
          chatId: 'chat123',
          body: 'Test message',
        );

        expect(result, isNull);
      });

      test('returns null when createChatMessage is null', () async {
        final query = ChatQueries().createChatMessage();
        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {'createChatMessage': null},
            source: QueryResultSource.network,
          ),
        );

        final result = await chatMessageService.sendMessage(
          chatId: 'chat123',
          body: 'Test message',
        );

        expect(result, isNull);
      });
    });

    group('subscribeToChatMessages', () {
      test('delegates to subscription service', () {
        const chatId = 'chat123';

        final result = chatMessageService.subscribeToChatMessages(chatId);

        expect(result, isA<Stream<ChatMessage>>());
      });
    });

    group('stopSubscription', () {
      test('delegates to subscription service', () {
        expect(() => chatMessageService.stopSubscription(), returnsNormally);
      });
    });

    group('pagination properties', () {
      test('messagePageSize has correct default value', () {
        expect(chatMessageService.messagePageSize, equals(15));
      });

      test('messagePageSize can be modified', () {
        chatMessageService.messagePageSize = 25;
        expect(chatMessageService.messagePageSize, equals(25));
      });

      test('beforeCursor can be accessed', () {
        const chatId = 'test_chat';
        chatMessageService.beforeCursor[chatId] = 'test_cursor';
        expect(chatMessageService.beforeCursor[chatId], equals('test_cursor'));
      });
    });

    group('disposal', () {
      test('dispose closes all streams and stops subscription', () {
        expect(() => chatMessageService.dispose(), returnsNormally);
      });
    });

    group('stream getters', () {
      test('chatMessagesStream returns stream from subscription service', () {
        final result = chatMessageService.chatMessagesStream;

        expect(result, isA<Stream<ChatMessage>>());
      });
    });
  });
}
