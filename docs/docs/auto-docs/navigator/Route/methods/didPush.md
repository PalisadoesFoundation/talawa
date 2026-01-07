# Method: `didPush`

## Description

Called after [install] when the route is pushed onto the navigator.

 The returned value resolves when the push transition is complete.

 The [didAdd] method will be called instead of [didPush] when the route
 immediately appears on screen without any push transition.

 The [didChangeNext] and [didChangePrevious] methods are typically called
 immediately after this method is called.

## Return Type
`TickerFuture`

