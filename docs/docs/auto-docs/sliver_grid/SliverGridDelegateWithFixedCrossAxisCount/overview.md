# Overview for `SliverGridDelegateWithFixedCrossAxisCount`

## Description

Creates grid layouts with a fixed number of tiles in the cross axis.

 For example, if the grid is vertical, this delegate will create a layout
 with a fixed number of columns. If the grid is horizontal, this delegate
 will create a layout with a fixed number of rows.

 This delegate creates grids with equally sized and spaced tiles.

 
 Here is an example using the [childAspectRatio] property. On a device with a
 screen width of 800.0, it creates a GridView with each tile with a width of
 200.0 and a height of 100.0.

 ** See code in examples/api/lib/rendering/sliver_grid/sliver_grid_delegate_with_fixed_cross_axis_count.0.dart **
 

 
 Here is an example using the [mainAxisExtent] property. On a device with a
 screen width of 800.0, it creates a GridView with each tile with a width of
 200.0 and a height of 150.0.

 ** See code in examples/api/lib/rendering/sliver_grid/sliver_grid_delegate_with_fixed_cross_axis_count.1.dart **
 

 See also:

  * [SliverGridDelegateWithMaxCrossAxisExtent], which creates a layout with
    tiles that have a maximum cross-axis extent.
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

- **crossAxisCount**: `int`
  The number of children in the cross axis.

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
Creates a delegate that makes grid layouts with a fixed number of tiles in
 the cross axis.

 The `mainAxisSpacing`, `mainAxisExtent` and `crossAxisSpacing` arguments
 must not be negative. The `crossAxisCount` and `childAspectRatio`
 arguments must be greater than zero.

