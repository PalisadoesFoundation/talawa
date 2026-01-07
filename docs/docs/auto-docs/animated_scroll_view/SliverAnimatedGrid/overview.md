# Overview for `SliverAnimatedGrid`

## Description

A [SliverGrid] that animates items when they are inserted or removed.

 This widget's [SliverAnimatedGridState] can be used to dynamically insert or
 remove items. To refer to the [SliverAnimatedGridState] either provide a
 [GlobalKey] or use the static [SliverAnimatedGrid.of] method from an item's
 input callback.

 
 This sample application uses a [SliverAnimatedGrid] to create an animated
 effect when items are removed or added to the grid.

 ** See code in examples/api/lib/widgets/animated_grid/sliver_animated_grid.0.dart **
 

 See also:

  * [AnimatedGrid], a non-sliver scrolling container that animates items when
    they are inserted into or removed from a grid.
  * [SliverGrid], which does not animate items when they are inserted or
    removed from a grid.
  * [SliverList], which displays a non-animated list of items.
  * [SliverAnimatedList], which animates items added and removed from a list
    instead of a grid.

## Dependencies

- _SliverAnimatedMultiBoxAdaptor

## Members

- **gridDelegate**: `SliverGridDelegate`
  

## Constructors

### Unnamed Constructor
Creates a [SliverGrid] that animates items when they are inserted or
 removed.

