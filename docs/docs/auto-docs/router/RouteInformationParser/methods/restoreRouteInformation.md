# Method: `restoreRouteInformation`

## Description

Restore the route information from the given configuration.

 This may return null, in which case the browser history will not be
 updated and state restoration is disabled. See [Router]'s documentation
 for details.

 The [parseRouteInformation] method must produce an equivalent
 configuration when passed this method's return value.

## Return Type
`RouteInformation?`

## Parameters

- `configuration`: `T`
