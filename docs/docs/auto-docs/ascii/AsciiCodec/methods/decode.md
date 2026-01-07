# Method: `decode`

## Description

Decodes the ASCII [bytes] (a list of unsigned 7-bit integers) to the
 corresponding string.

 If [bytes] contains values that are not in the range 0 .. 127, the decoder
 will eventually throw a [FormatException].

 If [allowInvalid] is not provided, it defaults to the value used to create
 this [AsciiCodec].

## Return Type
`String`

## Parameters

- `bytes`: `List&lt;int&gt;`
- ``: `dynamic`
