# Method: `castFrom`

## Description

Adapts [source] to be a `Converter&lt;TS, TT&gt;`.

 This allows [source] to be used at the new type, but at run-time it
 must satisfy the requirements of both the new type and its original type.

 Conversion input must be both [SS] and [TS] and the output created by
 [source] for those input must be both [ST] and [TT].

## Return Type
`Converter&lt;TS, TT&gt;`

## Parameters

- `source`: `Converter&lt;SS, ST&gt;`
