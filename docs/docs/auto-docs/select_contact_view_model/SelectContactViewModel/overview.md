# Overview for `SelectContactViewModel`

## Description

SelectContactViewModel class have different functions to interact with model.

 Functions include:
 * `getCurrentOrgUsersList` : to get all users of current organization.
 * `createChatWithUser` : to create a new chat with selected user.

## Dependencies

- BaseModel

## Members

- **_organizationService**: `OrganizationService`
  Organization service for accessing organization data.

- **_chatService**: `ChatService`
  Chat service for creating and managing chats.

- **userConfig**: `UserConfig`
  User configuration service for accessing current user and organization information.

- **orgMembersList**: `List&lt;User&gt;`
  orgMembersList is used to store all users of current organization.

