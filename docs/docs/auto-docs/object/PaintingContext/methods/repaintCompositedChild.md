# Method: `repaintCompositedChild`

## Description

Repaint the given render object.

 The render object must be attached to a [PipelineOwner], must have a
 composited layer, and must be in need of painting. The render object's
 layer, if any, is re-used, along with any layers in the subtree that don't
 need to be repainted.

 See also:

  * [RenderObject.isRepaintBoundary], which determines if a [RenderObject]
    has a composited layer.

## Return Type
`void`

## Parameters

- `child`: `RenderObject`
- ``: `dynamic`
