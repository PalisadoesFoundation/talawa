# Method: `lerp`

## Description

Linearly interpolate between two box decorations.

 Interpolates each parameter of the box decoration separately.

 The [shape] is not interpolated. To interpolate the shape, consider using
 a [ShapeDecoration] with different border shapes.

 If both values are null, this returns null. Otherwise, it returns a
 non-null value. If one of the values is null, then the result is obtained
 by applying [scale] to the other value. If neither value is null and `t ==
 0.0`, then `a` is returned unmodified; if `t == 1.0` then `b` is returned
 unmodified. Otherwise, the values are computed by interpolating the
 properties appropriately.

 

 See also:

  * [Decoration.lerp], which can interpolate between any two types of
    [Decoration]s, not just [BoxDecoration]s.
  * [lerpFrom] and [lerpTo], which are used to implement [Decoration.lerp]
    and which use [BoxDecoration.lerp] when interpolating two
    [BoxDecoration]s or a [BoxDecoration] to or from null.

## Return Type
`BoxDecoration?`

## Parameters

- `a`: `BoxDecoration?`
- `b`: `BoxDecoration?`
- `t`: `double`
