# Method: `pushLayer`

## Description

Appends the given layer to the recording, and calls the `painter` callback
 with that layer, providing the `childPaintBounds` as the estimated paint
 bounds of the child. The `childPaintBounds` can be used for debugging but
 have no effect on painting.

 The given layer must be an unattached orphan. (Providing a newly created
 object, rather than reusing an existing layer, satisfies that
 requirement.)

 
 The `offset` is the offset to pass to the `painter`. In particular, it is
 not an offset applied to the layer itself. Layers conceptually by default
 have no position or size, though they can transform their contents. For
 example, an [OffsetLayer] applies an offset to its children.
 

 If the `childPaintBounds` are not specified then the current layer's paint
 bounds are used. This is appropriate if the child layer does not apply any
 transformation or clipping to its contents. The `childPaintBounds`, if
 specified, must be in the coordinate system of the new layer (i.e. as seen
 by its children after it applies whatever transform to its contents), and
 should not go outside the current layer's paint bounds.

 See also:

  * [addLayer], for pushing a layer without painting further contents
    within it.

## Return Type
`void`

## Parameters

- `childLayer`: `ContainerLayer`
- `painter`: `PaintingContextCallback`
- `offset`: `Offset`
- ``: `dynamic`
