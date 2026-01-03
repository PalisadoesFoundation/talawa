# Method: `fetchGroupMembers`

## Description

Fetches all members of a specific group chat with pagination support.

 This method uses the ChatService. to load members
 with pagination, which is useful for groups with many members.

 **params**:
 * `chatId`: The ID of the group chat
 * `limit`: Maximum number of members to fetch (default: 32)

 **returns**:
 * `Future<List<dynamic>?>`: List of chat members or null if failed

## Return Type
`Future<List<dynamic>?>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
