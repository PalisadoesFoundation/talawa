import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// This ViewModel class have different functions that are used interact with model in the context of Direct Chat.
///
/// Functions include:
/// * `initialise` : Initialise the states.
/// * `getChatMessages` : to get all the messages of a chat.
/// * `sendMessageToDirectChat` : to send the message to chat.
class DirectChatViewModel extends BaseModel {
  final ChatService _chatService = locator<ChatService>();
  late StreamSubscription<ChatListTileDataModel> _chatListSubscription;
  StreamSubscription<ChatMessage>? _chatMessageSubscription;

  /// This is the key for the AnimatedList widget.
  final listKey = GlobalKey<AnimatedListState>();

  /// State of the chat.
  ChatState chatState = ChatState.initial;

  /// Name of the chat.
  String? name;

  /// Set to store unique chat IDs.
  final Set<String> _uniqueChatIds = {};

  /// List to store chat data.
  final List<ChatListTileDataModel> _chats = [];

  /// This is the getter for the unique chat IDs.
  List<ChatListTileDataModel> get chats => _chats;

  /// Map to store chat messages by user.
  final Map<String, List<ChatMessage>> _chatMessagesByUser = {};

  /// This is the getter for the chat messages by user.
  Map<String, List<ChatMessage>> get chatMessagesByUser => _chatMessagesByUser;

  /// This function refresh the chats.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void refreshChats() {
    _chats.clear();
    _uniqueChatIds.clear();
    notifyListeners();
    _chatService.getDirectChatsByUserId();
  }

  /// This function is used to initialise the states.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialise() async {
    setState(ViewState.busy);
    chatState = ChatState.loading;

    _chatListSubscription = _chatService.chatListStream.listen((newChat) {
      _uniqueChatIds.add(newChat.id!);
      _chats.insert(0, newChat);
    });

    await _chatService.getDirectChatsByUserId();

    chatState = ChatState.complete;
    setState(ViewState.idle);
  }

  /// This function get all messages for a chat.
  ///
  /// **params**:
  /// * `chatId`: id of a chat for which messages need to be fetched.
  ///
  /// **returns**:
  ///   None
  Future<void> getChatMessages(String chatId) async {
    _chatMessagesByUser.clear();
    chatState = ChatState.loading;
    // await _chatService.getMessagesFromDirectChat();
    // variable
    final List<ChatMessage> messages = [];
    _chatMessageSubscription =
        _chatService.chatMessagesStream.listen((newMessage) {
      messages.add(newMessage);
      _chatMessagesByUser[chatId] = messages;
    });
    // use `chatService` services
    await _chatService.getDirectChatMessagesByChatId(chatId);
    chatState = ChatState.complete;
    notifyListeners();
  }

  /// This function send the message to Direct Chat.
  ///
  /// **params**:
  /// * `chatId`: id of a chat where message need to be send.
  /// * `messageContent`: content of a message.
  ///
  /// **returns**:
  ///   None
  Future<void> sendMessageToDirectChat(
    String chatId,
    String messageContent,
  ) async {
    chatState = ChatState.loading;
    _chatService.chatMessagesStream.listen((newMessage) {
      _chatMessagesByUser[chatId]!.add(newMessage);
    });
    await _chatService.sendMessageToDirectChat(chatId, messageContent);
    chatState = ChatState.complete;
  }

  @override
  void dispose() {
    _chatMessageSubscription?.cancel();
    _chatListSubscription.cancel();
    super.dispose();
  }

  /// Method to return chat name based on the chatId.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat for which the name needs to be fetched.
  ///
  /// **returns**:
  ///   None
  void chatName(String chatId) {
    final List<ChatUser> users =
        _chats.firstWhere((element) => element.id == chatId).users!;

    users.forEach((element) {
      if (element.id != userConfig.currentUser.id!) {
        name = element.firstName;
      }
    });
  }
}
