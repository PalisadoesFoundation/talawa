# Method: `isActive`

## Description

Whether this route is on the navigator.

 If the route is not only active, but also the current route (the top-most
 route), then [isCurrent] will also be true. If it is the first route (the
 bottom-most route), then [isFirst] will also be true.

 If a higher route is entirely opaque, then the route will be active but not
 rendered. It is even possible for the route to be active but for the stateful
 widgets within the route to not be instantiated. See [ModalRoute.maintainState].

## Return Type
`bool`

