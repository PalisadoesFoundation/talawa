# Method: `paint`

## Description

Paint the child via [painter], applying any effects that would have been painted
 in [SnapshotPainter.paintSnapshot].

 This method is called when snapshotting is disabled, or when [SnapshotMode.permissive]
 is used and a child platform view prevents snapshotting.

 The [offset] and [size] are the location and dimensions of the render object.

## Return Type
`void`

## Parameters

- `context`: `PaintingContext`
- `offset`: `Offset`
- `size`: `Size`
- `painter`: `PaintingContextCallback`
