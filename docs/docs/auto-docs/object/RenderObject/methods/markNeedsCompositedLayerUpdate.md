# Method: `markNeedsCompositedLayerUpdate`

## Description

Mark this render object as having changed a property on its composited
 layer.

 Render objects that have a composited layer have [isRepaintBoundary] equal
 to true may update the properties of that composited layer without repainting
 their children. If this render object is a repaint boundary but does
 not yet have a composited layer created for it, this method will instead
 mark the nearest repaint boundary parent as needing to be painted.

 If this method is called on a render object that is not a repaint boundary
 or is a repaint boundary but hasn't been composited yet, it is equivalent
 to calling [markNeedsPaint].

 See also:

  * [RenderOpacity], which uses this method when its opacity is updated to
    update the layer opacity without repainting children.

## Return Type
`void`

