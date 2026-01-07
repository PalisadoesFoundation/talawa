# Method: `pushClipRRect`

## Description

Clip further painting using a rounded rectangle.

 

 

 The `bounds` argument is used to specify the region of the canvas (in the
 caller's coordinate system) into which `painter` will paint.

 The `clipRRect` argument specifies the rounded-rectangle (in the caller's
 coordinate system) to use to clip the painting done by `painter`. It
 should not include the `offset`.

 The `painter` callback will be called while the `clipRRect` is applied. It
 is called synchronously during the call to [pushClipRRect].

 The `clipBehavior` argument controls how the rounded rectangle is clipped.

 

## Return Type
`ClipRRectLayer?`

## Parameters

- `needsCompositing`: `bool`
- `offset`: `Offset`
- `bounds`: `Rect`
- `clipRRect`: `RRect`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
- ``: `dynamic`
