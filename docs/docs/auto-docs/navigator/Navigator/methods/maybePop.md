# Method: `maybePop`

## Description

Consults the current route's [Route.popDisposition] getter or
 [Route.willPop] method, and acts accordingly, potentially popping the
 route as a result; returns whether the pop request should be considered
 handled.

 
 If the [RoutePopDisposition] is [RoutePopDisposition.pop], then the [pop]
 method is called, and this method returns true, indicating that it handled
 the pop request.

 If the [RoutePopDisposition] is [RoutePopDisposition.doNotPop], then this
 method returns true, but does not do anything beyond that.

 If the [RoutePopDisposition] is [RoutePopDisposition.bubble], then this
 method returns false, and the caller is responsible for sending the
 request to the containing scope (e.g. by closing the application).

 This method is typically called for a user-initiated [pop]. For example on
 Android it's called by the binding for the system's back button.

 The `T` type argument is the type of the return value of the current
 route. (Typically this isn't known; consider specifying `dynamic` or
 `Null`.)
 

 See also:

  * [Form], which provides an `onWillPop` callback that enables the form
    to veto a [pop] initiated by the app's back button.
  * [ModalRoute], which provides a `scopedWillPopCallback` that can be used
    to define the route's `willPop` method.

## Return Type
`Future&lt;bool&gt;`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
