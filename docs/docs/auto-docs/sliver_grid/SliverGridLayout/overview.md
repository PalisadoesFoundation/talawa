# Overview for `SliverGridLayout`

## Description

The size and position of all the tiles in a [RenderSliverGrid].

 Rather that providing a grid with a [SliverGridLayout] directly, the grid is
 provided a [SliverGridDelegate], which computes a [SliverGridLayout] given a
 set of [SliverConstraints]. This allows the algorithm to dynamically respond
 to changes in the environment (e.g. the user rotating the device).

 The tiles can be placed arbitrarily, but it is more efficient to place tiles
 roughly in order by scroll offset because grids reify a contiguous sequence
 of children.

 
 This example shows how to construct a custom [SliverGridLayout] to lay tiles
 in a grid form with some cells stretched to fit the entire width of the
 grid (sometimes called "hero tiles").

 ** See code in examples/api/lib/widgets/scroll_view/grid_view.0.dart **
 

 See also:

  * [SliverGridRegularTileLayout], which represents a layout that uses
    equally sized and spaced tiles.
  * [SliverGridGeometry], which represents the size and position of a single
    tile in a grid.
  * [SliverGridDelegate.getLayout], which returns this object to describe the
    delegate's layout.
  * [RenderSliverGrid], which uses this class during its
    [RenderSliverGrid.performLayout] method.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

