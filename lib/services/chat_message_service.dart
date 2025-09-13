import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/services/chat_subscription_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/chat_queries.dart';

/// Provides message services for the PostgreSQL-based chat system.
///
/// Services include:
/// * `getChatDetails` - gets chat details with messages
/// * `sendMessage` - sends a message to a chat
/// * `loadMoreMessages` - loads older messages with pagination
/// * `hasMoreMessages` - checks if more messages are available
/// * Real-time subscription services delegated to ChatSubscriptionService
class ChatMessageService {
  ChatMessageService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _subscriptionService = ChatSubscriptionService();
  }

  /// Database mutation functions.
  late DataBaseMutationFunctions _dbFunctions;

  /// Subscription service for real-time messages.
  late ChatSubscriptionService _subscriptionService;

  /// Pagination information for chat messages per chat.
  final Map<String, PageInfo> _messagesPaginationInfo = {};

  /// `before` cursor for loading older messages.
  final Map<String, String?> beforeCursor = {};

  /// `last` parameter for limiting the number of messages fetched.
  int messagePageSize = 15;

  /// Getter for chat messages stream.
  Stream<ChatMessage> get chatMessagesStream =>
      _subscriptionService.chatMessagesStream;

  /// Retrieves chat details with initial messages.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `isInitialLoad`: Whether this is the initial load (for setting up pagination)
  ///
  /// **returns**:
  /// * `Future<Chat?>`: The chat with messages or null if failed
  Future<Chat?> getChatDetails(
    String chatId, {
    bool isInitialLoad = true,
  }) async {
    // Use the unified method for fetching messages
    final chat = await _fetchChatMessages(
      chatId: chatId,
      setupPagination: isInitialLoad,
    );

    return chat;
  }

  /// Unified method to fetch chat messages with optional pagination setup.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `setupPagination`: Whether to set up pagination cursors
  /// * `beforeCursor`: Optional cursor for loading older messages
  ///
  /// **returns**:
  /// * `Future<Chat?>`: The chat with messages or null if failed
  Future<Chat?> _fetchChatMessages({
    required String chatId,
    bool setupPagination = false,
    String? beforeCursor,
  }) async {
    final variables = <String, dynamic>{
      "input": {"id": chatId},
      "last": messagePageSize,
    };

    // Add cursor for pagination if provided
    if (beforeCursor != null) {
      variables["before"] = beforeCursor;
    }

    final result = await _dbFunctions.gqlAuthQuery(
      ChatQueries().fetchChatMessagesByChatId(),
      variables: variables,
    );

    if (result.hasException || result.data == null) {
      return null;
    }

    final chatData = result.data!['chat'] as Map<String, dynamic>?;
    if (chatData != null) {
      final chat = Chat.fromJson(chatData);

      // Set up pagination info if requested
      if (setupPagination) {
        _setupPaginationInfo(chatId, chatData);
      }

      return chat;
    }
    return null;
  }

  /// Sets up pagination information from chat data.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `chatData`: The chat data from GraphQL response
  ///
  /// **returns**:
  ///   None
  void _setupPaginationInfo(String chatId, Map<String, dynamic> chatData) {
    final messagesData = chatData['messages'] as Map<String, dynamic>?;
    if (messagesData == null) return;

    // Store page info for hasMoreMessages check
    final pageInfoData = messagesData['pageInfo'] as Map<String, dynamic>?;
    if (pageInfoData != null) {
      _messagesPaginationInfo[chatId] = PageInfo.fromJson(pageInfoData);
    }

    // Store cursor for loading older messages (use startCursor for backward pagination)
    final edges = messagesData['edges'] as List?;
    if (edges != null && edges.isNotEmpty) {
      final firstEdge = edges.first as Map<String, dynamic>;
      final startCursor = firstEdge['cursor'] as String?;

      if (startCursor != null) {
        beforeCursor[chatId] = startCursor;
      }
    }
  }

  /// Loads more messages (older messages) for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  /// * `Future<List<ChatMessage>>`: List of older messages or empty list if failed
  Future<List<ChatMessage>> loadMoreMessages(String chatId) async {
    final beforeCursor = this.beforeCursor[chatId];
    if (beforeCursor == null || beforeCursor.isEmpty) {
      return [];
    }

    // Use the unified method with cursor for pagination
    final chat = await _fetchChatMessages(
      chatId: chatId,
      setupPagination: true, // Update pagination info for next load
      beforeCursor: beforeCursor,
    );

    return chat?.messages ?? [];
  }

  /// Checks if there are more messages to load for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  /// * `bool`: True if there are more messages to load
  bool hasMoreMessages(String chatId) {
    final pageInfo = _messagesPaginationInfo[chatId];
    return pageInfo?.hasPreviousPage == true;
  }

  /// Sends a message to a chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `body`: The content of the message
  ///
  /// **returns**:
  /// * `Future<ChatMessage?>`: The sent message or null if failed
  Future<ChatMessage?> sendMessage({
    required String chatId,
    required String body,
  }) async {
    final result = await _dbFunctions.gqlAuthMutation(
      ChatQueries().createChatMessage(),
      variables: {
        "input": {
          "chatId": chatId,
          "body": body,
        },
      },
    );

    if (result.hasException || result.data == null) {
      debugPrint('Error sending message: ${result.exception}');
      return null;
    }

    final messageData =
        result.data!['createChatMessage'] as Map<String, dynamic>?;
    if (messageData != null) {
      final message = ChatMessage.fromJson(messageData);
      // Don't add to stream here - the subscription will handle it
      return message;
    }
    return null;
  }

  /// Subscribes to real-time chat messages for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to subscribe to
  ///
  /// **returns**:
  /// * `Stream<ChatMessage>`: Stream of incoming messages for the specified chat
  Stream<ChatMessage> subscribeToChatMessages(String chatId) =>
      _subscriptionService.subscribeToChatMessages(chatId);

  /// Stops the current chat subscription.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void stopSubscription() => _subscriptionService.stopSubscription();

  /// Disposes the service and closes streams.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void dispose() {
    _subscriptionService.dispose();
  }
}
