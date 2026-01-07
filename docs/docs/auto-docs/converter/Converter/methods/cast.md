# Method: `cast`

## Description

Provides a `Converter&lt;RS, RT&gt;` view of this stream transformer.

 The resulting transformer will check at run-time that all conversion
 inputs are actually instances of [S],
 and it will check that all conversion output produced by this converter
 are actually instances of [RT].

## Return Type
`Converter&lt;RS, RT&gt;`

