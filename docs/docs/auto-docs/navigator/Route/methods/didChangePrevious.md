# Method: `didChangePrevious`

## Description

This route's previous route has changed to the given new route.

 This is called on a route whenever the previous route changes for any
 reason, so long as it is in the history, except for immediately after the
 route itself has been pushed (in which case [didPush] or [didReplace] will
 be called instead).

 The `previousRoute` argument will be null if there's no previous route
 (i.e. if [isFirst] is true).

## Return Type
`void`

## Parameters

- `previousRoute`: `Route&lt;dynamic&gt;?`
