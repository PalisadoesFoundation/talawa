# Overview for `SliverAnimatedList`

## Description

A [SliverList] that animates items when they are inserted or removed.

 This widget's [SliverAnimatedListState] can be used to dynamically insert or
 remove items. To refer to the [SliverAnimatedListState] either provide a
 [GlobalKey] or use the static [SliverAnimatedList.of] method from a list item's
 input callback.

 
 This sample application uses a [SliverAnimatedList] to create an animated
 effect when items are removed or added to the list.

 ** See code in examples/api/lib/widgets/animated_list/sliver_animated_list.0.dart **
 

 See also:

  * [SliverList], which does not animate items when they are inserted or
    removed.
  * [AnimatedList], a non-sliver scrolling container that animates items when
    they are inserted or removed.
  * [SliverAnimatedGrid], a sliver which animates items when they are
    inserted into or removed from a grid.
  * [AnimatedGrid], a non-sliver scrolling container that animates items when
    they are inserted into or removed from a grid.

## Dependencies

- _SliverAnimatedMultiBoxAdaptor

## Constructors

### Unnamed Constructor
Creates a [SliverList] that animates items when they are inserted or
 removed.

