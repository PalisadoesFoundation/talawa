# Method: `setNewRoutePath`

## Description

Called by the [Router] when the [Router.routeInformationProvider] reports that a
 new route has been pushed to the application by the operating system.

 Consider using a [SynchronousFuture] if the result can be computed
 synchronously, so that the [Router] does not need to wait for the next
 microtask to schedule a build.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `configuration`: `T`
