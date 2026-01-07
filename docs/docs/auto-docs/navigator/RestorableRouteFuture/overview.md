# Overview for `RestorableRouteFuture`

## Description

Gives access to a [Route] object and its return value that was added to a
 navigator via one of its "restorable" API methods.

 When a [State] object wants access to the return value of a [Route] object
 it has pushed onto the [Navigator], a [RestorableRouteFuture] ensures that
 it will also have access to that value after state restoration.

 To show a new route on the navigator defined by the [navigatorFinder], call
 [present], which will invoke the [onPresent] callback. The [onPresent]
 callback must add a new route to the navigator provided to it using one
 of the "restorable" API methods. When the newly added route completes, the
 [onComplete] callback executes. It is given the return value of the route,
 which may be null.

 While the route added via [present] is shown on the navigator, it can be
 accessed via the [route] getter.

 If the property is restored to a state in which [present] had been called on
 it, but the route has not completed yet, the [RestorableRouteFuture] will
 obtain the restored route object from the navigator again and call
 [onComplete] once it completes.

 The [RestorableRouteFuture] can only keep track of one active [route].
 When [present] has been called to add a route, it may only be called again
 after the previously added route has completed.

 
 This example uses a [RestorableRouteFuture] in the `_MyHomeState` to push a
 new `MyCounter` route and to retrieve its return value.

 ** See code in examples/api/lib/widgets/navigator/restorable_route_future.0.dart **
 

## Dependencies

- RestorableProperty

## Members

- **navigatorFinder**: `NavigatorFinderCallback`
  A callback that given the [BuildContext] of the [State] object to which
 this property is registered returns the [NavigatorState] of the navigator
 to which the route instantiated in [onPresent] is added.

- **onPresent**: `RoutePresentationCallback`
  A callback that add a new [Route] to the provided navigator.

 The callback must use one of the API methods on the [NavigatorState] that
 have "restorable" in their name (e.g. [NavigatorState.restorablePush],
 [NavigatorState.restorablePushNamed], etc.) and return the opaque ID
 returned by those methods.

 This callback is invoked when [present] is called with the `arguments`
 Object that was passed to that method and the [NavigatorState] obtained
 from [navigatorFinder].

- **onComplete**: `RouteCompletionCallback&lt;T&gt;?`
  A callback that is invoked when the [Route] added via [onPresent]
 completes.

 The return value of that route is passed to this method.

- **_route**: `Route&lt;T&gt;?`
- **_disposed**: `bool`
## Constructors

### Unnamed Constructor
Creates a [RestorableRouteFuture].

