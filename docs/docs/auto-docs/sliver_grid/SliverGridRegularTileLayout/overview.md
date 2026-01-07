# Overview for `SliverGridRegularTileLayout`

## Description

A [SliverGridLayout] that uses equally sized and spaced tiles.

 Rather that providing a grid with a [SliverGridLayout] directly, you instead
 provide the grid a [SliverGridDelegate], which can compute a
 [SliverGridLayout] given the current [SliverConstraints].

 This layout is used by [SliverGridDelegateWithFixedCrossAxisCount] and
 [SliverGridDelegateWithMaxCrossAxisExtent].

 See also:

  * [SliverGridDelegateWithFixedCrossAxisCount], which uses this layout.
  * [SliverGridDelegateWithMaxCrossAxisExtent], which uses this layout.
  * [SliverGridLayout], which represents an arbitrary tile layout.
  * [SliverGridGeometry], which represents the size and position of a single
    tile in a grid.
  * [SliverGridDelegate.getLayout], which returns this object to describe the
    delegate's layout.
  * [RenderSliverGrid], which uses this class during its
    [RenderSliverGrid.performLayout] method.

## Dependencies

- SliverGridLayout

## Members

- **crossAxisCount**: `int`
  The number of children in the cross axis.

- **mainAxisStride**: `double`
  The number of pixels from the leading edge of one tile to the leading edge
 of the next tile in the main axis.

- **crossAxisStride**: `double`
  The number of pixels from the leading edge of one tile to the leading edge
 of the next tile in the cross axis.

- **childMainAxisExtent**: `double`
  The number of pixels from the leading edge of one tile to the trailing
 edge of the same tile in the main axis.

- **childCrossAxisExtent**: `double`
  The number of pixels from the leading edge of one tile to the trailing
 edge of the same tile in the cross axis.

- **reverseCrossAxis**: `bool`
  Whether the children should be placed in the opposite order of increasing
 coordinates in the cross axis.

 For example, if the cross axis is horizontal, the children are placed from
 left to right when [reverseCrossAxis] is false and from right to left when
 [reverseCrossAxis] is true.

 Typically set to the return value of [axisDirectionIsReversed] applied to
 the [SliverConstraints.crossAxisDirection].

## Constructors

### Unnamed Constructor
Creates a layout that uses equally sized and spaced tiles.

 All of the arguments must not be negative. The `crossAxisCount` argument
 must be greater than zero.

