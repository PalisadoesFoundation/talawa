# Method: `defaultTransitionBuilder`

## Description

The transition builder used as the default value of [transitionBuilder].

 The new child is given a [FadeTransition] which increases opacity as
 the animation goes from 0.0 to 1.0, and decreases when the animation is
 reversed.

 This is an [AnimatedSwitcherTransitionBuilder] function.

## Return Type
`Widget`

## Parameters

- `child`: `Widget`
- `animation`: `Animation&lt;double&gt;`
