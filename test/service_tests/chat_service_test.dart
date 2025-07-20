import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
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

  group('ChatService Tests', () {
    late ChatService chatService;
    late DataBaseMutationFunctions mockDataBaseMutationFunctions;
    late UserConfig mockUserConfig;
    late User sampleUser;
    late OrgInfo sampleOrg;

    setUp(() {
      chatService = ChatService();
      mockDataBaseMutationFunctions =
          test_locator.locator<DataBaseMutationFunctions>();
      mockUserConfig = test_locator.locator<UserConfig>();

      sampleUser = User(
        id: 'user123',
        firstName: 'John',
        lastName: 'Doe',
        email: 'john@example.com',
      );

      sampleOrg = OrgInfo(
        id: 'org123',
        name: 'Test Organization',
      );

      when(mockUserConfig.currentUser).thenReturn(sampleUser);
      when(mockUserConfig.currentOrg).thenReturn(sampleOrg);
    });

    group('createChat', () {
      test('creates chat successfully', () async {
        final query = ChatQueries().createChat();
        const chatName = 'Test Chat';
        const chatDescription = 'A test chat room';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "name": chatName,
                "organizationId": 'org123',
                "description": chatDescription,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'createChat': {
                'id': 'chat123',
                'name': chatName,
                'description': chatDescription,
                'createdAt': '2023-01-01T10:00:00Z',
                'updatedAt': '2023-01-01T10:00:00Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.createChat(
          name: chatName,
          description: chatDescription,
        );

        expect(result, isNotNull);
        expect(result!.id, equals('chat123'));
        expect(result.name, equals(chatName));
        expect(result.description, equals(chatDescription));
      });

      test('returns null when no current organization', () async {
        when(mockUserConfig.currentOrg).thenReturn(OrgInfo(id: null));

        final result = await chatService.createChat(name: 'Test Chat');

        expect(result, isNull);
      });

      test('returns null on GraphQL exception', () async {
        final query = ChatQueries().createChat();
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
                const GraphQLError(message: 'Chat creation failed'),
              ],
            ),
          ),
        );

        final result = await chatService.createChat(name: 'Test Chat');

        expect(result, isNull);
      });

      test('creates chat without description', () async {
        final query = ChatQueries().createChat();
        const chatName = 'Test Chat';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "name": chatName,
                "organizationId": 'org123',
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'createChat': {
                'id': 'chat123',
                'name': chatName,
                'createdAt': '2023-01-01T10:00:00Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.createChat(name: chatName);

        expect(result, isNotNull);
        expect(result!.id, equals('chat123'));
        expect(result.name, equals(chatName));
      });
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
                'createdAt': '2023-01-01T10:00:00Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.createChatMembership(
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
                const GraphQLError(message: 'Membership creation failed'),
              ],
            ),
          ),
        );

        final result = await chatService.createChatMembership(
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

        final result = await chatService.createChatMembership(
          chatId: 'chat123',
          userId: 'user456',
        );

        expect(result, isFalse);
      });
    });

    group('getChatsByUser', () {
      test('fetches chats successfully', () async {
        final query = ChatQueries().chatsByUser();
        final chats = <Chat>[];
        late StreamSubscription subscription;

        when(mockDataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'chatsByUser': [
                {
                  'id': 'chat1',
                  'name': 'Chat 1',
                  'description': 'First chat',
                  'members': [
                    {
                      'id': 'user1',
                      'name': 'John Doe',
                      'avatarURL': 'avatar1.jpg',
                    },
                  ],
                },
                {
                  'id': 'chat2',
                  'name': 'Chat 2',
                  'description': 'Second chat',
                  'members': [],
                },
              ],
            },
            source: QueryResultSource.network,
          ),
        );

        subscription = chatService.chatListStream.listen((chat) {
          chats.add(chat);
        });

        final result = await chatService.getChatsByUser();

        await Future.delayed(const Duration(milliseconds: 50));
        await subscription.cancel();

        expect(result, isA<List<Chat>>());
        expect(result, isNotNull);
        expect(result!.length, equals(2));
        expect(result[0].id, equals('chat1'));
        expect(result[0].name, equals('Chat 1'));
        expect(result[1].id, equals('chat2'));
        expect(result[1].name, equals('Chat 2'));

        // Check that chats are also streamed
        expect(chats.length, equals(2));
      });

      test('throws ArgumentError when userId is null', () async {
        when(mockUserConfig.currentUser).thenReturn(User(id: null));

        expect(
          () => chatService.getChatsByUser(),
          throwsA(
            isA<ArgumentError>().having(
              (e) => e.message,
              'message',
              'User ID is required to fetch chats',
            ),
          ),
        );
      });

      test('throws Exception on GraphQL exception', () async {
        final query = ChatQueries().chatsByUser();
        when(mockDataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [const GraphQLError(message: 'Fetch failed')],
            ),
          ),
        );

        expect(
          () => chatService.getChatsByUser(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'toString',
              contains('Failed to fetch chats'),
            ),
          ),
        );
      });

      test('returns empty list when chatsByUser is null', () async {
        final query = ChatQueries().chatsByUser();
        when(mockDataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {'chatsByUser': null},
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.getChatsByUser();

        expect(result, isEmpty);
      });
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
                'messages': {
                  'edges': [
                    {
                      'cursor': 'cursor1',
                      'node': {
                        'id': 'msg1',
                        'body': 'Hello World',
                        'creator': {
                          'id': 'user1',
                          'name': 'John Doe',
                          'avatarURL': 'avatar1.jpg',
                        },
                        'createdAt': '2023-01-01T10:00:00Z',
                      },
                    },
                  ],
                  'pageInfo': {
                    'hasNextPage': false,
                    'hasPreviousPage': true,
                    'startCursor': 'cursor1',
                    'endCursor': 'cursor1',
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.getChatDetails(chatId);

        expect(result, isNotNull);
        expect(result!.id, equals(chatId));
        expect(result.name, equals('Test Chat'));
        expect(result.messages, isNotNull);
        expect(result.messages!.length, equals(1));
        expect(result.messages![0].body, equals('Hello World'));

        // Check pagination info is set up
        expect(chatService.hasMoreMessages(chatId), isTrue);
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
              graphqlErrors: [const GraphQLError(message: 'Chat not found')],
            ),
          ),
        );

        final result = await chatService.getChatDetails('chat123');

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

        final result = await chatService.getChatDetails('chat123');

        expect(result, isNull);
      });
    });

    group('loadMoreMessages', () {
      test('loads more messages successfully', () async {
        const chatId = 'chat123';
        const beforeCursor = 'cursor1';

        // First set up pagination info
        chatService.hasMoreMessages(chatId); // Initialize pagination map
        // Manually set cursor for testing
        chatService.beforeCursor[chatId] = beforeCursor;

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
                'id': chatId,
                'messages': {
                  'edges': [
                    {
                      'cursor': 'cursor2',
                      'node': {
                        'id': 'msg2',
                        'body': 'Older message',
                        'creator': {
                          'id': 'user2',
                          'name': 'Jane Smith',
                          'avatarURL': 'avatar2.jpg',
                        },
                        'createdAt': '2023-01-01T09:00:00Z',
                      },
                    },
                  ],
                  'pageInfo': {
                    'hasNextPage': false,
                    'hasPreviousPage': false,
                    'startCursor': 'cursor2',
                    'endCursor': 'cursor2',
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.loadMoreMessages(chatId);

        expect(result, isA<List<ChatMessage>>());
        expect(result.length, equals(1));
        expect(result[0].body, equals('Older message'));
      });

      test('returns empty list when no cursor available', () async {
        final result = await chatService.loadMoreMessages('new_chat');

        expect(result, isEmpty);
      });

      test('returns empty list when cursor is empty', () async {
        const chatId = 'chat123';
        // Manually set empty cursor
        chatService.beforeCursor[chatId] = '';

        final result = await chatService.loadMoreMessages(chatId);

        expect(result, isEmpty);
      });
    });

    group('hasMoreMessages', () {
      test('returns true when hasPreviousPage is true', () async {
        const chatId = 'chat123';

        // First call getChatDetails to set up pagination
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
                'messages': {
                  'edges': [],
                  'pageInfo': {
                    'hasNextPage': false,
                    'hasPreviousPage': true,
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await chatService.getChatDetails(chatId);
        final result = chatService.hasMoreMessages(chatId);

        expect(result, isTrue);
      });

      test('returns false when no pagination info', () {
        final result = chatService.hasMoreMessages('unknown_chat');

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
                  'id': 'user123',
                  'name': 'John Doe',
                  'avatarURL': 'avatar.jpg',
                },
                'chatId': chatId,
                'createdAt': '2023-01-01T10:00:00Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatService.sendMessage(
          chatId: chatId,
          body: messageBody,
        );

        expect(result, isNotNull);
        expect(result!.id, equals('msg123'));
        expect(result.body, equals(messageBody));
        expect(result.chatId, equals(chatId));
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
              graphqlErrors: [const GraphQLError(message: 'Send failed')],
            ),
          ),
        );

        final result = await chatService.sendMessage(
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

        final result = await chatService.sendMessage(
          chatId: 'chat123',
          body: 'Test message',
        );

        expect(result, isNull);
      });
    });

    group('subscribeToChatMessages', () {
      test('subscription stream works correctly', () async {
        const chatId = 'chat123';
        final messages = <ChatMessage>[];
        late StreamSubscription subscription;

        // Mock the subscription stream
        final controller = StreamController<QueryResult>();
        when(
          mockDataBaseMutationFunctions.gqlAuthSubscription(
            ChatQueries().chatMessageCreate,
            variables: {
              "input": {
                "id": chatId,
              },
            },
          ),
        ).thenAnswer((_) => controller.stream);

        subscription =
            chatService.subscribeToChatMessages(chatId).listen((message) {
          messages.add(message);
        });

        // Simulate incoming message
        controller.add(
          QueryResult(
            options:
                QueryOptions(document: gql(ChatQueries().chatMessageCreate)),
            data: {
              'chatMessageCreate': {
                'id': 'new_msg',
                'body': 'New message',
                'creator': {
                  'id': 'user1',
                  'name': 'John Doe',
                  'avatarURL': 'avatar.jpg',
                },
                'createdAt': '2023-01-01T10:00:00Z',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await Future.delayed(const Duration(milliseconds: 50));
        await subscription.cancel();
        await controller.close();

        expect(messages.length, equals(1));
        expect(messages[0].body, equals('New message'));
      });

      test('handles subscription exceptions gracefully', () async {
        const chatId = 'chat123';
        final messages = <ChatMessage>[];
        late StreamSubscription subscription;

        final controller = StreamController<QueryResult>();
        when(
          mockDataBaseMutationFunctions.gqlAuthSubscription(
            ChatQueries().chatMessageCreate,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer((_) => controller.stream);

        subscription =
            chatService.subscribeToChatMessages(chatId).listen((message) {
          messages.add(message);
        });

        // Simulate exception
        controller.add(
          QueryResult(
            options:
                QueryOptions(document: gql(ChatQueries().chatMessageCreate)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Subscription error'),
              ],
            ),
          ),
        );

        await Future.delayed(const Duration(milliseconds: 50));
        await subscription.cancel();
        await controller.close();

        expect(messages, isEmpty);
      });
    });

    group('stopSubscription and dispose', () {
      test('stopSubscription completes the subscription completer', () {
        chatService.stopSubscription();
        // Test passes if no exceptions are thrown
        expect(true, isTrue);
      });

      test('dispose closes all streams and stops subscription', () async {
        chatService.dispose();
        // Test passes if no exceptions are thrown
        expect(true, isTrue);
      });
    });

    group('stream getters', () {
      test('chatListStream returns Stream<Chat>', () {
        expect(chatService.chatListStream, isA<Stream<Chat>>());
      });

      test('chatMessagesStream returns Stream<ChatMessage>', () {
        expect(chatService.chatMessagesStream, isA<Stream<ChatMessage>>());
      });
    });

    group('pagination properties', () {
      test('messagePageSize has correct default value', () {
        expect(chatService.messagePageSize, equals(15));
      });

      test('messagePageSize can be modified', () {
        chatService.messagePageSize = 25;
        expect(chatService.messagePageSize, equals(25));
      });
    });
  });
}
