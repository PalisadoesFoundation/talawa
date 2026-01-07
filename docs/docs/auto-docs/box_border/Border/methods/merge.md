# Method: `merge`

## Description

Creates a [Border] that represents the addition of the two given
 [Border]s.

 It is only valid to call this if [BorderSide.canMerge] returns true for
 the pairwise combination of each side on both [Border]s.

## Return Type
`Border`

## Parameters

- `a`: `Border`
- `b`: `Border`
