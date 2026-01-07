# Method: `addGlobalRoute`

## Description

Adds a route to the global entry in the routing table.

 Whenever this object routes a [PointerEvent], call route.

 Routes added reentrantly within [PointerRouter.route] will take effect when
 routing the next event.

## Return Type
`void`

## Parameters

- `route`: `PointerRoute`
- ``: `dynamic`
