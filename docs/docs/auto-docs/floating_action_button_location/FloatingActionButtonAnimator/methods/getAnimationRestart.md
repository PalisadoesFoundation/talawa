# Method: `getAnimationRestart`

## Description

Gets the progress value to restart a motion animation from when the animation is interrupted.

 [previousValue] is the value of the animation before it was interrupted.

 The restart of the animation will affect all three parts of the motion animation:
 offset animation, scale animation, and rotation animation.

 An interruption triggers if the [Scaffold] is given a new [FloatingActionButtonLocation]
 while it is still animating a transition between two previous [FloatingActionButtonLocation]s.

 A sensible default is usually 0.0, which is the same as restarting
 the animation from the beginning, regardless of the original state of the animation.

## Return Type
`double`

## Parameters

- `previousValue`: `double`
