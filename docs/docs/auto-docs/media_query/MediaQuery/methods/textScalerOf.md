# Method: `textScalerOf`

## Description

Returns the [MediaQueryData.textScaler] for the nearest [MediaQuery]
 ancestor or [TextScaler.noScaling] if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.textScaler] property of the ancestor [MediaQuery]
 changes.

 

## Return Type
`TextScaler`

## Parameters

- `context`: `BuildContext`
