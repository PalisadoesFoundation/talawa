# Method: `pushClipRSuperellipse`

## Description

Clip further painting using a rounded superellipse.

 

 

 The `bounds` argument is used to specify the region of the canvas (in the
 caller's coordinate system) into which `painter` will paint.

 The `clipRSuperellipse` argument specifies the rounded-superellipse (in the caller's
 coordinate system) to use to clip the painting done by `painter`. It
 should not include the `offset`.

 The `painter` callback will be called while the `clipRSuperellipse` is applied. It
 is called synchronously during the call to [pushClipRSuperellipse].

 The `clipBehavior` argument controls how the rounded rectangle is clipped.

 Hit tests are performed based on the bounding box of the [RSuperellipse].

 

## Return Type
`ClipRSuperellipseLayer?`

## Parameters

- `needsCompositing`: `bool`
- `offset`: `Offset`
- `bounds`: `Rect`
- `clipRSuperellipse`: `RSuperellipse`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
- ``: `dynamic`
