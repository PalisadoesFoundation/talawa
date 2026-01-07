# Method: `debugRemovePaintCallback`

## Description

Removes a callback registered with [debugAddPaintCallback].

 It does not schedule a frame to repaint the [RenderView]s without the
 overlay painted by the removed callback. It is up to the owner of the
 callback to call [markNeedsPaint] on the relevant [RenderView]s to
 repaint them without the overlay.

 Does nothing in release mode.

## Return Type
`void`

## Parameters

- `callback`: `DebugPaintCallback`
