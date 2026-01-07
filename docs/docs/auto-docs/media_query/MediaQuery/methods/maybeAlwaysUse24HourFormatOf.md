# Method: `maybeAlwaysUse24HourFormatOf`

## Description

Returns [MediaQueryData.alwaysUse24HourFormat] for the nearest
 [MediaQuery] ancestor or null, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.alwaysUse24HourFormat] property of the ancestor
 [MediaQuery] changes.

 

## Return Type
`bool?`

## Parameters

- `context`: `BuildContext`
