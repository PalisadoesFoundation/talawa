# Overview for `SliverGridDelegate`

## Description

Controls the layout of tiles in a grid.

 Given the current constraints on the grid, a [SliverGridDelegate] computes
 the layout for the tiles in the grid. The tiles can be placed arbitrarily,
 but it is more efficient to place tiles roughly in order by scroll offset
 because grids reify a contiguous sequence of children.

 
 This example shows how a [SliverGridDelegate] returns a [SliverGridLayout]
 configured based on the provided [SliverConstraints] in [getLayout].

 ** See code in examples/api/lib/widgets/scroll_view/grid_view.0.dart **
 

 See also:

  * [SliverGridDelegateWithFixedCrossAxisCount], which creates a layout with
    a fixed number of tiles in the cross axis.
  * [SliverGridDelegateWithMaxCrossAxisExtent], which creates a layout with
    tiles that have a maximum cross-axis extent.
  * [GridView], which uses this delegate to control the layout of its tiles.
  * [SliverGrid], which uses this delegate to control the layout of its
    tiles.
  * [RenderSliverGrid], which uses this delegate to control the layout of its
    tiles.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

