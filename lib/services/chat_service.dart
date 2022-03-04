import 'dart:async';

import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/chat_queries.dart';

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

  final StreamController<ChatListTileDataModel> _chatController =
      StreamController<ChatListTileDataModel>();

  final StreamController<ChatMessage> _chatMessageController =
      StreamController<ChatMessage>();

  Stream<ChatListTileDataModel> get chatListStream => _chatListStream;

  Stream<ChatMessage> get chatMessagesStream => _chatMessagesStream;

  Future<void> getDirectChatsByUserId() async {
    final userId = _userConfig.currentUser.id;

    final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final directMessageList = result.data['directChatsByUserID'] as List;

    directMessageList.forEach((chat) {
      final directChat =
          ChatListTileDataModel.fromJson(chat as Map<String, dynamic>);

      directChat.users!.forEach((element) {
        if (element.id != userId) _chatController.add(directChat);
      });
    });
  }

  Future<void> getDirectChatsByChatId(chatId) async {
    final String query =
        ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final messages = result.data['directChatsMessagesByChatID'] as List;

    messages.forEach((message) {
      final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
      _chatMessageController.add(chatMessage);
    });
  }
}
