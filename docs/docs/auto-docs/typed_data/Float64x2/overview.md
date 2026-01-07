# Overview for `Float64x2`

## Description

Float64x2 immutable value type and operations.

 Float64x2 stores 2 64-bit floating point values in "lanes".
 The lanes are "x" and "y" respectively.

 It is a compile-time error for a class to attempt to extend or implement
 `Float64x2`.

## Constructors

### Unnamed Constructor


### splat


#### Parameters

- `v`: `double`
### zero


### fromFloat32x4
Uses the "x" and "y" lanes from [v].

#### Parameters

- `v`: `Float32x4`
