# Method: `validateAdminAction`

## Description

Checks if a user can perform admin actions on a chat.

 **params**:
 * `chat`: The chat to check
 * `currentUserId`: The ID of the current user
 * `action`: The action to validate ('rename', 'add_member', 'remove_member', 'delete')

 **returns**:
 * `Map&lt;String, dynamic&gt;`: Map with 'isValid' boolean and 'error' string if invalid

## Return Type
`Map&lt;String, dynamic&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
