# Method: `castFrom`

## Description

Adapts [source] to be a `Stream&lt;T&gt;`.

 This allows [source] to be used at the new type, but at run-time it
 must satisfy the requirements of both the new type and its original type.

 Data events created by the source stream must also be instances of [T].

## Return Type
`Stream&lt;T&gt;`

## Parameters

- `source`: `Stream&lt;S&gt;`
