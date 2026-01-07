# Method: `decode`

## Description

Decodes the Latin-1 [bytes] (a list of unsigned 8-bit integers) to the
 corresponding string.

 If [bytes] contains values that are not in the range 0 .. 255, the decoder
 will eventually throw a [FormatException].

 If [allowInvalid] is not provided, it defaults to the value used to create
 this [Latin1Codec].

## Return Type
`String`

## Parameters

- `bytes`: `List&lt;int&gt;`
- ``: `dynamic`
