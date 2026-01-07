# Method: `merge`

## Description

Creates a [BorderDirectional] that represents the addition of the two
 given [BorderDirectional]s.

 It is only valid to call this if [BorderSide.canMerge] returns true for
 the pairwise combination of each side on both [BorderDirectional]s.

## Return Type
`BorderDirectional`

## Parameters

- `a`: `BorderDirectional`
- `b`: `BorderDirectional`
