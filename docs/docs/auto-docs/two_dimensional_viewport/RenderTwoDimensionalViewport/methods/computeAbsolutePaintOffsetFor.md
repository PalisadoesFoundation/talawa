# Method: `computeAbsolutePaintOffsetFor`

## Description

The offset at which the given `child` should be painted.

 The returned offset is from the top left corner of the inside of the
 viewport to the top left corner of the paint coordinate system of the
 `child`.

 This is useful when the one or both of the axes of the viewport are
 reversed. The normalized layout offset of the child is used to compute
 the paint offset in relation to the [verticalAxisDirection] and
 [horizontalAxisDirection].

## Return Type
`Offset`

## Parameters

- `child`: `RenderBox`
- ``: `dynamic`
