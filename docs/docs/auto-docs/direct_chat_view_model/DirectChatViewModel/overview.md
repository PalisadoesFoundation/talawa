# Overview for `DirectChatViewModel`

## Description

This ViewModel class have different functions that are used interact with model in the context of Direct Chat.

 Functions include:
 * `initialise` : Initialise the states.
 * `getChatMessages` : to get all the messages of a chat.
 * `sendMessageToDirectChat` : to send the message to chat.

## Dependencies

- BaseModel

## Members

- **_chatService**: `ChatService`
  Chat service instance for handling chat operations.

- **userConfig**: `UserConfig`
  User configuration service for accessing current user information.

- **_chatListSubscription**: `StreamSubscription<Chat>?`
  Subscription to chat list stream.

- **_chatMessageSubscription**: `StreamSubscription<ChatMessage>?`
  Subscription to chat messages stream.

- **listKey**: `dynamic`
  This is the key for the AnimatedList widget.

- **chatState**: `ChatState`
  State of the chat.

- **name**: `String?`
  Name of the chat.

- **_uniqueChatIds**: `Set<String>`
  Set to store unique chat IDs.

- **_chats**: `List<ChatListTileDataModel>`
  List to store chat data using ChatListTileDataModel for backward compatibility.

- **_chatMessagesByUser**: `Map<String, List<ChatMessage>>`
  Map to store chat messages by chat ID.

- **_isLoadingMoreMessages**: `Map<String, bool>`
  Loading state for pagination (loading more messages).

