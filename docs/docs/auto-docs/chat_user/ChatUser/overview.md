# Overview for `ChatUser`

## Description

The `ChatUser` class represents a user in the chat system.

## Members

- **firstName**: `String?`
  The first name of the user.

- **id**: `String?`
  The unique identifier of the user.

- **image**: `String?`
  The URL of the user's profile image.

## Constructors

### Unnamed Constructor
Constructs a `ChatUser` instance.

 [firstName] is the first name of the user.
 [id] is the unique identifier of the user.
 [image] is the URL of the user's profile image.

### fromJson
Creates a `ChatUser` instance from a JSON object.

 The [json] parameter is a map containing the user data.
 Handles the new PostgreSQL API format with 'name' and 'avatarURL' fields.

 **params**:
 * `json`: Map containing user data from API

 **returns**:
 * `ChatUser`: Parsed chat user instance

#### Parameters

- `json`: `Map&lt;String, dynamic&gt;`
