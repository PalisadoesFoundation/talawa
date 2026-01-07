# Method: `debugAddPaintCallback`

## Description

Registers a [DebugPaintCallback] that is called every time a [RenderView]
 repaints in debug mode.

 The callback may paint a debug overlay on top of the content of the
 [RenderView] provided to the callback. Callbacks are invoked in the
 order they were registered in.

 Neither registering a callback nor the continued presence of a callback
 changes how often [RenderView]s are repainted. It is up to the owner of
 the callback to call [markNeedsPaint] on any [RenderView] for which it
 wants to update the painted overlay.

 Does nothing in release mode.

## Return Type
`void`

## Parameters

- `callback`: `DebugPaintCallback`
