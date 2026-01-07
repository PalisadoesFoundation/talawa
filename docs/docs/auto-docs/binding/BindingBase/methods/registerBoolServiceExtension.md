# Method: `registerBoolServiceExtension`

## Description

Registers a service extension method with the given name (full
 name "ext.flutter.name"), which takes a single argument
 "enabled" which can have the value "true" or the value "false"
 or can be omitted to read the current value. (Any value other
 than "true" is considered equivalent to "false". Other arguments
 are ignored.)

 Calls the `getter` callback to obtain the value when
 responding to the service extension method being called.

 Calls the `setter` callback with the new value when the
 service extension method is called with a new value.

 

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
