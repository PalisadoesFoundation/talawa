# Overview for `PopScope`

## Description

Manages back navigation gestures.

 The generic type should match or be a supertype of the generic type of the
 enclosing [Route]. For example, if the enclosing Route is a
 `MaterialPageRoute&lt;int&gt;`, you can define [PopScope] with `int` or any
 supertype of `int`.

 The [canPop] parameter disables back gestures when set to `false`.

 The [onPopInvokedWithResult] parameter reports when pop navigation was attempted, and
 `didPop` indicates whether or not the navigation was successful. The
 `result` contains the pop result.

 Android has a system back gesture that is a swipe inward from near the edge
 of the screen. It is recognized by Android before being passed to Flutter.
 iOS has a similar gesture that is recognized in Flutter by
 [CupertinoRouteTransitionMixin], not by iOS, and is therefore not a system
 back gesture.

 If [canPop] is false, then a system back gesture will not pop the route off
 of the enclosing [Navigator]. [onPopInvokedWithResult] will still be called, and
 `didPop` will be `false`. On iOS when using [CupertinoRouteTransitionMixin]
 with [canPop] set to false, no gesture will be detected at all, so
 [onPopInvokedWithResult] will not be called. Programmatically attempting pop
 navigation will also result in a call to [onPopInvokedWithResult], with `didPop`
 indicating success or failure.

 If [canPop] is true, then a system back gesture will cause the enclosing
 [Navigator] to receive a pop as usual. [onPopInvokedWithResult] will be called with
 `didPop` as true, unless the pop failed for reasons unrelated to
 [PopScope], in which case it will be false.

 
 This sample demonstrates showing a confirmation dialog before navigating
 away from a page.

 ** See code in examples/api/lib/widgets/pop_scope/pop_scope.0.dart **
 

 
 This sample demonstrates showing how to use PopScope to wrap widget that
 may pop the page with a result.

 ** See code in examples/api/lib/widgets/pop_scope/pop_scope.1.dart **
 

 See also:

  * [NavigatorPopHandler], which is a less verbose way to handle system back
    gestures in simple cases of nested [Navigator]s.
  * [Form.canPop] and [Form.onPopInvokedWithResult], which can be used to handle system
    back gestures in the case of a form with unsaved data.
  * [ModalRoute.registerPopEntry] and [ModalRoute.unregisterPopEntry],
    which this widget uses to integrate with Flutter's navigation system.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **onPopInvokedWithResult**: `PopInvokedWithResultCallback&lt;T&gt;?`
  
 Called after a route pop was handled.
 

 It's not possible to prevent the pop from happening at the time that this
 method is called; the pop has already happened. Use [canPop] to
 disable pops in advance.

 This will still be called even when the pop is canceled. A pop is canceled
 when the relevant [Route.popDisposition] returns false, such as when
 [canPop] is set to false on a [PopScope]. The `didPop` parameter
 indicates whether or not the back navigation actually happened
 successfully.

 The `result` contains the pop result.

 See also:

  * [Route.onPopInvokedWithResult], which is similar.

- **onPopInvoked**: `PopInvokedCallback?`
  Called after a route pop was handled.

 It's not possible to prevent the pop from happening at the time that this
 method is called; the pop has already happened. Use [canPop] to
 disable pops in advance.

 This will still be called even when the pop is canceled. A pop is canceled
 when the relevant [Route.popDisposition] returns false, such as when
 [canPop] is set to false on a [PopScope]. The `didPop` parameter
 indicates whether or not the back navigation actually happened
 successfully.

- **canPop**: `bool`
  
 When false, blocks the current route from being popped.

 This includes the root route, where upon popping, the Flutter app would
 exit.

 If multiple [PopScope] widgets appear in a route's widget subtree, then
 each and every `canPop` must be `true` in order for the route to be
 able to pop.

 [Android's predictive back](https://developer.android.com/guide/navigation/predictive-back-gesture)
 feature will not animate when this boolean is false.
 

## Constructors

### Unnamed Constructor
Creates a widget that registers a callback to veto attempts by the user to
 dismiss the enclosing [ModalRoute].

