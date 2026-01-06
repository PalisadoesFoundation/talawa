# Method: `fetchChatMembers`

## Description

Fetches members of a specific chat with pagination support.

 **params**:
 * `chatId`: The ID of the chat
 * `first`: Number of members to fetch from the beginning (optional)
 * `last`: Number of members to fetch from the end (optional)
 * `after`: Cursor for forward pagination (optional)
 * `before`: Cursor for backward pagination (optional)

 **returns**:
 * `Future&lt;Map&lt;String, dynamic&gt;?&gt;`: Chat with members and pagination info, or null if failed

## Return Type
`Future&lt;Map&lt;String, dynamic&gt;?&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
