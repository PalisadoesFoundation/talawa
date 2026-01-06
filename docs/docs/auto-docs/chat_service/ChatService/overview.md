# Overview for `ChatService`

## Description

Unified service that provides all chat-related functionality.

 This service acts as a facade that delegates to specialized services:
 - ChatCoreService: Core chat operations (CRUD)
 - ChatMembershipService: Member management operations
 - ChatMessageService: Message and subscription operations

## Members

- **_coreService**: `ChatCoreService`
  Core chat operations service.

- **_membershipService**: `ChatMembershipService`
  Membership management service.

- **_messageService**: `ChatMessageService`
  Message and subscription service.

## Constructors

### Unnamed Constructor


