# Method: `considerFling`

## Description

Determines if a gesture is a fling or not, and if so its effective velocity.

 A fling calls its gesture end callback with a velocity, allowing the
 provider of the callback to respond by carrying the gesture forward with
 inertia, for example.

## Return Type
`DragEndDetails?`

## Parameters

- `estimate`: `VelocityEstimate`
- `kind`: `PointerDeviceKind`
