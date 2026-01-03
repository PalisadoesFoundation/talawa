# Method: `_fetchChatMessages`

## Description

Unified method to fetch chat messages with optional pagination setup.

 **params**:
 * `chatId`: The ID of the chat
 * `setupPagination`: Whether to set up pagination cursors
 * `beforeCursor`: Optional cursor for loading older messages

 **returns**:
 * `Future<Chat?>`: The chat with messages or null if failed

## Return Type
`Future<Chat?>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
