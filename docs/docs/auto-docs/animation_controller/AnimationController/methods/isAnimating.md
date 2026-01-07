# Method: `isAnimating`

## Description

Whether this animation is currently animating in either the forward or reverse direction.

 This is separate from whether it is actively ticking. An animation
 controller's ticker might get muted, in which case the animation
 controller's callbacks will no longer fire even though time is continuing
 to pass. See [Ticker.muted] and [TickerMode].

 If the animation was stopped (e.g. with [stop] or by setting a new [value]),
 [isAnimating] will return `false` but the [status] will not change,
 so the value of [AnimationStatus.isAnimating] might still be `true`.

## Return Type
`bool`

