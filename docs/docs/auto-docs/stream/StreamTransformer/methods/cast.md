# Method: `cast`

## Description

Provides a `StreamTransformer&lt;RS, RT&gt;` view of this stream transformer.

 The resulting transformer will check at run-time that all data events
 of the stream it transforms are actually instances of [S],
 and it will check that all data events produced by this transformer
 are actually instances of [RT].

## Return Type
`StreamTransformer&lt;RS, RT&gt;`

