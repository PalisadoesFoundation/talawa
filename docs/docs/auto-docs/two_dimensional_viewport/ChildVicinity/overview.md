# Overview for `ChildVicinity`

## Description

The relative position of a child in a [TwoDimensionalViewport] in relation
 to other children of the viewport.

 While children can be plotted arbitrarily in two dimensional space, the
 [ChildVicinity] is used to disambiguate their positions, determining how to
 traverse the children of the space.

 Combined with the [RenderTwoDimensionalViewport.mainAxis], each child's
 vicinity determines its paint order among all of the children.

## Dependencies

- Comparable

## Members

- **invalid**: `ChildVicinity`
  Represents an unassigned child position. The given child may be in the
 process of moving from one position to another.

- **xIndex**: `int`
  The index of the child in the horizontal axis, relative to neighboring
 children.

 While children's offset and positioning may not be strictly defined in
 terms of rows and columns, like a table, [ChildVicinity.xIndex] and
 [ChildVicinity.yIndex] represents order of traversal in row or column
 major format.

- **yIndex**: `int`
  The index of the child in the vertical axis, relative to neighboring
 children.

 While children's offset and positioning may not be strictly defined in
 terms of rows and columns, like a table, [ChildVicinity.xIndex] and
 [ChildVicinity.yIndex] represents order of traversal in row or column
 major format.

## Constructors

### Unnamed Constructor
Creates a reference to a child in a two dimensional plane, with the
 [xIndex] and [yIndex] being relative to other children in the viewport.

