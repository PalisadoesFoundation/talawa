# Overview for `GroupChatAppBar`

## Description

GroupChatAppBar is a specialized app bar for group chat screens.

 This widget provides:
 - Group chat title and member count
 - Admin and non-admin specific actions
 - Navigation back functionality

## Dependencies

- StatelessWidget, PreferredSizeWidget

## Members

- **chatId**: `String`
  The ID of the group chat.

- **model**: `GroupChatViewModel`
  The GroupChatViewModel instance.

- **groupChatName**: `String`
  The display name of the group chat.

- **memberCount**: `int`
  The number of members in the group.

- **isCurrentUserAdmin**: `bool`
  Whether the current user is an admin.

- **currentChat**: `Chat?`
  The current chat object.

- **navigationService**: `dynamic`
  Navigation service instance.

## Constructors

### Unnamed Constructor
Creates a GroupChatAppBar widget.

