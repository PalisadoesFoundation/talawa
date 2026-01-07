# Method: `didRemove`

## Description

The [Navigator] removed `route`.

 If only one route is being removed, then the route immediately below
 that one, if any, is `previousRoute`.

 If multiple routes are being removed, then the route below the
 bottommost route being removed, if any, is `previousRoute`, and this
 method will be called once for each removed route, from the topmost route
 to the bottommost route.

## Return Type
`void`

## Parameters

- `route`: `Route&lt;dynamic&gt;`
- `previousRoute`: `Route&lt;dynamic&gt;?`
