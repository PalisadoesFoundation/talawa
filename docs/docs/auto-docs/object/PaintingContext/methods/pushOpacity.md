# Method: `pushOpacity`

## Description

Blend further painting with an alpha value.

 The `offset` argument indicates an offset to apply to all the children
 (the rendering created by `painter`).

 The `alpha` argument is the alpha value to use when blending the painting
 done by `painter`. An alpha value of 0 means the painting is fully
 transparent and an alpha value of 255 means the painting is fully opaque.

 The `painter` callback will be called while the `alpha` is applied. It
 is called synchronously during the call to [pushOpacity].

 

 A [RenderObject] that uses this function is very likely to require its
 [RenderObject.alwaysNeedsCompositing] property to return true. That informs
 ancestor render objects that this render object will include a composited
 layer, which, for example, causes them to use composited clips.

## Return Type
`OpacityLayer`

## Parameters

- `offset`: `Offset`
- `alpha`: `int`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
