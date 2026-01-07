# Method: `resolve`

## Description

A method that will be called by the [Navigator] to decide how routes
 transition in or out of the screen when [Navigator.pages] is updated.

 The `newPageRouteHistory` list contains all page-based routes in the order
 that will be on the [Navigator]'s history stack after this update
 completes. If a route in `newPageRouteHistory` has its
 [RouteTransitionRecord.isWaitingForEnteringDecision] set to true, this
 route requires explicit decision on how it should transition onto the
 Navigator. To make a decision, call [RouteTransitionRecord.markForPush] or
 [RouteTransitionRecord.markForAdd].

 The `locationToExitingPageRoute` contains the pages-based routes that
 are removed from the routes history after page update. This map records
 page-based routes to be removed with the location of the route in the
 original route history before the update. The keys are the locations
 represented by the page-based routes that are directly below the removed
 routes, and the value are the page-based routes to be removed. The
 location is null if the route to be removed is the bottom most route. If
 a route in `locationToExitingPageRoute` has its
 [RouteTransitionRecord.isWaitingForExitingDecision] set to true, this
 route requires explicit decision on how it should transition off the
 Navigator. To make a decision for a removed route, call
 [RouteTransitionRecord.markForPop],
 [RouteTransitionRecord.markForComplete]. It is possible that decisions are
 not required for routes in the `locationToExitingPageRoute`. This can
 happen if the routes have already been popped in earlier page updates and
 are still waiting for popping animations to finish. In such case, those
 routes are still included in the `locationToExitingPageRoute` with their
 [RouteTransitionRecord.isWaitingForExitingDecision] set to false and no
 decisions are required.

 The `pageRouteToPagelessRoutes` records the page-based routes and their
 associated pageless routes. If a page-based route is waiting for exiting
 decision, its associated pageless routes also require explicit decisions
 on how to transition off the screen.

 Once all the decisions have been made, this method must merge the removed
 routes (whether or not they require decisions) and the
 `newPageRouteHistory` and return the merged result. The order in the
 result will be the order the [Navigator] uses for updating the route
 history. The return list must preserve the same order of routes in
 `newPageRouteHistory`. The removed routes, however, can be inserted into
 the return list freely as long as all of them are included.

 For example, consider the following case.

 `newPageRouteHistory = [A, B, C]`

 `locationToExitingPageRoute = `

 The following outputs are valid.

 `result = [A, B ,C ,D ,E]` is valid.
 `result = [D, A, B ,C ,E]` is also valid because exiting route can be
 inserted in any place.

 The following outputs are invalid.

 `result = [B, A, C ,D ,E]` is invalid because B must be after A.
 `result = [A, B, C ,E]` is invalid because results must include D.

 See also:

  * [RouteTransitionRecord.markForPush], which makes route enter the screen
    with an animated transition.
  * [RouteTransitionRecord.markForAdd], which makes route enter the screen
    without an animated transition.
  * [RouteTransitionRecord.markForPop], which makes route exit the screen
    with an animated transition.
  * [RouteTransitionRecord.markForComplete], which completes the route and
    makes it exit the screen without an animated transition.
  * [DefaultTransitionDelegate.resolve], which implements the default way
    to decide how routes transition in or out of the screen.

## Return Type
`Iterable&lt;RouteTransitionRecord&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
