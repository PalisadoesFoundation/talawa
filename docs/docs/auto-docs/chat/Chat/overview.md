# Overview for `Chat`

## Description

The `Chat` class represents a chat in the new PostgreSQL-based chat system.

## Members

- **id**: `String?`
  The unique identifier of the chat.

- **name**: `String?`
  The name/title of the chat.

- **description**: `String?`
  A description of the chat.

- **createdAt**: `String?`
  The timestamp when the chat was created.

- **updatedAt**: `String?`
  The timestamp when the chat was last updated.

- **creator**: `ChatUser?`
  The user who created the chat.

- **members**: `List&lt;ChatUser&gt;?`
  A list of chat members.

- **messages**: `List&lt;ChatMessage&gt;?`
  A list of messages in the chat.

## Constructors

### Unnamed Constructor
Constructs a `Chat` instance.

 [id] is the unique identifier of the chat.
 [name] is the name/title of the chat.
 [description] is a description of the chat.
 [createdAt] is the timestamp when the chat was created.
 [updatedAt] is the timestamp when the chat was last updated.
 [creator] is the user who created the chat.
 [members] is a list of chat members.
 [messages] is a list of messages in the chat.

### fromJson
Creates a `Chat` instance from a JSON object.

 The [json] parameter is a map containing the chat data from the API.

 **params**:
 * `json`: JSON data from API containing chat information

 **returns**:
 * `Chat`: Parsed chat instance

#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
