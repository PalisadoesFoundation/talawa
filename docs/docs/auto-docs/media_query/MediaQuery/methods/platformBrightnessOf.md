# Method: `platformBrightnessOf`

## Description

Returns [MediaQueryData.platformBrightness] for the nearest [MediaQuery]
 ancestor or [Brightness.light], if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.platformBrightness] property of the ancestor
 [MediaQuery] changes.

 

## Return Type
`Brightness`

## Parameters

- `context`: `BuildContext`
