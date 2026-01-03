# Method: `extractGroupName`

## Description

Extracts the group name by removing the chatId suffix.

 Group chats may have their chatId appended as a suffix to ensure uniqueness.
 This method removes that suffix to get the user-friendly name.

 **params**:
 * `chatName`: The full chat name that may include chatId suffix

 **returns**:
 * `String`: The group name without the chatId suffix

## Return Type
`String`

## Parameters

- `chatName`: `String`
