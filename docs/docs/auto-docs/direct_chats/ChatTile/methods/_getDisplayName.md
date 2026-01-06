# Method: `_getDisplayName`

## Description

Gets the display name for the chat based on chat type and participants.

 For direct chats (2 users), returns the name of the other participant.
 For group chats, returns the chat name or "Unknown Chat" if no name is set.

 **params**:
 * `chat`: The ChatListTileDataModel containing chat information

 **returns**:
 * `String`: The display name for the chat

## Return Type
`String`

## Parameters

- `chat`: `ChatListTileDataModel`
