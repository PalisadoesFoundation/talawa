import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_app_bar.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_input_field.dart';

/// GroupChatMessageScreen returns a StatefulWidget for showing group chat messages with admin features.
///
/// This screen is specifically designed for group chats (3+ members) and includes:
/// - Admin-only features (rename, add/remove members, delete group)
/// - Member management with validation
/// - Group-specific UI elements
class GroupChatMessageScreen extends StatefulWidget {
  const GroupChatMessageScreen({
    super.key,
    required this.chatId,
    required this.model,
  });

  /// chatId is the unique identifier for the group chat.
  final String chatId;

  /// The GroupChatViewModel instance that manages group chat state and messages.
  final GroupChatViewModel model;

  @override
  State<GroupChatMessageScreen> createState() => _GroupChatMessageScreenState();
}

class _GroupChatMessageScreenState extends State<GroupChatMessageScreen> {
  late ScrollController _scrollController;
  static const double _scrollThreshold = 200.0;
  Timer? _scrollDebounce;

  /// Helper method to get chat state.
  ChatState get chatState => widget.model.chatState;

  /// Helper method to get messages for this chat.
  List<ChatMessage> get messages => List<ChatMessage>.from(
        widget.model.chatMessagesByUser[widget.chatId] ?? <ChatMessage>[],
      );

  /// Helper method to check if more messages can be loaded.
  bool get hasMoreMessages => widget.model.hasMoreMessages(widget.chatId);

  /// Helper method to check if currently loading more messages.
  bool get isLoadingMoreMessages =>
      widget.model.isLoadingMoreMessages(widget.chatId);

  /// Helper method to get the current chat object.
  Chat? get currentChat {
    final chatTile = widget.model.groupChats
        .where(
          (chat) => chat.chat?.id == widget.chatId,
        )
        .firstOrNull;
    return chatTile?.chat;
  }

  /// Helper method to get group chat display name.
  String get groupChatName => widget.model.getGroupDisplayName(widget.chatId);

  /// Helper method to check if current user is admin.
  bool get isCurrentUserAdmin =>
      widget.model.isCurrentUserAdminById(widget.chatId);

  /// Helper method to get member count.
  int get memberCount => widget.model.getMemberCount(widget.chatId);

  /// Helper method to load more messages.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void loadMoreMessages() {
    widget.model.loadMoreMessages(widget.chatId);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Load chat messages when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.model.getChatMessages(widget.chatId);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollDebounce?.cancel();
    super.dispose();
  }

  /// Handle scroll events to trigger pagination when near the top of the list.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _onScroll() {
    _scrollDebounce?.cancel();
    _scrollDebounce = Timer(const Duration(milliseconds: 100), () {
      final currentMessages = messages;
      final currentChatState = chatState;

      if (currentChatState == ChatState.loading || currentMessages.isEmpty) {
        return;
      }

      if (_scrollController.position.maxScrollExtent > 0 &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - _scrollThreshold) {
        if (hasMoreMessages && !isLoadingMoreMessages) {
          loadMoreMessages();
        }
      }
    });
  }

  /// Builds the chat input field.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: The chat input field widget
  Widget _buildChatInput() {
    return GroupChatInputField(
      chatId: widget.chatId,
      model: widget.model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.model,
      builder: (context, child) {
        final currentChatState = chatState;
        final currentMessages = messages;

        return Scaffold(
          appBar: GroupChatAppBar(
            chatId: widget.chatId,
            model: widget.model,
            groupChatName: groupChatName,
            memberCount: memberCount,
            isCurrentUserAdmin: isCurrentUserAdmin,
            currentChat: currentChat,
          ),
          body: currentChatState == ChatState.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: currentMessages.isEmpty
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.group_outlined,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'No messages yet',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Start the group conversation!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              controller: _scrollController,
                              reverse: true,
                              itemCount: currentMessages.length,
                              itemBuilder: (context, index) {
                                final message = currentMessages[
                                    currentMessages.length - 1 - index];
                                return Message(message: message);
                              },
                            ),
                    ),
                    _buildChatInput(),
                  ],
                ),
        );
      },
    );
  }
}
