# Overview for `ChatMembershipService`

## Description

Provides chat membership management services for the PostgreSQL-based chat system.

 Services include:
 * `createChatMembership` - adds a user to a chat
 * `addChatMember` - alias for createChatMembership
 * `removeChatMember` - removes a user from a chat
 * `fetchChatMembers` - gets chat members with pagination

## Members

- **_dbFunctions**: `DataBaseMutationFunctions`
  Database mutation functions.

- **navigationService**: `dynamic`
  Navigation service instance.

## Constructors

### Unnamed Constructor


