# Method: `lerp`

## Description

Linearly interpolate between two box shadows.

 If either box shadow is null, this function linearly interpolates from
 a box shadow that matches the other box shadow in color but has a zero
 offset and a zero blurRadius.

 

## Return Type
`BoxShadow?`

## Parameters

- `a`: `BoxShadow?`
- `b`: `BoxShadow?`
- `t`: `double`
