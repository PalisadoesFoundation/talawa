# Method: `computeChildMainAxisPosition`

## Description

Converts the `parentMainAxisPosition` into the child's coordinate system.

 The `parentMainAxisPosition` is a distance from the top edge (for vertical
 viewports) or left edge (for horizontal viewports) of the viewport bounds.
 This describes a line, perpendicular to the viewport's main axis, heretofore
 known as the target line.

 The child's coordinate system's origin in the main axis is at the leading
 edge of the given child, as given by the child's
 [SliverConstraints.axisDirection] and [SliverConstraints.growthDirection].

 This method returns the distance from the leading edge of the given child to
 the target line described above.

 (The `parentMainAxisPosition` is not from the leading edge of the
 viewport, it's always the top or left edge.)

## Return Type
`double`

## Parameters

- `child`: `RenderSliver`
- `parentMainAxisPosition`: `double`
