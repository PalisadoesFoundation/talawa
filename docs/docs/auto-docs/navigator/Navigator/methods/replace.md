# Method: `replace`

## Description

Replaces a route on the navigator that most tightly encloses the given
 context with a new route.

 
 The old route must not be currently visible, as this method skips the
 animations and therefore the removal would be jarring if it was visible.
 To replace the top-most route, consider [pushReplacement] instead, which
 _does_ animate the new route, and delays removing the old route until the
 new route has finished animating.

 The removed route is removed and completed with a `null` value.

 The new route, the route below the new route (if any), and the route above
 the new route, are all notified (see [Route.didReplace],
 [Route.didChangeNext], and [Route.didChangePrevious]). If the [Navigator]
 has any [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didReplace]). The removed route is disposed with its
 future completed.

 This can be useful in combination with [removeRouteBelow] when building a
 non-linear user experience.

 The `T` type argument is the type of the return value of the new route.
 

 See also:

  * [replaceRouteBelow], which is the same but identifies the route to be
    removed by reference to the route above it, rather than directly.
  * [restorableReplace], which adds a replacement route that can be
    restored during state restoration.

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
- ``: `dynamic`
