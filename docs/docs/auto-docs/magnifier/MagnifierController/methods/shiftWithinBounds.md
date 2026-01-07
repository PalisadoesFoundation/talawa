# Method: `shiftWithinBounds`

## Description

A utility for calculating a new [Rect] from [rect] such that
 [rect] is fully constrained within [bounds].

 Any point in the output rect is guaranteed to also be a point contained in [bounds].

 It is a runtime error for [rect].width to be greater than [bounds].width,
 and it is also an error for [rect].height to be greater than [bounds].height.

 This algorithm translates [rect] the shortest distance such that it is entirely within
 [bounds].

 If [rect] is already within [bounds], no shift will be applied to [rect] and
 [rect] will be returned as-is.

 It is perfectly valid for the output rect to have a point along the edge of the
 [bounds]. If the desired output rect requires that no edges are parallel to edges
 of [bounds], see [Rect.deflate] by 1 on [bounds] to achieve this effect.

## Return Type
`Rect`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
