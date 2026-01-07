# Method: `didPop`

## Description

A request was made to pop this route. If the route can handle it
 internally (e.g. because it has its own stack of internal state) then
 return false, otherwise return true (by returning the value of calling
 `super.didPop`). Returning false will prevent the default behavior of
 [NavigatorState.pop].

 When this function returns true, the navigator removes this route from
 the history but does not yet call [dispose]. Instead, it is the route's
 responsibility to call [NavigatorState.finalizeRoute], which will in turn
 call [dispose] on the route. This sequence lets the route perform an
 exit animation (or some other visual effect) after being popped but prior
 to being disposed.

 This method should call [didComplete] to resolve the [popped] future (and
 this is all that the default implementation does); routes should not wait
 for their exit animation to complete before doing so.

 See [popped], [didComplete], and [currentResult] for a discussion of the
 `result` argument.

## Return Type
`bool`

## Parameters

- `result`: `T?`
