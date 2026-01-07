# Method: `paintOffsetOf`

## Description

The offset at which the given `child` should be painted.

 The returned offset is from the top left corner of the inside of the
 viewport to the top left corner of the paint coordinate system of the
 `child`.

 See also:

  * [computeAbsolutePaintOffset], which computes the paint offset from an
    explicit layout offset and growth direction instead of using the values
    computed for the child during layout.

## Return Type
`Offset`

## Parameters

- `child`: `RenderSliver`
