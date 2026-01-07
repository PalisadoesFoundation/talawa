# Method: `maybeSizeOf`

## Description

Returns [MediaQueryData.size] from the nearest [MediaQuery] ancestor or
 null, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.size] property of the ancestor [MediaQuery] changes.

 
 Prefer using this function over getting the attribute directly from the
 [MediaQueryData] returned from [maybeOf], because using this function will
 only rebuild the `context` when this specific attribute changes, not when
 _any_ attribute changes.
 

## Return Type
`Size?`

## Parameters

- `context`: `BuildContext`
