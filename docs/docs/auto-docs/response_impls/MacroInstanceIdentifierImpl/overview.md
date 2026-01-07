# Overview for `MacroInstanceIdentifierImpl`

## Description

Implementation of [MacroInstanceIdentifier].

## Dependencies

- MacroInstanceIdentifier

## Members

- **id**: `int`
  Unique identifier for this instance, passed in from the server.

- **_interfaces**: `int`
  A single int where each bit indicates whether a specific macro interface
 is implemented by this macro.

## Constructors

### _


#### Parameters

- `id`: `dynamic`
- `_interfaces`: `dynamic`
### Unnamed Constructor


### deserialize


#### Parameters

- `deserializer`: `Deserializer`
