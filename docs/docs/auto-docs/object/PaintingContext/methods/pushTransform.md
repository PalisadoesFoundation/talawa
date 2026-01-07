# Method: `pushTransform`

## Description

Transform further painting using a matrix.

 

 The `offset` argument is the offset to pass to `painter` and the offset to
 the origin used by `transform`.

 The `transform` argument is the [Matrix4] with which to transform the
 coordinate system while calling `painter`. It should not include `offset`.
 It is applied effectively after applying `offset`.

 The `painter` callback will be called while the `transform` is applied. It
 is called synchronously during the call to [pushTransform].

 

## Return Type
`TransformLayer?`

## Parameters

- `needsCompositing`: `bool`
- `offset`: `Offset`
- `transform`: `Matrix4`
- `painter`: `PaintingContextCallback`
- ``: `dynamic`
