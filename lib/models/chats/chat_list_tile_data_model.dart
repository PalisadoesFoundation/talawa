import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_user.dart';

/// This class provides backward compatibility for existing UI components.
///
/// that expect the old chat list tile data structure.
class ChatListTileDataModel {
  ChatListTileDataModel({
    this.users,
    this.id,
    this.chat,
  });

  /// Creates a `ChatListTileDataModel` from a `Chat` instance.
  ///
  /// This is a convenience constructor for adapting the new Chat model
  /// to the existing UI components.
  ///
  /// **params**:
  /// * `chat`: The Chat instance to adapt
  ///
  /// **returns**:
  /// * `ChatListTileDataModel`: Adapted data model for UI
  factory ChatListTileDataModel.fromChat(Chat chat) {
    return ChatListTileDataModel(
      id: chat.id,
      chat: chat,
      users: chat.members, // Use the members field directly
    );
  }

  /// List of users in the chat (for backward compatibility).
  List<ChatUser>? users;

  /// Chat ID (for backward compatibility).
  String? id;

  /// The full chat object (new field for PostgreSQL support).
  Chat? chat;
}
