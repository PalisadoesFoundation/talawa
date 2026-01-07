# Overview for `SliverGridDelegateWithMaxCrossAxisExtent`

## Description

Creates grid layouts with tiles that each have a maximum cross-axis extent.

 This delegate will select a cross-axis extent for the tiles that is as
 large as possible subject to the following conditions:

  - The extent evenly divides the cross-axis extent of the grid.
  - The extent is at most [maxCrossAxisExtent].

 For example, if the grid is vertical, the grid is 500.0 pixels wide, and
 [maxCrossAxisExtent] is 150.0, this delegate will create a grid with 4
 columns that are 125.0 pixels wide.

 This delegate creates grids with equally sized and spaced tiles.

 See also:

  * [SliverGridDelegateWithFixedCrossAxisCount], which creates a layout with
    a fixed number of tiles in the cross axis.
  * [SliverGridDelegate], which creates arbitrary layouts.
  * [GridView], which can use this delegate to control the layout of its
    tiles.
  * [SliverGrid], which can use this delegate to control the layout of its
    tiles.
  * [RenderSliverGrid], which can use this delegate to control the layout of
    its tiles.

## Dependencies

- SliverGridDelegate

## Members

- **maxCrossAxisExtent**: `double`
  The maximum extent of tiles in the cross axis.

 This delegate will select a cross-axis extent for the tiles that is as
 large as possible subject to the following conditions:

  - The extent evenly divides the cross-axis extent of the grid.
  - The extent is at most [maxCrossAxisExtent].

 For example, if the grid is vertical, the grid is 500.0 pixels wide, and
 [maxCrossAxisExtent] is 150.0, this delegate will create a grid with 4
 columns that are 125.0 pixels wide.

- **mainAxisSpacing**: `double`
  The number of logical pixels between each child along the main axis.

- **crossAxisSpacing**: `double`
  The number of logical pixels between each child along the cross axis.

- **childAspectRatio**: `double`
  The ratio of the cross-axis to the main-axis extent of each child.

- **mainAxisExtent**: `double?`
  The extent of each tile in the main axis. If provided it would define the
 logical pixels taken by each tile in the main-axis.

 If null, [childAspectRatio] is used instead.

## Constructors

### Unnamed Constructor
Creates a delegate that makes grid layouts with tiles that have a maximum
 cross-axis extent.

 The [maxCrossAxisExtent], [mainAxisExtent], [mainAxisSpacing],
 and [crossAxisSpacing] arguments must not be negative.
 The [childAspectRatio] argument must be greater than zero.

