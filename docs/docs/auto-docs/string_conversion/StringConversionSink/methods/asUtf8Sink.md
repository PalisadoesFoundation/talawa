# Method: `asUtf8Sink`

## Description

Returns `this` as a sink that accepts UTF-8 input.

 If used, this method must be the first and only call to `this`. It
 invalidates `this`. All further operations must be performed on the result.

## Return Type
`ByteConversionSink`

## Parameters

- `allowMalformed`: `bool`
