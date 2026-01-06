# Method: `getDisplayName`

## Description

Gets the display name for a chat based on its type.

 For group chats, extracts the clean name without chatId suffix.
 For direct chats, creates a name from member names.

 **params**:
 * `chat`: The chat to get the display name for
 * `currentUserId`: The ID of the current user (to exclude from direct chat names)

 **returns**:
 * `String`: The appropriate display name for the chat

## Return Type
`String`

## Parameters

- `chat`: `Chat`
- `currentUserId`: `String`
