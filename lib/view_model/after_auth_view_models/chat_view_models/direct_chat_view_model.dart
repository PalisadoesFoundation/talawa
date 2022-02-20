import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class DirectChatViewModel extends BaseModel {
  final ChatService _chatService = locator<ChatService>();
  late StreamSubscription _chatSubscription;

  final listKey = GlobalKey<AnimatedListState>();

  final Set<String> _uniqueChatIds = {};
  List<ChatMessage> _chats = [];
  List<ChatMessage> get chats => _chats;

  void refreshChats() {
    _chats.clear();
    _uniqueChatIds.clear();
    notifyListeners();
    _chatService.getDirectChatsByUserId();
  }

  void printChats() {
    _chats.forEach((chat) {
      print(chat.id);
    });
  }

  Future<void> initialise() async {
    setState(ViewState.busy);
    await _chatService.getDirectChatsByUserId();

    _chatSubscription = _chatService.chatStream.listen((newChat) {
      _uniqueChatIds.add(newChat.id);
      _chats.insert(0, newChat);
    });
    setState(ViewState.idle);
  }

  Future<void> getDirectChatList() async {
    await _chatService.getDirectChatsByUserId();
  }

  @override
  void dispose() {
    _chatSubscription.cancel();
    super.dispose();
  }
}
