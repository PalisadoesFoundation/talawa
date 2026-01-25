import 'dart:async';

import 'package:flutter/foundation.dart';
<<<<<<< HEAD
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
  ///   None
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
      result.data?['sendMessageToDirectChat'] as Map<String, dynamic>,
    );

    _chatMessageController.add(message);

    debugPrint(result.data.toString());
  }

  /// Retrieves direct chats by user ID.
=======
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
  ChatService({
    ChatCoreService? coreService,
    ChatMembershipService? membershipService,
    ChatMessageService? messageService,
  })  : _coreService = coreService ?? ChatCoreService(),
        _membershipService = membershipService ?? ChatMembershipService(),
        _messageService = messageService ?? ChatMessageService();

  /// Core chat operations service.
  final ChatCoreService _coreService;

  /// Membership management service.
  final ChatMembershipService _membershipService;

  /// Message and subscription service.
  final ChatMessageService _messageService;

  // Core Service Delegates

  /// Stream for individual chat updates.
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
  }) async {
    name = name.trim();
    if (name.isEmpty) {
      debugPrint('Error creating chat: Empty name');
      return null;
    }
    return _coreService.createChat(name: name, description: description);
  }

  /// Retrieves all chats for the current user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<Chat>>`: List of chats if successful, or an empty list on failures
  Future<List<Chat>> getChatsByUser() => _coreService.getChatsByUser();

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
>>>>>>> upstream/develop
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
<<<<<<< HEAD
  Future<void> getDirectChatsByUserId() async {
    final userId = _userConfig.currentUser.id;

    // trigger graphQL query to get all the chats
    // of the user using [userId].
    final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final directMessageList = result.data?['directChatsByUserID'] as List;

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
  ///   None
  Future<void> getDirectChatMessagesByChatId(chatId) async {
    // trigger graphQL query to get all the chat messages
    // of a particular chat using [chatId].
    final String query =
        ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

    final result = await _dbFunctions.gqlAuthQuery(query);

    final messages = result.data?['directChatsMessagesByChatID'] as List;

    messages.forEach((message) {
      final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
      _chatMessageController.add(chatMessage);
    });
=======
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
>>>>>>> upstream/develop
  }
}
