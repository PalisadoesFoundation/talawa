# Method: `lerp`

## Description

Linearly interpolates between two [LinearBorder]s.

 If both `a` and `b` are null then null is returned. If `a` is null
 then we interpolate to `b` varying [size] from 0.0 to `b.size`. If `b`
 is null then we interpolate from `a` varying size from `a.size` to zero.
 Otherwise both values are interpolated.

## Return Type
`LinearBorderEdge?`

## Parameters

- `a`: `LinearBorderEdge?`
- `b`: `LinearBorderEdge?`
- `t`: `double`
