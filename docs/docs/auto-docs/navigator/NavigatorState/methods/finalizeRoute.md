# Method: `finalizeRoute`

## Description

Complete the lifecycle for a route that has been popped off the navigator.

 When the navigator pops a route, the navigator retains a reference to the
 route in order to call [Route.dispose] if the navigator itself is removed
 from the tree. When the route is finished with any exit animation, the
 route should call this function to complete its lifecycle (e.g., to
 receive a call to [Route.dispose]).

 The given `route` must have already received a call to [Route.didPop].
 This function may be called directly from [Route.didPop] if [Route.didPop]
 will return true.

## Return Type
`void`

## Parameters

- `route`: `Route&lt;dynamic&gt;`
