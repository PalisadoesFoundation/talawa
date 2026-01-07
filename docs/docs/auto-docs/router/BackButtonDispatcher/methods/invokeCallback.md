# Method: `invokeCallback`

## Description

Handles a pop route request.

 This method prioritizes the children list in reverse order and calls
 [ChildBackButtonDispatcher.notifiedByParent] on them. If any of them
 handles the request (by returning a future with true), it exits this
 method by returning this future. Otherwise, it keeps moving on to the next
 child until a child handles the request. If none of the children handles
 the request, this back button dispatcher will then try to handle the request
 by itself. This back button dispatcher handles the request by notifying the
 router which in turn calls the [RouterDelegate.popRoute] and returns its
 result.

 To decide whether this back button dispatcher will handle the pop route
 request, you can override the [RouterDelegate.popRoute] of the router
 delegate you pass into the router with this back button dispatcher to
 return a future of true or false.

## Return Type
`Future&lt;bool&gt;`

## Parameters

- `defaultValue`: `Future&lt;bool&gt;`
