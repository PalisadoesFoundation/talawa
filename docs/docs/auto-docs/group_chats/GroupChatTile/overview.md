# Overview for `GroupChatTile`

## Description

GroupChatTile returns a widget for a tile in the list of Group Chats in the Chat List Screen.

 This widget displays individual group chat information including group avatar,
 chat name, description, member count, and timestamp. It handles navigation to the
 chat message screen when tapped.

## Dependencies

- StatelessWidget

## Members

- **chat**: `ChatListTileDataModel`
  The chat data model containing chat information and member details.

- **model**: `GroupChatViewModel`
  The GroupChatViewModel instance for handling group chat operations.

## Constructors

### Unnamed Constructor
Creates a GroupChatTile widget.

 The [chat] and [model] parameters are required.

