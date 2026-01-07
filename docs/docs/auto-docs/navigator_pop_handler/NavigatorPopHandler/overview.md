# Overview for `NavigatorPopHandler`

## Description

Enables the handling of system back gestures.

 Typically wraps a nested [Navigator] widget and allows it to handle system
 back gestures in the [onPop] callback.

 The type parameter `<T>` indicates the type of the [Route]'s return value,
 which is passed to [onPopWithResult.

 
 This sample demonstrates how to use this widget to properly handle system
 back gestures when using nested [Navigator]s.

 ** See code in examples/api/lib/widgets/navigator_pop_handler/navigator_pop_handler.0.dart **
 

 
 This sample demonstrates how to use this widget to properly handle system
 back gestures with a bottom navigation bar whose tabs each have their own
 nested [Navigator]s.

 ** See code in examples/api/lib/widgets/navigator_pop_handler/navigator_pop_handler.1.dart **
 

 See also:

  * [PopScope], which allows toggling the ability of a [Navigator] to
    handle pops.
  * [NavigationNotification], which indicates whether a [Navigator] in a
    subtree can handle pops.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget to place below this in the widget tree.

 Typically this is a [Navigator] that will handle the pop when [onPop] is
 called.

- **enabled**: `bool`
  Whether this widget's ability to handle system back gestures is enabled or
 disabled.

 When false, there will be no effect on system back gestures. If provided,
 [onPop] will still be called.

 This can be used, for example, when the nested [Navigator] is no longer
 active but remains in the widget tree, such as in an inactive tab.

 Defaults to true.

- **onPop**: `VoidCallback?`
  Called when a handleable pop event happens.

 For example, a pop is handleable when a [Navigator] in [child] has
 multiple routes on its stack. It's not handleable when it has only a
 single route, and so [onPop] will not be called.

 Typically this is used to pop the [Navigator] in [child]. See the sample
 code on [NavigatorPopHandler] for a full example of this.

- **onPopWithResult**: `PopResultCallback&lt;T&gt;?`
  Called when a handleable pop event happens.

 For example, a pop is handleable when a [Navigator] in [child] has
 multiple routes on its stack. It's not handleable when it has only a
 single route, and so [onPop] will not be called.

 Typically this is used to pop the [Navigator] in [child]. See the sample
 code on [NavigatorPopHandler] for a full example of this.

 The passed `result` is the result of the popped [Route].

## Constructors

### Unnamed Constructor
Creates an instance of [NavigatorPopHandler].

