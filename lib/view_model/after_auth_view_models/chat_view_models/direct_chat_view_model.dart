import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class DirectChatViewModel extends BaseModel {
  final ChatService _chatService = locator<ChatService>();
  late StreamSubscription<ChatListTileDataModel> _chatListSubscription;
  StreamSubscription<ChatMessage>? _chatMessageSubscription;

  final listKey = GlobalKey<AnimatedListState>();

  ChatState chatState = ChatState.initial;

  late String name;

  final Set<String> _uniqueChatIds = {};
  final List<ChatListTileDataModel> _chats = [];
  List<ChatListTileDataModel> get chats => _chats;

  final Map<String, List<ChatMessage>> _chatMessagesByUser = {};

  Map<String, List<ChatMessage>> get chatMessagesByUser => _chatMessagesByUser;

  void refreshChats() {
    _chats.clear();
    _uniqueChatIds.clear();
    notifyListeners();
    _chatService.getDirectChatsByUserId();
  }

  void printChats() {
    _chats.forEach((chat) {
      print(chat.users![0].firstName);
    });
  }

  Future<void> initialise() async {
    setState(ViewState.busy);
    chatState = ChatState.loading;
    await _chatService.getDirectChatsByUserId();

    _chatListSubscription = _chatService.chatListStream.listen((newChat) {
      _uniqueChatIds.add(newChat.id!);
      _chats.insert(0, newChat);
    });
    chatState = ChatState.complete;
    setState(ViewState.idle);
  }

  Future<void> getChatMessages(String chatId) async {
    _chatMessagesByUser.clear();
    chatState = ChatState.loading;
    // await _chatService.getMessagesFromDirectChat();
    await _chatService.getDirectChatMessagesByChatId(chatId);
    final List<ChatMessage> _messages = [];
    _chatMessageSubscription =
        _chatService.chatMessagesStream.listen((newMessage) {
      _messages.add(newMessage);
      _chatMessagesByUser[chatId] = _messages;
    });
    chatState = ChatState.complete;
    notifyListeners();
  }

  Future<void> sendMessageToDirectChat(
      String chatId, String messageContent) async {
    chatState = ChatState.loading;
    await _chatService.sendMessageToDirectChat(chatId, messageContent);
    _chatService.chatMessagesStream.listen((newMessage) {
      _chatMessagesByUser[chatId]!.add(newMessage);
    });
    chatState = ChatState.complete;
  }

  @override
  void dispose() {
    _chatMessageSubscription?.cancel();
    _chatListSubscription.cancel();
    super.dispose();
  }

  void chatName(chatId) {
    final List<ChatUser> users =
        _chats.firstWhere((element) => element.id == chatId).users!;

    users.forEach((element) {
      if (element.id != userConfig.currentUser.id!) {
        name = element.firstName!;
      }
    });
  }
}
