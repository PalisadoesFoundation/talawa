# Method: `popRoute`

## Description

Called by the [Router] when the [Router.backButtonDispatcher] reports that
 the operating system is requesting that the current route be popped.

 The method should return a boolean [Future] to indicate whether this
 delegate handles the request. Returning false will cause the entire app
 to be popped.

 Consider using a [SynchronousFuture] if the result can be computed
 synchronously, so that the [Router] does not need to wait for the next
 microtask to schedule a build.

## Return Type
`Future&lt;bool&gt;`

