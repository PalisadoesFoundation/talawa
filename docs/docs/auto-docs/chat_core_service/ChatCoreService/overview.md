# Overview for `ChatCoreService`

## Description

Provides core chat management services for the PostgreSQL-based chat system.

 Services include:
 * `createChat` - creates a new chat
 * `getChatsByUser` - gets all chats for a user
 * `deleteChat` - deletes a chat
 * `updateChat` - updates chat name/description

## Members

- **_dbFunctions**: `DataBaseMutationFunctions`
  Database mutation functions.

- **_chatListStream**: `Stream<Chat>`
  Stream for chat list data.

- **_userConfig**: `dynamic`
  User configuration instance.

- **navigationService**: `dynamic`
  Navigation service instance.

- **_chatController**: `StreamController<Chat>`
  Controller for chat list stream.

## Constructors

### Unnamed Constructor


