# Overview for `AnimatedGrid`

## Description

A scrolling container that animates items when they are inserted into or removed from a grid.
 in a grid.

 This widget's [AnimatedGridState] can be used to dynamically insert or
 remove items. To refer to the [AnimatedGridState] either provide a
 [GlobalKey] or use the static [of] method from an item's input callback.

 This widget is similar to one created by [GridView.builder].

 
 This sample application uses an [AnimatedGrid] to create an effect when
 items are removed or added to the grid.

 ** See code in examples/api/lib/widgets/animated_grid/animated_grid.0.dart **
 

 By default, [AnimatedGrid] will automatically pad the limits of the
 grid's scrollable to avoid partial obstructions indicated by
 [MediaQuery]'s padding. To avoid this behavior, override with a
 zero [padding] property.

 
 The following example demonstrates how to override the default top and
 bottom padding using [MediaQuery.removePadding].

 ```dart
 Widget myWidget(BuildContext context) 
 ```
 

 See also:

 * [SliverAnimatedGrid], a sliver which animates items when they are inserted
   into or removed from a grid.
 * [SliverAnimatedList], a sliver which animates items added and removed from
   a list instead of a grid.
 * [AnimatedList], which animates items added and removed from a list instead
   of a grid.

## Dependencies

- _AnimatedScrollView

## Members

- **gridDelegate**: `SliverGridDelegate`
  
 A delegate that controls the layout of the children within the
 [AnimatedGrid].

 See also:

  * [SliverGridDelegateWithFixedCrossAxisCount], which creates a layout with
    a fixed number of tiles in the cross axis.
  * [SliverGridDelegateWithMaxCrossAxisExtent], which creates a layout with
    tiles that have a maximum cross-axis extent.
 

## Constructors

### Unnamed Constructor
Creates a scrolling container that animates items when they are inserted
 or removed.

