# Method: `registerPortWithName`

## Description

Registers a [SendPort] with a given name.

 Returns true if registration is successful, and false if the name entry
 already existed (in which case the earlier registration is left
 unchanged). To remove a registration, consider [removePortNameMapping].

 Once a port has been registered with a name, it can be obtained from any
 [Isolate] using [lookupPortByName].

 Multiple isolates should avoid attempting to register ports with the same
 name, as there is an inherent race condition in doing so.

 The `port` and `name` arguments must not be null.

## Return Type
`bool`

## Parameters

- `port`: `SendPort`
- `name`: `String`
