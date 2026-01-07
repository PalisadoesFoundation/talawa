# Method: `shuffleMix`

## Description

Mixes lanes chosen from two [Float32x4] values using a [mask].

 Creates a new [Float32x4] where the [x] and [y] lanes are chosen
 from the lanes of this value selected by the first two letters of the
 [mask]'s name, and the [z] and [w] lanes are the lanes of [other]
 selected by the last two letters of the `mask`'s name.

 For example, `v1.shuffleMix(v2, Float32x4.xyzw)` is equivalent
 to `Float32x4(v1.x, v1.y, v2.z, v2.w)`.

 If [other] is the same value as this `Float32x4`, this function
 is the same as [shuffle]. That is, doing
 `v1.shuffleMix(v1, mask)` is equivalent to `v1.shuffle(mask)`.

## Return Type
`Float32x4`

## Parameters

- `other`: `Float32x4`
- `mask`: `int`
