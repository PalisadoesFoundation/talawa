# Method: `resizeIfNeeded`

## Description

Composes the `provider` in a [ResizeImage] only when `cacheWidth` and
 `cacheHeight` are not both null.

 When `cacheWidth` and `cacheHeight` are both null, this will return the
 `provider` directly.

## Return Type
`ImageProvider&lt;Object&gt;`

## Parameters

- `cacheWidth`: `int?`
- `cacheHeight`: `int?`
- `provider`: `ImageProvider&lt;Object&gt;`
