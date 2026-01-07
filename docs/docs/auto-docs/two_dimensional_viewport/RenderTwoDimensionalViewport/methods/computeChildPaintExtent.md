# Method: `computeChildPaintExtent`

## Description

Computes the portion of the child that is visible, assuming that only the
 region from the [ViewportOffset.pixels] of both dimensions to the
 [cacheExtent] is visible, and that the relationship between scroll offsets
 and paint offsets is linear.

 For example, if the [ViewportOffset]s each have a scroll offset of 100 and
 the arguments to this method describe a child with [layoutOffset] of
 `Offset(50.0, 50.0)`, with a size of `Size(200.0, 200.0)`, then the
 returned value would be `Size(150.0, 150.0)`, representing the visible
 extent of the child.

## Return Type
`Size`

## Parameters

- `layoutOffset`: `Offset`
- `childSize`: `Size`
