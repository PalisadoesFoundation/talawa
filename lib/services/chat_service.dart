// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/chat_queries.dart';

/// ChatService class provides different services for direct chats of the user.
///
/// Services include:
/// * `sendMessageToDirectChat` - used to send messages.
/// * `getDirectChatsByUserId` - used to get all chats by the user.
/// * `getDirectChatMessagesByChatId` - used to get all chats of a user with another user.
class ChatService {
  ChatService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _chatListStream = _chatController.stream.asBroadcastStream();
    _chatMessagesStream = _chatMessageController.stream.asBroadcastStream();
  }
  late DataBaseMutationFunctions _dbFunctions;
  late Stream<ChatListTileDataModel> _chatListStream;
  late Stream<ChatMessage> _chatMessagesStream;

  final _userConfig = locator<UserConfig>();

  ///Stream of chats that we get from server.
  late Stream<QueryResult> chatStream;

  final StreamController<ChatListTileDataModel> _chatController =
      StreamController<ChatListTileDataModel>();

  final StreamController<ChatMessage> _chatMessageController =
      StreamController<ChatMessage>();

  ///getter for chatListStream.
  Stream<ChatListTileDataModel> get chatListStream => _chatListStream;

  ///getter for chatMessagesStream.
  Stream<ChatMessage> get chatMessagesStream => _chatMessagesStream;

  // Stream<QueryResult> getMessagesFromDirectChat() async* {
  //   final operation = SubscriptionOptions(
  //       document: gql(ChatQueries().messageSentToDirectChatsubscription),
  //       operationName: 'messageSentToDirectChat');
  //   chatStream = graphqlConfig.clientToQuery().subscribe(operation);

  //   _cha
  // }

  /// This function is used to send the message in the direct chats.
  ///
  /// **params**:
  /// * `chatId`: id of the direct chat where message need to be send.
  /// * `messageContent`: the text that need to be send.
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> sendMessageToDirectChat(
    String chatId,
    String messageContent,
  ) async {
    // trigger graphQL mutation to push the message in the Database.
    final result = await _dbFunctions.gqlAuthMutation(
      ChatQueries().sendMessageToDirectChat(),
      variables: {"chatId": chatId, "messageContent": messageContent},
    );

    final message = ChatMessage.fromJson(
      result.data['sendMessageToDirectChat'] as Map<String, dynamic>,
    );

    _chatMessageController.add(message);

    debugPrint(result.data.toString());
  }

  /// This function is used to get all the chats by the user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> getDirectChatsByUserId() async {
    final userId = _userConfig.currentUser.id;

    // trigger graphQL query to get all the chats of the user using [userId].
    final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final directMessageList = result?.data?['directChatsByUserID'] as List;

    // loop through the result [directMessageList] and append the element to the directChat.
    directMessageList.forEach((chat) {
      final directChat =
          ChatListTileDataModel.fromJson(chat as Map<String, dynamic>);

      directChat.users!.forEach((element) {
        if (element.id != userId) _chatController.add(directChat);
      });
    });
  }

  /// This function is used to get all the chat messages of a particular chat by the user.
  ///
  /// **params**:
  /// * `chatId`: id of the direct chat.
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> getDirectChatMessagesByChatId(chatId) async {
    // trigger graphQL query to get all the chat messages of a particular chat using [chatId].
    final String query =
        ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final messages = result?.data?['directChatsMessagesByChatID'] as List;

    messages.forEach((message) {
      final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
      _chatMessageController.add(chatMessage);
    });
  }
}
