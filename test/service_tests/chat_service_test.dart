// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/chat_queries.dart';
import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group('Test ChatService', () {
    test('Test SendMessageToDirectChat Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const chatId = "1";
      const messageContent = "test";

      final query = ChatQueries().sendMessageToDirectChat();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: {
            "chatId": chatId,
            "messageContent": messageContent,
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'sendMessageToDirectChat': {
              '_id': chatId,
              'messageContent': messageContent,
              'sender': {
                'firstName': 'Mohamed',
              },
              'receiver': {
                'firstName': 'Ali',
              },
            },
          },
          source: QueryResultSource.network,
        ),
      );
      final service = ChatService();
      final completer = Completer<void>();
      final messages = <ChatMessage>[];
      final subscription = service.chatMessagesStream.listen((message) {
        messages.add(message);
        completer.complete();
      });

      await service.sendMessageToDirectChat(
        chatId,
        messageContent,
      );

      await completer.future;

      await subscription.cancel();

      print(messages.first.id);
      expect(messages, isA<List<ChatMessage>>());
      expect(messages.length, 1);
      expect(messages.first.messageContent, messageContent);
      expect(messages.first.sender?.firstName, 'Mohamed');
      // Note: receiver will be set based on the current user from UserConfig
    });

    test('getDirectChatsByUserId Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const userId = "xzy1";
      final query = ChatQueries().fetchDirectChatsByUserId(userId);

      when(dataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
          ),
          data: {
            'directChatsByUserID': [
              {
                'users': [
                  {
                    '_id': 'user1',
                    'firstName': 'John',
                    'email': 'john@example.com',
                  },
                  {
                    '_id': 'xzy1',
                    'firstName': 'Jane',
                    'email': 'jane@example.com',
                  },
                ],
                '_id': 'chat1',
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );
      final service = ChatService();
      final completer = Completer<void>();
      final chats = <ChatListTileDataModel>[];
      final subscription = service.chatListStream.listen((chat) {
        chats.add(chat);
        if (!completer.isCompleted) {
          completer.complete();
        }
      });

      await service.getDirectChatsByUserId();

      await completer.future;

      await subscription.cancel();

      expect(chats, isA<List<ChatListTileDataModel>>());
      expect(chats.length, 1);
      expect(chats.first.users?.length, 2);
      expect(chats.first.users?.first.firstName, 'John');
    });

    test("getDirectChatMessagesByChatId Method", () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const chatId = 'test';
      final query = ChatQueries().fetchDirectChatMessagesByChatId(chatId);
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            "input": {
              "id": chatId,
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
          ),
          data: {
            'chat': {
              'messages': {
                'edges': [
                  {
                    'node': {
                      'id': 'test',
                      'body': 'test',
                      'creator': {
                        'id': 'user1',
                        'name': 'John Doe',
                        'avatarURL': 'https://example.com/john.jpg',
                      },
                      'createdAt': '2023-01-01T00:00:00Z',
                      'updatedAt': '2023-01-01T00:00:00Z',
                    },
                  },
                ],
              },
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = ChatService();
      final completer = Completer<void>();
      final messages = <ChatMessage>[];
      final subscription = service.chatMessagesStream.listen((message) {
        messages.add(message);
        if (!completer.isCompleted) {
          completer.complete();
        }
      });

      await service.getDirectChatMessagesByChatId(chatId);

      await completer.future;

      await subscription.cancel();

      expect(messages, isA<List<ChatMessage>>());
      expect(messages.length, 1);
      expect(messages.first.messageContent, 'test');
      expect(messages.first.sender?.firstName, 'John');
    });

    test("chatListStream return a stream of ChatListTileDataModel", () {
      final service = ChatService();
      expect(service.chatListStream, isA<Stream<ChatListTileDataModel>>());
    });

    test('chatMessagesStream returns a stream of ChatMessage', () {
      final chatService = ChatService();
      expect(chatService.chatMessagesStream, isA<Stream<ChatMessage>>());
    });
  });
}
