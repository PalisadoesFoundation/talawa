# Method: `lerp`

## Description

Linearly interpolates between two [Decoration]s.

 This attempts to use [lerpFrom] and [lerpTo] on `b` and `a`
 respectively to find a solution. If the two values can't directly be
 interpolated, then the interpolation is done via null (at `t == 0.5`).

 

## Return Type
`Decoration?`

## Parameters

- `a`: `Decoration?`
- `b`: `Decoration?`
- `t`: `double`
