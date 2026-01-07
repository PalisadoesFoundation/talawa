# Method: `lerp`

## Description

Linearly interpolate between two borders.

 If a border is null, it is treated as having four [BorderSide.none]
 borders.

 This supports interpolating between [Border] and [BorderDirectional]
 objects. If both objects are different types but both have sides on one or
 both of their lateral edges (the two sides that aren't the top and bottom)
 other than [BorderSide.none], then the sides are interpolated by reducing
 `a`'s lateral edges to [BorderSide.none] over the first half of the
 animation, and then bringing `b`'s lateral edges _from_ [BorderSide.none]
 over the second half of the animation.

 For a more flexible approach, consider [ShapeBorder.lerp], which would
 instead [add] the two sets of sides and interpolate them simultaneously.

 

## Return Type
`BoxBorder?`

## Parameters

- `a`: `BoxBorder?`
- `b`: `BoxBorder?`
- `t`: `double`
