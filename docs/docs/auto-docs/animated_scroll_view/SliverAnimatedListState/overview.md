# Overview for `SliverAnimatedListState`

## Description

The state for a [SliverAnimatedList] that animates items when they are
 inserted or removed.

 When an item is inserted with [insertItem] an animation begins running. The
 animation is passed to [SliverAnimatedList.itemBuilder] whenever the item's
 widget is needed.

 When an item is removed with [removeItem] its animation is reversed.
 The removed item's animation is passed to the [removeItem] builder
 parameter.

 An app that needs to insert or remove items in response to an event
 can refer to the [SliverAnimatedList]'s state with a global key:

 ```dart
 // (e.g. in a stateful widget)
 GlobalKey&lt;AnimatedListState&gt; listKey = GlobalKey&lt;AnimatedListState&gt;;

 // ...

 @override
 Widget build(BuildContext context) 

 // ...

 void  
 ```

 [SliverAnimatedList] item input handlers can also refer to their
 [SliverAnimatedListState] with the static [SliverAnimatedList.of] method.

## Dependencies

- _SliverAnimatedMultiBoxAdaptorState

