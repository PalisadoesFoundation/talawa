# Method: `pushClipPath`

## Description

Clip further painting using a path.

 

 

 The `bounds` argument is used to specify the region of the canvas (in the
 caller's coordinate system) into which `painter` will paint.

 The `clipPath` argument specifies the [Path] (in the caller's coordinate
 system) to use to clip the painting done by `painter`. It should not
 include the `offset`.

 The `painter` callback will be called while the `clipPath` is applied. It
 is called synchronously during the call to [pushClipPath].

 The `clipBehavior` argument controls how the path is clipped.

 

## Return Type
`ClipPathLayer?`

## Parameters

- `needsCompositing`: `bool`
- `offset`: `Offset`
- `bounds`: `Rect`
- `clipPath`: `Path`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
- ``: `dynamic`
