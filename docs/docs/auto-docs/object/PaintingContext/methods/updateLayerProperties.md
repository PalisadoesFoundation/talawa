# Method: `updateLayerProperties`

## Description

Update the composited layer of [child] without repainting its children.

 The render object must be attached to a [PipelineOwner], must have a
 composited layer, and must be in need of a composited layer update but
 not in need of painting. The render object's layer is re-used, and none
 of its children are repaint or their layers updated.

 See also:

  * [RenderObject.isRepaintBoundary], which determines if a [RenderObject]
    has a composited layer.

## Return Type
`void`

## Parameters

- `child`: `RenderObject`
