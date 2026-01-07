# Method: `setInitialRoutePath`

## Description

Called by the [Router] at startup with the structure that the
 [RouteInformationParser] obtained from parsing the initial route.

 This should configure the [RouterDelegate] so that when [build] is
 invoked, it will create a widget tree that matches the initial route.

 By default, this method forwards the [configuration] to [setNewRoutePath].

 Consider using a [SynchronousFuture] if the result can be computed
 synchronously, so that the [Router] does not need to wait for the next
 microtask to schedule a build.

 See also:

  * [setRestoredRoutePath], which is called instead of this method during
    state restoration.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `configuration`: `T`
