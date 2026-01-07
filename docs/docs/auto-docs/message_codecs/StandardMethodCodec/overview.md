# Overview for `StandardMethodCodec`

## Description

[MethodCodec] using the Flutter standard binary encoding.

 The standard codec is guaranteed to be compatible with the corresponding
 standard codec for FlutterMethodChannels on the host platform. These parts
 of the Flutter SDK are evolved synchronously.

 Values supported as method arguments and result payloads are those supported
 by [StandardMessageCodec].

## Dependencies

- MethodCodec

## Members

- **messageCodec**: `StandardMessageCodec`
  The message codec that this method codec uses for encoding values.

## Constructors

### Unnamed Constructor
Creates a [MethodCodec] using the Flutter standard binary encoding.

