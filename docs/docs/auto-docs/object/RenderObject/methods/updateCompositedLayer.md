# Method: `updateCompositedLayer`

## Description

Update the composited layer owned by this render object.

 This method is called by the framework when [isRepaintBoundary] is true.

 If [oldLayer] is `null`, this method must return a new [OffsetLayer]
 (or subtype thereof). If [oldLayer] is not `null`, then this method must
 reuse the layer instance that is provided - it is an error to create a new
 layer in this instance. The layer will be disposed by the framework when
 either the render object is disposed or if it is no longer a repaint
 boundary.

 The [OffsetLayer.offset] property will be managed by the framework and
 must not be updated by this method.

 If a property of the composited layer needs to be updated, the render object
 must call [markNeedsCompositedLayerUpdate] which will schedule this method
 to be called without repainting children. If this widget was marked as
 needing to paint and needing a composited layer update, this method is only
 called once.

## Return Type
`OffsetLayer`

## Parameters

- ``: `dynamic`
