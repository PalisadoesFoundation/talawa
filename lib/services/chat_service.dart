import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/chat_queries.dart';

/// Provides different services for direct chats of the user.
///
/// Services include:
/// * `sendMessageToDirectChat` - used to send messages.
/// * `getDirectChatsByUserId` - used to get all chats by the user.
/// * `getDirectChatMessagesByChatId` - gets all chats of a user with
/// another user.
class ChatService {
  ChatService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _chatListStream = _chatController.stream.asBroadcastStream();
    _chatMessagesStream = _chatMessageController.stream.asBroadcastStream();
  }

  /// Database mutation functions.
  late DataBaseMutationFunctions _dbFunctions;

  /// Stream for chat list data.
  late Stream<ChatListTileDataModel> _chatListStream;

  /// Stream for chat messages.
  late Stream<ChatMessage> _chatMessagesStream;

  /// User configuration instance.
  final _userConfig = locator<UserConfig>();

  /// Stream for GraphQL query results.
  late Stream<QueryResult> chatStream;

  /// Controller for chat list stream.
  final StreamController<ChatListTileDataModel> _chatController =
      StreamController<ChatListTileDataModel>();

  /// Controller for chat messages stream.
  final StreamController<ChatMessage> _chatMessageController =
      StreamController<ChatMessage>();

  /// Getter for chat list stream.
  Stream<ChatListTileDataModel> get chatListStream => _chatListStream;

  /// Getter for chat messages stream.
  Stream<ChatMessage> get chatMessagesStream => _chatMessagesStream;

  // Stream<QueryResult> getMessagesFromDirectChat() async* {
  //   final operation = SubscriptionOptions(
  //       document: gql(ChatQueries().messageSentToDirectChatsubscription),
  //       operationName: 'messageSentToDirectChat');
  //   chatStream = graphqlConfig.clientToQuery().subscribe(operation);

  //   _cha
  // }

  /// Sends a message to a direct chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat where the message will be sent.
  /// * `messageContent`: The content of the message to be sent.
  ///
  /// **returns**:
  /// * `Future<void>`: A promise that will be fulfilled
  /// when the message is successfully sent.
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
      (result as QueryResult).data?['sendMessageToDirectChat']
          as Map<String, dynamic>,
    );

    _chatMessageController.add(message);

    debugPrint(result.data.toString());
  }

  /// Retrieves direct chats by user ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: A promise that will be fulfilled
  /// when the direct chats are successfully retrieved.
  Future<void> getDirectChatsByUserId() async {
    final userId = _userConfig.currentUser.id;

    // trigger graphQL query to get all the chats
    // of the user using [userId].
    final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final directMessageList =
        (result as QueryResult).data?['directChatsByUserID'] as List;

    // loop through the result [directMessageList]
    // and append the element to the directChat.
    directMessageList.forEach((chat) {
      final directChat =
          ChatListTileDataModel.fromJson(chat as Map<String, dynamic>);

      directChat.users!.forEach((element) {
        if (element.id != userId) _chatController.add(directChat);
      });
    });
  }

  /// This function retrieves direct chat messages by chat ID.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat for which messages
  /// are to be retrieved.
  ///
  /// **returns**:
  /// * `Future<void>`: A promise that will be fulfilled
  /// when the chat messages are successfully retrieved.
  Future<void> getDirectChatMessagesByChatId(chatId) async {
    // trigger graphQL query to get all the chat messages
    // of a particular chat using [chatId].
    final String query =
        ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final messages =
        (result as QueryResult).data?['directChatsMessagesByChatID'] as List;

    messages.forEach((message) {
      final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
      _chatMessageController.add(chatMessage);
    });
  }
}
