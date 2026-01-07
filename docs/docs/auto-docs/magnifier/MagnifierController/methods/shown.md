# Method: `shown`

## Description

Whether the magnifier is currently being shown.

 This is false when nothing is in the overlay, when the
 [animationController] is in the [AnimationStatus.dismissed] state, or when
 the [animationController] is animating out (i.e. in the
 [AnimationStatus.reverse] state).

 It is true in the opposite cases, i.e. when the overlay is not empty, and
 either the [animationController] is null, in the
 [AnimationStatus.completed] state, or in the [AnimationStatus.forward]
 state.

## Return Type
`bool`

