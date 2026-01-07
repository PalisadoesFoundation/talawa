# Method: `isFlingGesture`

## Description

Determines if a gesture is a fling or not based on velocity.

 A fling calls its gesture end callback with a velocity, allowing the
 provider of the callback to respond by carrying the gesture forward with
 inertia, for example.

## Return Type
`bool`

## Parameters

- `estimate`: `VelocityEstimate`
- `kind`: `PointerDeviceKind`
