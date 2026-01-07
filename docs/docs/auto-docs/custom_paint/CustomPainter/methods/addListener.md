# Method: `addListener`

## Description

Register a closure to be notified when it is time to repaint.

 The [CustomPainter] implementation merely forwards to the same method on
 the [Listenable] provided to the constructor in the `repaint` argument, if
 it was not null.

## Return Type
`void`

## Parameters

- `listener`: `VoidCallback`
