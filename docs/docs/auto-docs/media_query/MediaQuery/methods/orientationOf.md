# Method: `orientationOf`

## Description

Returns [MediaQueryData.orientation] for the nearest [MediaQuery] ancestor or
 throws an exception, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.orientation] property of the ancestor [MediaQuery] changes.

 

## Return Type
`Orientation`

## Parameters

- `context`: `BuildContext`
