# Method: `removePortNameMapping`

## Description

Removes a name-to-[SendPort] mapping given its name.

 Returns true if the mapping was successfully removed, false if the mapping
 did not exist. To add a registration, consider [registerPortWithName].

 Generally, removing a port name mapping is an inherently racy operation
 (another isolate could have obtained the name just prior to the name being
 removed, and thus would still be able to communicate over the port even
 after it has been removed).

 The `name` argument must not be null.

## Return Type
`bool`

## Parameters

- `name`: `String`
