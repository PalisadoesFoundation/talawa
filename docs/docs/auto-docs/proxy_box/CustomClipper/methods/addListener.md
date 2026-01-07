# Method: `addListener`

## Description

Register a closure to be notified when it is time to reclip.

 The [CustomClipper] implementation merely forwards to the same method on
 the [Listenable] provided to the constructor in the `reclip` argument, if
 it was not null.

## Return Type
`void`

## Parameters

- `listener`: `VoidCallback`
