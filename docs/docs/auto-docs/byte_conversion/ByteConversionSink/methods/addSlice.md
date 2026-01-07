# Method: `addSlice`

## Description

Adds the next [chunk] to `this`.

 Adds the bytes defined by [start] and [end]-exclusive to `this`.

 If [isLast] is `true` closes `this`.

 Contrary to `add` the given [chunk] must not be held onto.
 Once the method returns, it is safe to overwrite the data in it.

## Return Type
`void`

## Parameters

- `chunk`: `List&lt;int&gt;`
- `start`: `int`
- `end`: `int`
- `isLast`: `bool`
