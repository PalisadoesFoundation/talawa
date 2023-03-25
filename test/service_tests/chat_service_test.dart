// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
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
      const id = "1";
      const messageContent = "test";

      final query = ChatQueries().sendMessageToDirectChat();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: {
            "chatId": id,
            "messageContent": messageContent,
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'sendMessageToDirectChat': {
              '_id': id,
              'messageContent': messageContent,
              'sender': {
                'firstName': 'Mohamed',
              },
              'receiver': {
                'firstName': 'Ali',
              }
            },
          },
          source: QueryResultSource.network,
        ),
      );
      final service = ChatService();
      await service.sendMessageToDirectChat(
        id,
        messageContent,
      );
    });
    test('getDirectChatsByUserId Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const userId = "xzy1";
      final query = ChatQueries().fetchDirectChatsByUserId(userId);
      // when(locator<UserConfig>()).thenAnswer((_) => UserConfig());
      when(dataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
          ),
          data: {
            'directChatsByUserID': [
              {
                'users': [],
                '_id': 'xzy1',
              }
            ]
          },
          source: QueryResultSource.network,
        ),
      );
      final service = ChatService();
      await service.getDirectChatsByUserId();
    });
    test("getDirectChatMessagesByChatId Method", () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const chatId = 'test';
      final query = ChatQueries().fetchDirectChatMessagesByChatId(chatId);
      when(dataBaseMutationFunctions.gqlAuthQuery(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
          ),
          data: {
            'directChatsMessagesByChatID': [
              {
                '_id': 'test',
                'messageContent': 'test',
              }
            ]
          },
          source: QueryResultSource.network,
        ),
      );

      final service = ChatService();
      await service.getDirectChatMessagesByChatId(chatId);
    });
  });
}
