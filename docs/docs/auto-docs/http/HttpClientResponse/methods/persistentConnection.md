# Method: `persistentConnection`

## Description

Gets the persistent connection state returned by the server.

 If the persistent connection state needs to be set, it must be
 set before the body is written to. Setting the persistent connection state
 after writing to the body will throw a `StateError`.

## Return Type
`bool`

