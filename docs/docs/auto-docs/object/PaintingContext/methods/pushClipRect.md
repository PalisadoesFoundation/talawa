# Method: `pushClipRect`

## Description

Clip further painting using a rectangle.

 
 The `needsCompositing` argument specifies whether the child needs
 compositing. Typically this matches the value of
 [RenderObject.needsCompositing] for the caller. If false, this method
 returns null, indicating that a layer is no longer necessary. If a render
 object calling this method stores the `oldLayer` in its
 [RenderObject.layer] field, it should set that field to null.

 When `needsCompositing` is false, this method will use a more efficient
 way to apply the layer effect than actually creating a layer.
 

 
 The `offset` argument is the offset from the origin of the canvas'
 coordinate system to the origin of the caller's coordinate system.
 

 The `clipRect` is the rectangle (in the caller's coordinate system) to use
 to clip the painting done by [painter]. It should not include the
 `offset`.

 The `painter` callback will be called while the `clipRect` is applied. It
 is called synchronously during the call to [pushClipRect].

 The `clipBehavior` argument controls how the rectangle is clipped.

 
 For the `oldLayer` argument, specify the layer created in the previous
 frame. This gives the engine more information for performance
 optimizations. Typically this is the value of [RenderObject.layer] that a
 render object creates once, then reuses for all subsequent frames until a
 layer is no longer needed (e.g. the render object no longer needs
 compositing) or until the render object changes the type of the layer
 (e.g. from opacity layer to a clip rect layer).
 

## Return Type
`ClipRectLayer?`

## Parameters

- `needsCompositing`: `bool`
- `offset`: `Offset`
- `clipRect`: `Rect`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
- ``: `dynamic`
