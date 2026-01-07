# Method: `castFrom`

## Description

Adapts [source] to be a `StreamTransformer&lt;TS, TT&gt;`.

 This allows [source] to be used at the new type, but at run-time it
 must satisfy the requirements of both the new type and its original type.

 Data events passed into the returned transformer must also be instances
 of [SS], and data events produced by [source] for those events must
 also be instances of [TT].

## Return Type
`StreamTransformer&lt;TS, TT&gt;`

## Parameters

- `source`: `StreamTransformer&lt;SS, ST&gt;`
