import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/chat_utils.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// This ViewModel class have different functions that are used interact with model in the context of Group Chat.
///
/// Functions include:
/// * `initialise` : Initialise the states.
/// * `getChatMessages` : to get all the messages of a chat.
/// * `sendMessageToGroupChat` : to send the message to group chat.
/// * `refreshChats` : to refresh group chat list.
class GroupChatViewModel extends BaseModel {
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

  /// Set to store unique group chat IDs.
  final Set<String> _uniqueGroupChatIds = {};

  /// List to store group chat data using ChatListTileDataModel.
  final List<ChatListTileDataModel> _groupChats = [];

  /// This is the getter for the group chats.
  List<ChatListTileDataModel> get groupChats => _groupChats;

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

  /// This function refresh the group chats.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void refreshChats() {
    _groupChats.clear();
    _uniqueGroupChatIds.clear();
    _chatService.getChatsByUser();
    chatState = ChatState.complete;
    navigationService.showTalawaErrorSnackBar(
      'Group Chats Refreshed',
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

    // Listen to the chat stream and filter for group chats (3+ members)
    _chatListSubscription = _chatService.chatListStream.listen((newChat) {
      if (newChat.id == null) {
        debugPrint('Received chat with null ID');
        return;
      }

      // Filter for group chats using ChatUtils
      if (ChatUtils.isGroupChat(newChat)) {
        if (!_uniqueGroupChatIds.contains(newChat.id)) {
          _uniqueGroupChatIds.add(newChat.id!);
          // Convert Chat to ChatListTileDataModel
          final chatListTileData = ChatListTileDataModel.fromChat(newChat);
          _groupChats.insert(0, chatListTileData);
          notifyListeners();
        }
      }
    });

    await _chatService.getChatsByUser();

    chatState = ChatState.complete;
    setState(ViewState.idle);
  }

  /// This function get all messages for a group chat.
  ///
  /// **params**:
  /// * `chatId`: id of a group chat for which messages need to be fetched.
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

    // Step 2: Subscribe to real-time messages for this specific group chat
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

  /// Loads more messages (older messages) for a specific group chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat to load more messages for.
  ///
  /// **returns**:
  ///   None
  Future<void> loadMoreMessages(String chatId) async {
    // Prevent pagination if chat hasn't been properly initialized yet
    if (_chatMessagesByUser[chatId] == null ||
        _chatMessagesByUser[chatId]!.isEmpty) {
      return;
    }

    // Prevent multiple simultaneous pagination requests
    if (_isLoadingMoreMessages[chatId] == true) {
      return;
    }

    _isLoadingMoreMessages[chatId] = true;
    notifyListeners();

    try {
      final currentMessages = _chatMessagesByUser[chatId]!;
      debugPrint(
        'Loading more messages for group chat: $chatId, current count: ${currentMessages.length}',
      );

      // Use getChatDetails for pagination - it handles the logic internally
      final chat =
          await _chatService.getChatDetails(chatId, isInitialLoad: false);

      if (chat != null && chat.messages != null && chat.messages!.isNotEmpty) {
        // Check if we got new (older) messages
        final newMessages = chat.messages!
            .where(
              (msg) =>
                  !currentMessages.any((existing) => existing.id == msg.id),
            )
            .toList();

        if (newMessages.isNotEmpty) {
          // Insert older messages at the beginning
          _chatMessagesByUser[chatId]!.insertAll(0, newMessages);
          debugPrint(
            'Loaded ${newMessages.length} older messages for group chat: $chatId',
          );
        }
      }
    } catch (e) {
      debugPrint('Error loading more messages for group chat $chatId: $e');
    } finally {
      _isLoadingMoreMessages[chatId] = false;
      notifyListeners();
    }
  }

  /// Checks if there are more messages to load for a specific group chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  ///
  /// **returns**:
  /// * `bool`: True if there are more messages to load
  bool hasMoreMessages(String chatId) {
    return _chatService.hasMoreMessages(chatId);
  }

  /// Send text message to a group chat.
  ///
  /// **params**:
  /// * `chatId`: id of a group chat to which message is to be sent.
  /// * `messageText`: text of a message to be sent.
  ///
  /// **returns**:
  ///   None
  Future<void> sendMessageToGroupChat(String chatId, String messageText) async {
    try {
      chatState = ChatState.loading;
      notifyListeners();

      final result = await _chatService.sendMessage(
        chatId: chatId,
        body: messageText,
      );

      if (result != null) {
        // Don't add message to list here - it will come through the subscription
        debugPrint('Message sent successfully to group chat: $chatId');
      } else {
        debugPrint('Failed to send message to group chat: $chatId');
        navigationService.showTalawaErrorSnackBar(
          'Failed to send message',
          MessageType.error,
        );
      }
    } catch (e) {
      debugPrint('Error sending message to group chat: $e');
      navigationService.showTalawaErrorSnackBar(
        'Error sending message: $e',
        MessageType.error,
      );
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Creates a new group chat.
  ///
  /// **params**:
  /// * `groupName`: The name of the group chat
  /// * `description`: Optional description for the group chat
  /// * `memberIds`: List of user IDs to add to the group (excluding creator)
  ///
  /// **returns**:
  /// * `Future<Chat?>`: The created group chat or null if failed
  Future<Chat?> createGroupChat({
    required String groupName,
    String? description,
    required List<String> memberIds,
  }) async {
    try {
      chatState = ChatState.loading;
      notifyListeners();

      // Create the chat first
      final chat = await _chatService.createChat(
        name: groupName,
        description: description,
      );

      if (chat == null) {
        debugPrint('Failed to create group chat');
        navigationService.showTalawaErrorSnackBar(
          'Failed to create group chat',
          MessageType.error,
        );
        return null;
      }

      debugPrint('Group chat created successfully: ${chat.id}');

      // Add the creator (current user) to the chat first
      final currentUserId = userConfig.currentUser.id!;
      debugPrint('Adding creator to chat: $currentUserId');

      final creatorMembershipCreated = await _chatService.createChatMembership(
        chatId: chat.id!,
        userId: currentUserId,
      );

      if (!creatorMembershipCreated) {
        debugPrint(
          'Failed to add creator $currentUserId to group chat ${chat.id}',
        );
      }

      // Add other members to the chat
      for (final memberId in memberIds) {
        debugPrint('Adding member to chat: $memberId');
        final membershipCreated = await _chatService.createChatMembership(
          chatId: chat.id!,
          userId: memberId,
        );

        if (!membershipCreated) {
          debugPrint('Failed to add member $memberId to group chat ${chat.id}');
        }
      }

      navigationService.showTalawaErrorSnackBar(
        'Group "$groupName" created successfully!',
        MessageType.info,
      );

      // Refresh the group chats list to show the new group
      debugPrint('Refreshing group chats list...');
      await _chatService.getChatsByUser();

      return chat;
    } catch (e) {
      debugPrint('Error creating group chat: $e');
      navigationService.showTalawaErrorSnackBar(
        'Error creating group: $e',
        MessageType.error,
      );
      return null;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Checks if the current user is an admin of the given group chat.
  ///
  /// **params**:
  /// * `chat`: The chat to check admin status for
  ///
  /// **returns**:
  /// * `bool`: True if current user is admin, false otherwise
  bool isCurrentUserAdmin(Chat chat) {
    return ChatUtils.isCurrentUserAdmin(chat, userConfig.currentUser.id!);
  }

  /// Deletes a group chat (admin only).
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat to delete
  ///
  /// **returns**:
  /// * `Future<bool>`: True if group was deleted successfully, false otherwise
  Future<bool> deleteGroupChat(String chatId) async {
    try {
      chatState = ChatState.loading;
      notifyListeners();

      final success = await _chatService.deleteChat(chatId);

      if (success) {
        // Remove from local list
        _groupChats.removeWhere((chat) => chat.id == chatId);
        _uniqueGroupChatIds.remove(chatId);

        navigationService.showTalawaErrorSnackBar(
          'Group deleted successfully',
          MessageType.info,
        );
      }

      return success;
    } catch (e) {
      debugPrint('Error deleting group chat: $e');
      navigationService.showTalawaErrorSnackBar(
        'Error deleting group: $e',
        MessageType.error,
      );
      return false;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Updates the group chat name and/or description (admin only).
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat to update
  /// * `newName`: The new name for the group (optional)
  /// * `newDescription`: The new description for the group (optional)
  ///
  /// **returns**:
  /// * `Future<bool>`: True if update was successful, false otherwise
  Future<bool> updateGroupDetails({
    required String chatId,
    String? newName,
    String? newDescription,
  }) async {
    try {
      // Validate the new name
      final validation = ChatUtils.validateGroupName(newName!);
      if (!(validation['isValid'] as bool)) {
        navigationService.showTalawaErrorSnackBar(
          validation['error'] as String,
          MessageType.error,
        );
        return false;
      }

      chatState = ChatState.loading;
      notifyListeners();
      final updatedChat = await _chatService.updateChat(
        chatId: chatId,
        newName: newName,
        newDescription: newDescription,
      );
      if (updatedChat != null) {
        // Update local list tile
        final index = _groupChats.indexWhere((tile) => tile.chat?.id == chatId);
        if (index != -1) {
          _groupChats[index] = ChatListTileDataModel.fromChat(updatedChat);
        }
        navigationService.showTalawaErrorSnackBar(
          'Group updated successfully',
          MessageType.info,
        );
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error updating group details: $e');
      navigationService.showTalawaErrorSnackBar(
        'Failed to update group',
        MessageType.error,
      );
      return false;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Adds a member to the group chat (admin only).
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  /// * `userId`: The ID of the user to add
  ///
  /// **returns**:
  /// * `Future<bool>`: True if member was added successfully, false otherwise
  Future<bool> addGroupMember({
    required String chatId,
    required String userId,
  }) async {
    try {
      // Find the chat to validate member existence
      final chatTile =
          _groupChats.where((chat) => chat.chat?.id == chatId).firstOrNull;
      final chat = chatTile?.chat;

      if (chat == null) {
        navigationService.showTalawaErrorDialog(
          'Chat not found',
          MessageType.error,
        );
        return false;
      }

      chatState = ChatState.loading;
      notifyListeners();

      final success = await _chatService.addChatMember(
        chatId: chatId,
        userId: userId,
      );

      if (success) {
        // Reload chat details to update members list and UI
        final updated =
            await _chatService.getChatDetails(chatId, isInitialLoad: false);
        if (updated != null) {
          // Update local chat and list tile
          chat.members = updated.members;
          final index =
              _groupChats.indexWhere((tile) => tile.chat?.id == chatId);
          if (index != -1) {
            _groupChats[index] = ChatListTileDataModel.fromChat(updated);
          }
        }
        navigationService.showTalawaErrorSnackBar(
          'Member added successfully',
          MessageType.info,
        );
      }

      return success;
    } catch (e) {
      debugPrint('Error adding group member: $e');
      navigationService.showTalawaErrorSnackBar(
        'Error adding member: $e',
        MessageType.error,
      );
      return false;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Removes a member from the group chat (admin only).
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  /// * `memberId`: The ID of the member to remove
  /// * `chat`: The chat object for validation
  ///
  /// **returns**:
  /// * `Future<bool>`: True if member was removed successfully, false otherwise
  Future<bool> removeGroupMember({
    required String chatId,
    required String memberId,
    required Chat chat,
  }) async {
    try {
      // Validate the member removal
      final validation = ChatUtils.validateMemberRemoval(
        chat: chat,
        memberId: memberId,
        currentUserId: userConfig.currentUser.id!,
      );

      if (!(validation['isValid'] as bool)) {
        navigationService.showTalawaErrorSnackBar(
          validation['error'] as String,
          MessageType.error,
        );
        return false;
      }

      chatState = ChatState.loading;
      notifyListeners();

      final success = await _chatService.removeChatMember(
        chatId: chatId,
        memberId: memberId,
      );

      if (success) {
        // Reload chat details to update members list and UI
        final updated =
            await _chatService.getChatDetails(chatId, isInitialLoad: false);
        if (updated != null) {
          // Update local chat and list tile
          chat.members = updated.members;
          final index =
              _groupChats.indexWhere((tile) => tile.chat?.id == chatId);
          if (index != -1) {
            _groupChats[index] = ChatListTileDataModel.fromChat(updated);
          }
        }
        navigationService.showTalawaErrorSnackBar(
          'Member removed successfully',
          MessageType.info,
        );
      }

      return success;
    } catch (e) {
      debugPrint('Error removing group member: $e');
      navigationService.showTalawaErrorSnackBar(
        'Error removing member: $e',
        MessageType.error,
      );
      return false;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Leaves the group chat (removes current user from the group).
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat to leave
  /// * `chat`: The chat object for validation
  ///
  /// **returns**:
  /// * `Future<bool>`: True if user left successfully, false otherwise
  Future<bool> leaveGroupChat(String chatId, Chat chat) async {
    try {
      // Validate the group leave action
      final validation = ChatUtils.validateGroupLeave(
        chat: chat,
        currentUserId: userConfig.currentUser.id!,
      );

      if (!(validation['isValid'] as bool)) {
        navigationService.showTalawaErrorSnackBar(
          validation['error'] as String,
          MessageType.error,
        );
        return false;
      }

      chatState = ChatState.loading;
      notifyListeners();

      final success = await _chatService.removeChatMember(
        chatId: chatId,
        memberId: userConfig.currentUser.id!,
      );

      if (success) {
        // Remove from local list
        _groupChats.removeWhere((chat) => chat.id == chatId);
        _uniqueGroupChatIds.remove(chatId);

        navigationService.showTalawaErrorSnackBar(
          'Left group successfully',
          MessageType.info,
        );
      }

      return success;
    } catch (e) {
      debugPrint('Error leaving group chat: $e');
      navigationService.showTalawaErrorSnackBar(
        'Error leaving group: $e',
        MessageType.error,
      );
      return false;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }

  /// Function to dispose the model.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  @override
  void dispose() {
    _chatListSubscription?.cancel();
    _chatMessageSubscription?.cancel();
    super.dispose();
  }

  /// Gets available members for adding to a group chat.
  ///
  /// Returns organization members who are not already in the chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  ///
  /// **returns**:
  /// * `List<User>`: List of available organization members
  List<User> getAvailableMembers(String chatId) {
    final currentOrgMembers = userConfig.currentOrg.members ?? [];
    final currentChat = _getChatById(chatId);
    final currentChatMembers = currentChat?.members ?? [];

    // Filter out users who are already members
    return currentOrgMembers.where((orgMember) {
      return !currentChatMembers
          .any((chatMember) => chatMember.id == orgMember.id);
    }).toList();
  }

  /// Gets a chat by ID from the group chats list.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to find
  ///
  /// **returns**:
  /// * `Chat?`: The chat object if found, null otherwise
  Chat? _getChatById(String chatId) {
    final chatTile = _groupChats
        .where(
          (chat) => chat.chat?.id == chatId,
        )
        .firstOrNull;
    return chatTile?.chat;
  }

  /// Validates if a member can be removed from a group.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  /// * `memberId`: The ID of the member to validate removal for
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Validation result with 'isValid' and 'error' keys
  Map<String, dynamic> validateMemberRemoval({
    required String chatId,
    required String memberId,
  }) {
    final chat = _getChatById(chatId);
    if (chat == null) {
      return {
        'isValid': false,
        'error': 'Chat not found',
      };
    }

    return ChatUtils.validateMemberRemoval(
      chat: chat,
      memberId: memberId,
      currentUserId: userConfig.currentUser.id!,
    );
  }

  /// Checks if the current user is admin of a specific group chat by ID.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  ///
  /// **returns**:
  /// * `bool`: True if current user is admin, false otherwise
  bool isCurrentUserAdminById(String chatId) {
    final chat = _getChatById(chatId);
    if (chat == null) return false;
    return isCurrentUserAdmin(chat);
  }

  /// Gets the member count for a specific group chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  ///
  /// **returns**:
  /// * `int`: Number of members in the group
  int getMemberCount(String chatId) {
    final chat = _getChatById(chatId);
    log("MEMBERS:");
    log(chat?.members?.length.toString() ?? 'No members found');
    return chat?.members?.length ?? 0;
  }

  /// Gets the display name for a group chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  ///
  /// **returns**:
  /// * `String`: The display name of the group
  String getGroupDisplayName(String chatId) {
    final chat = _getChatById(chatId);
    if (chat?.name != null && chat!.name!.isNotEmpty) {
      return ChatUtils.extractGroupName(chat.name!);
    }
    return 'Group Chat';
  }

  /// Fetches all members of a specific group chat with pagination support.
  ///
  /// This method uses the ChatService.fetchChatMembers() to load members
  /// with pagination, which is useful for groups with many members.
  ///
  /// **params**:
  /// * `chatId`: The ID of the group chat
  /// * `limit`: Maximum number of members to fetch (default: 50)
  ///
  /// **returns**:
  /// * `Future<List<dynamic>?>`: List of chat members or null if failed
  Future<List<dynamic>?> fetchGroupMembers({
    required String chatId,
    int limit = 32,
  }) async {
    try {
      chatState = ChatState.loading;
      notifyListeners();

      final result = await _chatService.fetchChatMembers(
        chatId: chatId,
        last: limit,
      );

      if (result != null) {
        final membersData = result['members'] as Map<String, dynamic>?;
        if (membersData != null) {
          final edges = membersData['edges'] as List<dynamic>?;
          if (edges != null) {
            // Extract member nodes from edges
            final members = edges
                .map(
                  (edge) => (edge as Map<String, dynamic>)['node']
                      as Map<String, dynamic>,
                )
                .toList();

            debugPrint('Fetched ${members.length} members for group $chatId');
            return members;
          }
        }
      }

      debugPrint('Failed to fetch members for group $chatId');
      return null;
    } catch (e) {
      debugPrint('Error fetching group members: $e');
      navigationService.showTalawaErrorSnackBar(
        'Failed to load group members',
        MessageType.error,
      );
      return null;
    } finally {
      chatState = ChatState.complete;
      notifyListeners();
    }
  }
}
