import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// This ViewModel class have different functions that are used interact with model in the context of Direct Chat.
///
/// Functions include:
/// * `initialise` : Initialise the states.
/// * `getChatMessages` : to get all the messages of a chat.
/// * `sendMessageToDirectChat` : to send the message to chat.
class DirectChatViewModel extends BaseModel {
  /// Chat service instance for handling chat operations.
  final ChatService _chatService = locator<ChatService>();

  /// User configuration service for accessing current user information.
  final UserConfig userConfig = locator<UserConfig>();

  /// Subscription to chat list stream.
  StreamSubscription<Chat>? _chatListSubscription;

  /// Subscription to chat messages stream.
  StreamSubscription<ChatMessage>? _chatMessageSubscription;

  /// This is the key for the AnimatedList widget.
  final listKey = GlobalKey<AnimatedListState>();

  /// State of the chat.
  ChatState chatState = ChatState.initial;

  /// Name of the chat.
  String? name;

  /// Set to store unique chat IDs.
  final Set<String?> _uniqueChatIds = {};

  /// List to store chat data using ChatListTileDataModel for backward compatibility.
  final List<ChatListTileDataModel> _chats = [];

  /// This is the getter for the unique chat IDs.
  List<ChatListTileDataModel> get chats => _chats;

  /// Map to store chat messages by chat ID.
  final Map<String, List<ChatMessage>> _chatMessagesByUser = {};

  /// This is the getter for the chat messages by user.
  Map<String, List<ChatMessage>> get chatMessagesByUser => _chatMessagesByUser;

  /// Loading state for pagination (loading more messages).
  final Map<String, bool> _isLoadingMoreMessages = {};

  /// Getter for pagination loading state.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to check loading state for.
  ///
  /// **returns**:
  /// * `bool`: True if loading more messages, false otherwise.
  bool isLoadingMoreMessages(String chatId) =>
      _isLoadingMoreMessages[chatId] ?? false;

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
    _chatService.getChatsByUser();
    chatState = ChatState.complete;
    navigationService.showTalawaErrorSnackBar(
      'Chats Refreshed',
      MessageType.info,
    );
    notifyListeners();
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

    // Listen to the chat stream and convert Chat objects to ChatListTileDataModel for backward compatibility
    _chatListSubscription = _chatService.chatListStream.listen((newChat) {
      if (newChat.id == null) {
        debugPrint('Received chat with null ID');
        return;
      }
      if (!_uniqueChatIds.contains(newChat.id)) {
        _uniqueChatIds.add(newChat.id);
        // Convert Chat to ChatListTileDataModel for backward compatibility
        final chatListTileData = ChatListTileDataModel.fromChat(newChat);
        _chats.insert(0, chatListTileData);
        notifyListeners();
      }
    });

    await _chatService.getChatsByUser();

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
    _chatMessagesByUser[chatId] = []; // Initialize empty list
    _isLoadingMoreMessages[chatId] = false; // Initialize loading state
    chatState = ChatState.loading;

    // Step 1: Load initial messages from getChatDetails (won't add to stream)
    final chat = await _chatService.getChatDetails(chatId, isInitialLoad: true);
    if (chat != null && chat.messages != null) {
      _chatMessagesByUser[chatId] = List.from(chat.messages!); // Create a copy
    }

    // Step 2: Subscribe to real-time messages for this specific chat
    // This will only receive NEW messages from subscriptions
    _chatMessageSubscription =
        _chatService.subscribeToChatMessages(chatId).listen((newMessage) {
      if (_chatMessagesByUser[chatId] != null) {
        // Check if message already exists to prevent duplicates
        final existingMessage =
            _chatMessagesByUser[chatId]!.any((msg) => msg.id == newMessage.id);
        if (!existingMessage) {
          _chatMessagesByUser[chatId]!.add(newMessage);
          notifyListeners();
        }
      }
    });

    chatState = ChatState.complete;
    notifyListeners();
  }

  /// Load more messages (older messages) for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to load more messages for.
  ///
  /// **returns**:
  ///   None
  Future<void> loadMoreMessages(String chatId) async {
    // Prevent pagination if chat hasn't been properly initialized yet
    if (_chatMessagesByUser[chatId] == null ||
        _chatMessagesByUser[chatId]!.isEmpty) {
      return;
    }

    // Check if we can load more messages
    if (!_chatService.hasMoreMessages(chatId) ||
        isLoadingMoreMessages(chatId)) {
      return;
    }

    _isLoadingMoreMessages[chatId] = true;
    notifyListeners();

    try {
      final olderMessages = await _chatService.loadMoreMessages(chatId);
      if (olderMessages.isNotEmpty) {
        // Prepend older messages to the beginning of the list
        _chatMessagesByUser[chatId]!.insertAll(0, olderMessages);
        // Force UI update by reassigning the list reference
        _chatMessagesByUser[chatId] = List.from(_chatMessagesByUser[chatId]!);
        notifyListeners();
      }
    } catch (e) {
      // Handle error silently in production
    } finally {
      _isLoadingMoreMessages[chatId] = false;
      notifyListeners();
    }
  }

  /// Check if there are more messages to load for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to check.
  ///
  /// **returns**:
  /// * `bool`: True if there are more messages to load.
  bool hasMoreMessages(String chatId) {
    return _chatService.hasMoreMessages(chatId);
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

    // Use the new sendMessage method with proper parameters
    final sentMessage = await _chatService.sendMessage(
      chatId: chatId,
      body: messageContent,
    );

    if (sentMessage != null) {
      notifyListeners();
    }

    chatState = ChatState.complete;
  }

  @override
  void dispose() {
    _chatMessageSubscription?.cancel();
    _chatListSubscription?.cancel();
    super.dispose();
  }

  /// Method to return chat name based on the chatId.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat for which the name needs to be fetched.
  ///
  /// **returns**:
  /// * `String?`: The name of the chat or null if not found.
  String? chatName(String chatId) {
    try {
      final chat = _chats.firstWhere((element) => element.id == chatId);
      final List<ChatUser> users = chat.users!;

      for (final user in users) {
        final currentUserId = userConfig.currentUser.id;
        if (currentUserId != null && user.id != currentUserId) {
          name = user.firstName;
          break;
        }
      }
      return name;
    } catch (e) {
      // Chat not found in local list, return a default name
      return null;
    }
  }
}
