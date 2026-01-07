# Method: `registerNumericServiceExtension`

## Description

Registers a service extension method with the given name (full
 name "ext.flutter.name"), which takes a single argument with the
 same name as the method which, if present, must have a value
 that can be parsed by [double.parse], and can be omitted to read
 the current value. (Other arguments are ignored.)

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
