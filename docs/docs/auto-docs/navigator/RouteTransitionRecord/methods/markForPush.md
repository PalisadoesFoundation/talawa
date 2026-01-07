# Method: `markForPush`

## Description

Marks the [route] to be pushed with transition.

 During [TransitionDelegate.resolve], this can be called on an entering
 route (where [RouteTransitionRecord.isWaitingForEnteringDecision] is true) in indicate that the
 route should be pushed onto the [Navigator] with an animated transition.

## Return Type
`void`

