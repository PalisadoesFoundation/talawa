# Method: `removeRoute`

## Description

Removes a route from the routing table.

 No longer call route when routing a [PointerEvent] corresponding to
 pointer. Requires that this route was previously added to the router.

 Routes removed reentrantly within [PointerRouter.route] will take effect
 immediately.

## Return Type
`void`

## Parameters

- `pointer`: `int`
- `route`: `PointerRoute`
