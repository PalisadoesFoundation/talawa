# Method: `correctBy`

## Description

Apply a layout-time correction to the scroll offset.

 This method should change the [pixels] value by `correction`, but without
 calling [notifyListeners]. It is called during layout by the
 [RenderViewport], before [applyContentDimensions]. After this method is
 called, the layout will be recomputed and that may result in this method
 being called again, though this should be very rare.

 See also:

  * [jumpTo], for also changing the scroll position when not in layout.
    [jumpTo] applies the change immediately and notifies its listeners.
  * [correctPixels], which is used by the [ScrollPosition] itself to
    set the offset initially during construction or after
    [applyViewportDimension] or [applyContentDimensions] is called.

## Return Type
`void`

## Parameters

- `correction`: `double`
