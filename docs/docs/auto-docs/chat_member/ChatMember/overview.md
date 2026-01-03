# Overview for `ChatMember`

## Description

The `ChatMember` class represents a member of a chat with their role.

 This class wraps a `ChatUser` and adds role information to represent
 the new API schema where chat members have roles.

## Members

- **user**: `ChatUser`
  The user who is a member of the chat.

- **role**: `ChatMembershipRole?`
  The role of the user in the chat.

## Constructors

### Unnamed Constructor
Constructs a `ChatMember` instance.

 [user] is the user who is a member of the chat.
 [role] is the role of the user in the chat.

### fromJson
Creates a `ChatMember` instance from a JSON object.

 The [json] parameter is a map containing the chat member data from the API.
 It expects a nested 'user' object and an optional 'role' field.

 **params**:
 * `json`: JSON data from API containing chat member information

 **returns**:
 * `ChatMember`: Parsed chat member instance

#### Parameters

- `json`: `Map<String, dynamic>`
