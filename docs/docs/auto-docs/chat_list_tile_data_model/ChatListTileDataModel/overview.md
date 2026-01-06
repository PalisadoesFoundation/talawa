# Overview for `ChatListTileDataModel`

## Description

This class provides backward compatibility for existing UI components.

 that expect the old chat list tile data structure.

## Members

- **users**: `List&lt;ChatUser&gt;?`
  List of users in the chat (for backward compatibility).

- **id**: `String?`
  Chat ID (for backward compatibility).

- **chat**: `Chat?`
  The full chat object (new field for PostgreSQL support).

## Constructors

### Unnamed Constructor


### fromChat
Creates a `ChatListTileDataModel` from a `Chat` instance.

 This is a convenience constructor for adapting the new Chat model
 to the existing UI components.

 **params**:
 * `chat`: The Chat instance to adapt

 **returns**:
 * `ChatListTileDataModel`: Adapted data model for UI

#### Parameters

- `chat`: `Chat`
