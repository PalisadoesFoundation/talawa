# Method: `markForAdd`

## Description

Marks the [route] to be added without transition.

 During [TransitionDelegate.resolve], this can be called on an entering
 route (where [RouteTransitionRecord.isWaitingForEnteringDecision] is true) in indicate that the
 route should be added onto the [Navigator] without an animated transition.

## Return Type
`void`

