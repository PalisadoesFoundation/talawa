# Overview for `AnimatedList`

## Description

A scrolling container that animates items when they are inserted or removed.

 This widget's [AnimatedListState] can be used to dynamically insert or
 remove items. To refer to the [AnimatedListState] either provide a
 [GlobalKey] or use the static [of] method from an item's input callback.

 This widget is similar to one created by [ListView.builder].

 

 
 This sample application uses an [AnimatedList] to create an effect when
 items are removed or added to the list.

 ** See code in examples/api/lib/widgets/animated_list/animated_list.0.dart **
 

 By default, [AnimatedList] will automatically pad the limits of the
 list's scrollable to avoid partial obstructions indicated by
 [MediaQuery]'s padding. To avoid this behavior, override with a
 zero [padding] property.

 
 The following example demonstrates how to override the default top and
 bottom padding using [MediaQuery.removePadding].

 ```dart
 Widget myWidget(BuildContext context) 
 ```
 

 See also:

  * [SliverAnimatedList], a sliver that animates items when they are inserted
    or removed from a list.
  * [SliverAnimatedGrid], a sliver which animates items when they are
    inserted or removed from a grid.
  * [AnimatedGrid], a non-sliver scrolling container that animates items when
    they are inserted or removed in a grid.

## Dependencies

- _AnimatedScrollView

## Constructors

### Unnamed Constructor
Creates a scrolling container that animates items when they are inserted
 or removed.

### separated
A scrolling container that animates items with separators when they are inserted or removed.

 This widget's [AnimatedListState] can be used to dynamically insert or
 remove items. To refer to the [AnimatedListState] either provide a
 [GlobalKey] or use the static [of] method from an item's input callback.

 This widget is similar to one created by [ListView.separated].

 
 This sample application uses an [AnimatedList.separated] to create an effect when
 items are removed or added to the list.

 ** See code in examples/api/lib/widgets/animated_list/animated_list_separated.0.dart **
 

 By default, [AnimatedList.separated] will automatically pad the limits of the
 list's scrollable to avoid partial obstructions indicated by
 [MediaQuery]'s padding. To avoid this behavior, override with a
 zero [padding] property.

 
 The following example demonstrates how to override the default top and
 bottom padding using [MediaQuery.removePadding].

 ```dart
 Widget myWidget(BuildContext context) 
 ```
 

 See also:

  * [SliverAnimatedList], a sliver that animates items when they are inserted
    or removed from a list.
  * [SliverAnimatedGrid], a sliver which animates items when they are
    inserted or removed from a grid.
  * [AnimatedGrid], a non-sliver scrolling container that animates items when
    they are inserted or removed in a grid.
  * [AnimatedList], which animates items added and removed from a list instead
    of a grid.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
