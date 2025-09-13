import 'dart:async';

import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/chat_core_service.dart';
import 'package:talawa/services/chat_membership_service.dart';
import 'package:talawa/services/chat_message_service.dart';

/// Unified service that provides all chat-related functionality.
///
/// This service acts as a facade that delegates to specialized services:
/// - ChatCoreService: Core chat operations (CRUD)
/// - ChatMembershipService: Member management operations
/// - ChatMessageService: Message and subscription operations
class ChatService {
  ChatService()
      : _coreService = ChatCoreService(),
        _membershipService = ChatMembershipService(),
        _messageService = ChatMessageService();

  /// Core chat operations service.
  final ChatCoreService _coreService;

  /// Membership management service.
  final ChatMembershipService _membershipService;

  /// Message and subscription service.
  final ChatMessageService _messageService;

  // Core Service Delegates

  /// Stream for chat list data.
  Stream<Chat> get chatListStream => _coreService.chatListStream;

  /// Creates a new chat.
  ///
  /// **params**:
  /// * `name`: The name of the chat
  /// * `description`: Optional description for the chat
  ///
  /// **returns**:
  /// * `Future<Chat?>`: The created chat or null if failed
  Future<Chat?> createChat({
    required String name,
    String? description,
  }) =>
      _coreService.createChat(name: name, description: description);

  /// Retrieves all chats for the current user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<Chat>?>`: List of chats if successful, or an empty list on failures
  Future<List<Chat>?> getChatsByUser() => _coreService.getChatsByUser();

  /// Deletes a chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to delete
  ///
  /// **returns**:
  /// * `Future<bool>`: True if chat was deleted successfully, false otherwise
  Future<bool> deleteChat(String chatId) => _coreService.deleteChat(chatId);

  /// Updates a chat's name and/or description.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to update
  /// * `newName`: The new name for the chat (optional)
  /// * `newDescription`: The new description for the chat (optional)
  ///
  /// **returns**:
  /// * `Future<bool>`: True if chat was updated successfully, false otherwise
  Future<bool> updateChat({
    required String chatId,
    String? newName,
    String? newDescription,
  }) =>
      _coreService.updateChat(
        chatId: chatId,
        newName: newName,
        newDescription: newDescription,
      );

  // Membership Service Delegates

  /// Creates a chat membership (adds a user to a chat).
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `userId`: The ID of the user to add
  ///
  /// **returns**:
  /// * `Future<bool>`: True if successful, false otherwise
  Future<bool> createChatMembership({
    required String chatId,
    required String userId,
  }) =>
      _membershipService.createChatMembership(
        chatId: chatId,
        userId: userId,
      );

  /// Adds a member to an existing chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `userId`: The ID of the user to add
  ///
  /// **returns**:
  /// * `Future<bool>`: True if member was added successfully, false otherwise
  Future<bool> addChatMember({
    required String chatId,
    required String userId,
  }) =>
      _membershipService.addChatMember(chatId: chatId, userId: userId);

  /// Removes a member from a chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `memberId`: The ID of the member to remove
  ///
  /// **returns**:
  /// * `Future<bool>`: True if member was removed successfully, false otherwise
  Future<bool> removeChatMember({
    required String chatId,
    required String memberId,
  }) =>
      _membershipService.removeChatMember(
        chatId: chatId,
        memberId: memberId,
      );

  /// Fetches members of a specific chat with pagination support.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `first`: Number of members to fetch from the beginning (optional)
  /// * `last`: Number of members to fetch from the end (optional)
  /// * `after`: Cursor for forward pagination (optional)
  /// * `before`: Cursor for backward pagination (optional)
  ///
  /// **returns**:
  /// * `Future<Map<String, dynamic>?>`: Chat with members and pagination info, or null if failed
  Future<Map<String, dynamic>?> fetchChatMembers({
    required String chatId,
    int? first,
    int? last,
    String? after,
    String? before,
  }) =>
      _membershipService.fetchChatMembers(
        chatId: chatId,
        first: first,
        last: last,
        after: after,
        before: before,
      );

  // Message Service Delegates

  /// Stream for chat messages.
  Stream<ChatMessage> get chatMessagesStream =>
      _messageService.chatMessagesStream;

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
  }) =>
      _messageService.getChatDetails(chatId, isInitialLoad: isInitialLoad);

  /// Loads more messages (older messages) for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  /// * `Future<List<ChatMessage>>`: List of older messages or empty list if failed
  Future<List<ChatMessage>> loadMoreMessages(String chatId) =>
      _messageService.loadMoreMessages(chatId);

  /// Checks if there are more messages to load for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  ///
  /// **returns**:
  /// * `bool`: True if there are more messages to load
  bool hasMoreMessages(String chatId) =>
      _messageService.hasMoreMessages(chatId);

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
  }) =>
      _messageService.sendMessage(chatId: chatId, body: body);

  /// Subscribes to real-time chat messages for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to subscribe to
  ///
  /// **returns**:
  /// * `Stream<ChatMessage>`: Stream of incoming messages for the specified chat
  Stream<ChatMessage> subscribeToChatMessages(String chatId) =>
      _messageService.subscribeToChatMessages(chatId);

  /// Stops the current chat subscription.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void stopSubscription() => _messageService.stopSubscription();

  /// Disposes the service and closes streams.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void dispose() {
    _coreService.dispose();
    _messageService.dispose();
  }
}
