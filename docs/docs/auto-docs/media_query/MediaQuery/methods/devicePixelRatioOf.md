# Method: `devicePixelRatioOf`

## Description

Returns [MediaQueryData.devicePixelRatio] for the nearest [MediaQuery] ancestor or
 throws an exception, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.devicePixelRatio] property of the ancestor [MediaQuery] changes.

 

## Return Type
`double`

## Parameters

- `context`: `BuildContext`
