# Method: `addRoute`

## Description

Adds a route to the routing table.

 Whenever this object routes a [PointerEvent] corresponding to
 pointer, call route.

 Routes added reentrantly within [PointerRouter.route] will take effect when
 routing the next event.

## Return Type
`void`

## Parameters

- `pointer`: `int`
- `route`: `PointerRoute`
- ``: `dynamic`
