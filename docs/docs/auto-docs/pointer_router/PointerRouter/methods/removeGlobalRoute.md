# Method: `removeGlobalRoute`

## Description

Removes a route from the global entry in the routing table.

 No longer call route when routing a [PointerEvent]. Requires that this
 route was previously added via [addGlobalRoute].

 Routes removed reentrantly within [PointerRouter.route] will take effect
 immediately.

## Return Type
`void`

## Parameters

- `route`: `PointerRoute`
