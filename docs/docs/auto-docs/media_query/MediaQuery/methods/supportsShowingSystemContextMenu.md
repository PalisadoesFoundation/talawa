# Method: `supportsShowingSystemContextMenu`

## Description

Returns [MediaQueryData.supportsShowingSystemContextMenu] for the nearest
 [MediaQuery] ancestor or throws an exception, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.supportsShowingSystemContextMenu] property of the
 ancestor [MediaQuery] changes.

 

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
