# Method: `registerStringServiceExtension`

## Description

Registers a service extension method with the given name (full name
 "ext.flutter.name"), which optionally takes a single argument with the
 name "value". If the argument is omitted, the value is to be read,
 otherwise it is to be set. Returns the current value.

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
