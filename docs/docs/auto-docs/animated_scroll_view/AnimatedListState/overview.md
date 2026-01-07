# Overview for `AnimatedListState`

## Description

The [AnimatedListState] for [AnimatedList], a scrolling list container that
 animates items when they are inserted or removed.

 When an item is inserted with [insertItem] an animation begins running. The
 animation is passed to [AnimatedList.itemBuilder] whenever the item's widget
 is needed.

 When multiple items are inserted with [insertAllItems] an animation begins running.
 The animation is passed to [AnimatedList.itemBuilder] whenever the item's widget
 is needed.

 If using [AnimatedList.separated], the animation is also passed to
 `AnimatedList.separatorBuilder` whenever the separator's widget is needed.

 When an item is removed with [removeItem] its animation is reversed.
 The removed item's animation is passed to the [removeItem] builder
 parameter. If using [AnimatedList.separated], the corresponding separator's
 animation is also passed to the [AnimatedList.removedSeparatorBuilder] parameter.

 An app that needs to insert or remove items in response to an event
 can refer to the [AnimatedList]'s state with a global key:

 ```dart
 // (e.g. in a stateful widget)
 GlobalKey&lt;AnimatedListState&gt; listKey = GlobalKey&lt;AnimatedListState&gt;;

 // ...

 @override
 Widget build(BuildContext context) 

 // ...

 void  
 ```

 [AnimatedList] item input handlers can also refer to their [AnimatedListState]
 with the static [AnimatedList.of] method.

## Dependencies

- _AnimatedScrollViewState

