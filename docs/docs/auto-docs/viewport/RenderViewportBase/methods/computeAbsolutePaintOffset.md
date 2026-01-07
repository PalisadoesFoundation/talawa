# Method: `computeAbsolutePaintOffset`

## Description

The offset at which the given `child` should be painted.

 The returned offset is from the top left corner of the inside of the
 viewport to the top left corner of the paint coordinate system of the
 `child`.

 See also:

  * [paintOffsetOf], which uses the layout offset and growth direction
    computed for the child during layout.

## Return Type
`Offset`

## Parameters

- `child`: `RenderSliver`
- `layoutOffset`: `double`
- `growthDirection`: `GrowthDirection`
