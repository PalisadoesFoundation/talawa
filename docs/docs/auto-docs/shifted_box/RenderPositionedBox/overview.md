# Overview for `RenderPositionedBox`

## Description

Positions its child using an [AlignmentGeometry].

 For example, to align a box at the bottom right, you would pass this box a
 tight constraint that is bigger than the child's natural size,
 with an alignment of [Alignment.bottomRight].

 By default, sizes to be as big as possible in both axes. If either axis is
 unconstrained, then in that direction it will be sized to fit the child's
 dimensions. Using widthFactor and heightFactor you can force this latter
 behavior in all cases.

## Dependencies

- RenderAligningShiftedBox

## Members

- **_widthFactor**: `double?`
- **_heightFactor**: `double?`
## Constructors

### Unnamed Constructor
Creates a render object that positions its child.

