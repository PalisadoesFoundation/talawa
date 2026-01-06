# Method: `onRefresh`

## Description

Handles the refresh action for the chat list.

 This method is called when the user pulls down to refresh the chat list.
 It sets the chat state to loading, triggers a refresh of the chats,
 and adds a small delay for better user experience.

 **params**:
 * `model`: The DirectChatViewModel instance to refresh

 **returns**:
   None

## Return Type
`Future&lt;void&gt;`

## Parameters

- `model`: `DirectChatViewModel`
