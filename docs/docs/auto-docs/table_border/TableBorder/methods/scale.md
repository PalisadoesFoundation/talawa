# Method: `scale`

## Description

Creates a copy of this border but with the widths scaled by the factor `t`.

 The `t` argument represents the multiplicand, or the position on the
 timeline for an interpolation from nothing to `this`, with 0.0 meaning
 that the object returned should be the nil variant of this object, 1.0
 meaning that no change should be applied, returning `this` (or something
 equivalent to `this`), and other values meaning that the object should be
 multiplied by `t`. Negative values are treated like zero.

 Values for `t` are usually obtained from an [Animation&lt;double&gt;], such as
 an [AnimationController].

 See also:

  * [BorderSide.scale], which is used to implement this method.

## Return Type
`TableBorder`

## Parameters

- `t`: `double`
