# Method: `pushColorFilter`

## Description

Blend further painting with a color filter.

 

 The `colorFilter` argument is the [ColorFilter] value to use when blending
 the painting done by `painter`.

 The `painter` callback will be called while the `colorFilter` is applied.
 It is called synchronously during the call to [pushColorFilter].

 

 A [RenderObject] that uses this function is very likely to require its
 [RenderObject.alwaysNeedsCompositing] property to return true. That informs
 ancestor render objects that this render object will include a composited
 layer, which, for example, causes them to use composited clips.

## Return Type
`ColorFilterLayer`

## Parameters

- `offset`: `Offset`
- `colorFilter`: `ColorFilter`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
