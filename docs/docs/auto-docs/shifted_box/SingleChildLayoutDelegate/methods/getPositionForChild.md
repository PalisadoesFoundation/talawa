# Method: `getPositionForChild`

## Description

The position where the child should be placed.

 The `size` argument is the size of the parent, which might be different
 from the value returned by [getSize] if that size doesn't satisfy the
 constraints passed to [getSize]. The `childSize` argument is the size of
 the child, which will satisfy the constraints returned by
 [getConstraintsForChild].

 Defaults to positioning the child in the upper left corner of the parent.

## Return Type
`Offset`

## Parameters

- `size`: `Size`
- `childSize`: `Size`
