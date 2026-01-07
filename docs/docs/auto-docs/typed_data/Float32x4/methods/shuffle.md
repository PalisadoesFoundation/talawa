# Method: `shuffle`

## Description

Shuffle the lane values based on the [mask].

 The [mask] must be one of the 256 shuffle masks from [xxxx] to [wwww].

 Creates a new [Float32x4] whose lane values are taken from the
 lanes of this value based on the lanes of the shuffle mask,
 with the result's [x] lane being taken from the lane of the first
 letter of the shuffle mask's name, the [y] lane from the second letter,
 [z] lane from the third letter and [w] lane from the fourth letter.

 For example, the shuffle mask [wxyz] creates a new `Float32x4`
 whose [x] lane is the [w] lane of this value, because the first letter
 of the shuffle mask's name, `wxyz` is "w". Then the `y`, `z` and `w`
 lanes of the result are the values of the `x`, `y` and `z` lanes
 of this value.

 The [xyzw] "identity shuffle" mask gives a result with the same lanes
 as the original.

 Some masks preserve the values of all lanes, but may permute them.
 Other masks duplicates some lanes and discards the values of others.

 For example, doing `v1.shuffle(yyyy)` is equivalent to
 `Float32x4.splat(v1.y)`.

## Return Type
`Float32x4`

## Parameters

- `mask`: `int`
