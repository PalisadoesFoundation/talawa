# Method: `setRestoredRoutePath`

## Description

Called by the [Router] during state restoration.

 When the [Router] is configured for state restoration, it will persist
 the value of [currentConfiguration] during state serialization. During
 state restoration, the [Router] calls this method (instead of
 [setInitialRoutePath]) to pass the previous configuration back to the
 delegate. It is the responsibility of the delegate to restore its internal
 state based on the provided configuration.

 By default, this method forwards the `configuration` to [setNewRoutePath].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `configuration`: `T`
