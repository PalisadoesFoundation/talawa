# Overview for `ChatMessage`

## Description

The `ChatMessage` class represents a message in the new PostgreSQL-based chat system.

## Members

- **id**: `String?`
  The unique identifier of the message.

- **body**: `String?`
  The actual text content of the message.

- **creator**: `ChatUser?`
  The user who created the message.

- **chatId**: `String?`
  The ID of the chat this message belongs to.

- **parentMessage**: `ChatMessage?`
  The parent message if this is a reply.

- **createdAt**: `String?`
  The timestamp when the message was created.

- **updatedAt**: `String?`
  The timestamp when the message was last updated.

## Constructors

### Unnamed Constructor
Constructs a `ChatMessage` instance.

 [id] is the unique identifier of the message.
 [body] is the actual text content of the message.
 [creator] is the user who created the message.
 [chatId] is the ID of the chat this message belongs to.
 [parentMessage] is the parent message if this is a reply.
 [createdAt] is the timestamp when the message was created.
 [updatedAt] is the timestamp when the message was last updated.

### fromJson
Creates a `ChatMessage` instance from a JSON object.

 The [json] parameter is a map containing the message data from the API.

 **params**:
 * `json`: JSON data from API containing message information

 **returns**:
 * `ChatMessage`: Parsed chat message instance

#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
