# Method: `getOffsetToReveal`

## Description

Returns the offset that would be needed to reveal the `target`
 [RenderObject].

 This is used by [RenderViewportBase.showInViewport], which is
 itself used by [RenderObject.showOnScreen] for
 [RenderViewportBase], which is in turn used by the semantics
 system to implement scrolling for accessibility tools.

 The optional `rect` parameter describes which area of that `target` object
 should be revealed in the viewport. If `rect` is null, the entire
 `target` [RenderObject] (as defined by its [RenderObject.paintBounds])
 will be revealed. If `rect` is provided it has to be given in the
 coordinate system of the `target` object.

 The `alignment` argument describes where the target should be positioned
 after applying the returned offset. If `alignment` is 0.0, the child must
 be positioned as close to the leading edge of the viewport as possible. If
 `alignment` is 1.0, the child must be positioned as close to the trailing
 edge of the viewport as possible. If `alignment` is 0.5, the child must be
 positioned as close to the center of the viewport as possible.

 The `target` might not be a direct child of this viewport but it must be a
 descendant of the viewport. Other viewports in between this viewport and
 the `target` will not be adjusted.

 This method assumes that the content of the viewport moves linearly, i.e.
 when the offset of the viewport is changed by x then `target` also moves
 by x within the viewport.

 The optional [Axis] is used by
 [RenderTwoDimensionalViewport.getOffsetToReveal] to
 determine which of the two axes to compute an offset for. One dimensional
 subclasses like [RenderViewportBase] and [RenderListWheelViewport]
 will ignore the `axis` value if provided, since there is only one [Axis].

 If the `axis` is omitted when called on [RenderTwoDimensionalViewport],
 the [RenderTwoDimensionalViewport.mainAxis] is used. To reveal an object
 properly in both axes, this method should be called for each [Axis] as the
 returned [RevealedOffset.offset] only represents the offset of one of the
 the two [ScrollPosition]s.

 See also:

  * [RevealedOffset], which describes the return value of this method.

## Return Type
`RevealedOffset`

## Parameters

- `target`: `RenderObject`
- `alignment`: `double`
- ``: `dynamic`
- ``: `dynamic`
