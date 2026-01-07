# Method: `lerp`

## Description

Linearly interpolate between two shapes.

 Interpolates each parameter of the decoration separately.

 If both values are null, this returns null. Otherwise, it returns a
 non-null value, with null arguments treated like a [ShapeDecoration] whose
 fields are all null (including the [shape], which cannot normally be
 null).

 

 See also:

  * [Decoration.lerp], which can interpolate between any two types of
    [Decoration]s, not just [ShapeDecoration]s.
  * [lerpFrom] and [lerpTo], which are used to implement [Decoration.lerp]
    and which use [ShapeDecoration.lerp] when interpolating two
    [ShapeDecoration]s or a [ShapeDecoration] to or from null.

## Return Type
`ShapeDecoration?`

## Parameters

- `a`: `ShapeDecoration?`
- `b`: `ShapeDecoration?`
- `t`: `double`
