# Overview for `ClosableStringSink`

## Description

A [ClosableStringSink] extends the [StringSink] interface by adding a
 `close` method.

## Dependencies

- StringSink

## Constructors

### fromStringSink
Creates a new instance combining a [StringSink] [sink] and a callback
 [onClose] which is invoked when the returned instance is closed.

#### Parameters

- `sink`: `StringSink`
- ``: `dynamic`
