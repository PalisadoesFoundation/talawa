import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';

/// ChatMessageScreen returns a StatefulWidget for showing the chat message screen with pagination support.
class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({
    super.key,
    required this.chatId,
    required this.model,
  });

  /// chatId is the unique identifier for the chat.
  final String chatId;

  /// The DirectChatViewModel instance that manages chat state and messages.
  final DirectChatViewModel model;

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  late ScrollController _scrollController;

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
    // Only check for pagination if we have messages and the chat is loaded
    final messages = widget.model.chatMessagesByUser[widget.chatId];
    final chatState = widget.model.chatState;

    // Don't trigger pagination if chat is still loading or has no messages
    if (chatState == ChatState.loading ||
        messages == null ||
        messages.isEmpty) {
      return;
    }

    // Check if scrolled to the top (for reversed list, top means end of scroll)
    if (_scrollController.position.maxScrollExtent > 0 &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      // Trigger load more messages when near the top
      if (widget.model.hasMoreMessages(widget.chatId) &&
          !widget.model.isLoadingMoreMessages(widget.chatId)) {
        widget.model.loadMoreMessages(widget.chatId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal! * 2),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal! * 3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.chatName(widget.chatId) ?? 'Chat',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Active now',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: widget.model,
        builder: (context, child) {
          final chatState = widget.model.chatState;
          final messages = widget.model.chatMessagesByUser[widget.chatId] ?? [];

          if (chatState == ChatState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: messages.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
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
                              'Start the conversation!',
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
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[messages.length - 1 - index];
                          return Message(message: message);
                        },
                      ),
              ),
              ChatInputField(chatId: widget.chatId, model: widget.model),
            ],
          );
        },
      ),
    );
  }
}
