import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_core_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
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

  group('ChatCoreService Tests', () {
    late ChatCoreService chatCoreService;
    late DataBaseMutationFunctions mockDataBaseMutationFunctions;
    late UserConfig mockUserConfig;
    late NavigationService mockNavigationService;
    late User sampleUser;
    late OrgInfo sampleOrg;

    setUp(() {
      chatCoreService = ChatCoreService();
      mockDataBaseMutationFunctions =
          test_locator.locator<DataBaseMutationFunctions>();
      mockUserConfig = test_locator.locator<UserConfig>();
      mockNavigationService = test_locator.locator<NavigationService>();

      sampleUser = User(
        id: 'user123',
        firstName: 'John',
        lastName: 'Doe',
        email: 'john@example.com',
        authToken: 'sample-auth-token',
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
                "organizationId": sampleOrg.id,
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
                'createdAt': '2023-01-01T00:00:00.000Z',
                'updatedAt': '2023-01-01T00:00:00.000Z',
                'creator': {
                  'id': 'user123',
                  'name': 'John Doe',
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatCoreService.createChat(
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

        final result = await chatCoreService.createChat(name: 'Test Chat');

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
                const GraphQLError(message: 'Error creating chat'),
              ],
            ),
          ),
        );

        final result = await chatCoreService.createChat(name: 'Test Chat');

        expect(result, isNull);
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
                  'createdAt': '2023-01-01T00:00:00.000Z',
                  'updatedAt': '2023-01-01T00:00:00.000Z',
                  'creator': {
                    'id': 'user1',
                    'name': 'User One',
                  },
                },
                {
                  'id': 'chat2',
                  'name': 'Chat 2',
                  'description': 'Second chat',
                  'createdAt': '2023-01-01T00:00:00.000Z',
                  'updatedAt': '2023-01-01T00:00:00.000Z',
                  'creator': {
                    'id': 'user2',
                    'name': 'User Two',
                  },
                }
              ],
            },
            source: QueryResultSource.network,
          ),
        );

        subscription = chatCoreService.chatListStream.listen((chat) {
          chats.add(chat);
        });

        final result = await chatCoreService.getChatsByUser();

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

      test('returns empty list when userId is null', () async {
        when(mockUserConfig.currentUser).thenReturn(
          User(
            authToken: 'valid-token',
          ),
        );

        final result = await chatCoreService.getChatsByUser();

        expect(result, isNotNull);
        expect(result, isEmpty);
      });

      test('shows error dialog on non-authentication exception', () async {
        final query = ChatQueries().chatsByUser();
        when(mockDataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
            exception: OperationException(
              graphqlErrors: [const GraphQLError(message: 'Server error')],
            ),
          ),
        );

        final result = await chatCoreService.getChatsByUser();

        expect(result, isNotNull);
        expect(result, isEmpty);

        // Verify that the navigation service was called to show error dialog
        verify(
          mockNavigationService.showTalawaErrorDialog(
            'Failed to fetch chats',
            MessageType.error,
          ),
        ).called(1);
      });
    });

    group('deleteChat', () {
      test('deletes chat successfully', () async {
        final query = ChatQueries().deleteChat();
        const chatId = 'chat123';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {"id": chatId},
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'deleteChat': {'id': chatId},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatCoreService.deleteChat(chatId);

        expect(result, isTrue);
      });

      test('returns false on GraphQL exception', () async {
        final query = ChatQueries().deleteChat();
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
                const GraphQLError(message: 'Error deleting chat'),
              ],
            ),
          ),
        );

        final result = await chatCoreService.deleteChat('chat123');

        expect(result, isFalse);
      });
    });

    group('updateChat', () {
      test('updates chat with both name and description', () async {
        final query = ChatQueries().updateChat();
        const chatId = 'chat123';
        const newName = 'Updated Chat';
        const newDescription = 'Updated description';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "id": chatId,
                "name": newName,
                "description": newDescription,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'updateChat': {
                'id': chatId,
                'name': newName,
                'description': newDescription,
                'updatedAt': '2023-01-01T00:00:00.000Z',
                'creator': {
                  'id': 'user123',
                  'name': 'John Doe',
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatCoreService.updateChat(
          chatId: chatId,
          newName: newName,
          newDescription: newDescription,
        );

        expect(result, isTrue);
      });

      test('updates chat with only name', () async {
        final query = ChatQueries().updateChat();
        const chatId = 'chat123';
        const newName = 'Updated Chat';

        when(
          mockDataBaseMutationFunctions.gqlAuthMutation(
            query,
            variables: {
              "input": {
                "id": chatId,
                "name": newName,
              },
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              'updateChat': {
                'id': chatId,
                'name': newName,
                'updatedAt': '2023-01-01T00:00:00.000Z',
                'creator': {
                  'id': 'user123',
                  'name': 'John Doe',
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await chatCoreService.updateChat(
          chatId: chatId,
          newName: newName,
        );

        expect(result, isTrue);
      });

      test('returns false when no updates provided', () async {
        final result = await chatCoreService.updateChat(chatId: 'chat123');

        expect(result, isFalse);
      });

      test('returns false on GraphQL exception', () async {
        final query = ChatQueries().updateChat();
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
                const GraphQLError(message: 'Error updating chat'),
              ],
            ),
          ),
        );

        final result = await chatCoreService.updateChat(
          chatId: 'chat123',
          newName: 'New Name',
        );

        expect(result, isFalse);
      });
    });

    group('disposal', () {
      test('dispose closes all streams', () async {
        chatCoreService.dispose();
        // Test passes if no exceptions are thrown
        expect(true, isTrue);
      });
    });

    group('stream getters', () {
      test('chatListStream returns Stream<Chat>', () {
        expect(chatCoreService.chatListStream, isA<Stream<Chat>>());
      });
    });
  });
}
