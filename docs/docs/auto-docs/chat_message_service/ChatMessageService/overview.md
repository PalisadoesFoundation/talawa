# Overview for `ChatMessageService`

## Description

Provides message services for the PostgreSQL-based chat system.

 Services include:
 * `getChatDetails` - gets chat details with messages
 * `sendMessage` - sends a message to a chat
 * `loadMoreMessages` - loads older messages with pagination
 * `hasMoreMessages` - checks if more messages are available
 * Real-time subscription services delegated to ChatSubscriptionService

## Members

- **_dbFunctions**: `DataBaseMutationFunctions`
  Database mutation functions.

- **_subscriptionService**: `ChatSubscriptionService`
  Subscription service for real-time messages.

- **_messagesPaginationInfo**: `Map&lt;String, PageInfo&gt;`
  Pagination information for chat messages per chat.

- **beforeCursor**: `Map&lt;String, String?&gt;`
  `before` cursor for loading older messages.

- **messagePageSize**: `int`
  `last` parameter for limiting the number of messages fetched.

## Constructors

### Unnamed Constructor


