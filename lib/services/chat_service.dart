import 'dart:async';

import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/chat_queries.dart';

class ChatService {
  ChatService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _chatStream = _chatController.stream.asBroadcastStream();
  }
  late DataBaseMutationFunctions _dbFunctions;
  late Stream<ChatMessage> _chatStream;

  final _userConfig = locator<UserConfig>();

  final StreamController<ChatMessage> _chatController =
      StreamController<ChatMessage>();

  Stream<ChatMessage> get chatStream => _chatStream;

  Future<void> getDirectChatsByUserId() async {
    final userId = _userConfig.currentUser.id;

    final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final directMessageList =
        result.data['directChatsByUserID'][1]['messages'] as List;

    directMessageList.forEach((chat) {
      final directChat = ChatMessage.fromJson(chat as Map<String, dynamic>);
      _chatController.add(directChat);
    });

    print(directMessageList.length);
  }
}
