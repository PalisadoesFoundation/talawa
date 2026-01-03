# Method: `onRefresh`

## Description

Handles the refresh action for the group chat list.

 This method is called when the user pulls down to refresh the group chat list.
 It sets the chat state to loading, triggers a refresh of the group chats,
 and adds a small delay for better user experience.

 **params**:
 * `model`: The GroupChatViewModel instance to refresh

 **returns**:
   None

## Return Type
`Future<void>`

## Parameters

- `model`: `GroupChatViewModel`
