# Method: `clampOffset`

## Description

Determines which provided leading or trailing edge of the viewport, as
 [RevealedOffset]s, will be used for [RenderViewportBase.showInViewport]
 accounting for the size and already visible portion of the [RenderObject]
 that is being revealed.

 Also used by [RenderTwoDimensionalViewport.showInViewport] for each
 horizontal and vertical [Axis].

 If the target [RenderObject] is already fully visible, this will return
 null.

## Return Type
`RevealedOffset?`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
