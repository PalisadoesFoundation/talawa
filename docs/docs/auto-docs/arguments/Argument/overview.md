# Overview for `Argument`

## Description

Representation of an argument to a macro constructor.

## Dependencies

- Serializable

## Constructors

### Unnamed Constructor


### deserialize
Reads the next argument from [Deserializer].

 By default this will call `moveNext` on [deserializer] before reading the
 argument kind, but this can be skipped by passing `true` for
 [alreadyMoved].

#### Parameters

- `deserializer`: `Deserializer`
- ``: `dynamic`
