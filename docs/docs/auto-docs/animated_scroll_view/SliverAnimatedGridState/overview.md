# Overview for `SliverAnimatedGridState`

## Description

The state for a [SliverAnimatedGrid] that animates items when they are
 inserted or removed.

 When an item is inserted with [insertItem] an animation begins running. The
 animation is passed to [SliverAnimatedGrid.itemBuilder] whenever the item's
 widget is needed.

 When an item is removed with [removeItem] its animation is reversed.
 The removed item's animation is passed to the [removeItem] builder
 parameter.

 An app that needs to insert or remove items in response to an event
 can refer to the [SliverAnimatedGrid]'s state with a global key:

 ```dart
 // (e.g. in a stateful widget)
 GlobalKey&lt;AnimatedGridState&gt; gridKey = GlobalKey&lt;AnimatedGridState&gt;;

 // ...

 @override
 Widget build(BuildContext context) 

 // ...

 void  
 ```

 [SliverAnimatedGrid] item input handlers can also refer to their
 [SliverAnimatedGridState] with the static [SliverAnimatedGrid.of] method.

## Dependencies

- _SliverAnimatedMultiBoxAdaptorState

