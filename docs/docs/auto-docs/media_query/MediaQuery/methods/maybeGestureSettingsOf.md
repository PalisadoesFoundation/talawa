# Method: `maybeGestureSettingsOf`

## Description

Returns [MediaQueryData.gestureSettings] for the nearest [MediaQuery]
 ancestor or null, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.gestureSettings] property of the ancestor [MediaQuery]
 changes.

 

## Return Type
`DeviceGestureSettings?`

## Parameters

- `context`: `BuildContext`
