# Method: `forward`

## Description

Starts running this animation forwards (towards the end).

 Returns a [TickerFuture] that completes when the animation is complete.

 If [from] is non-null, it will be set as the current [value] before running
 the animation.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

 During the animation, [status] is reported as [AnimationStatus.forward],
 which switches to [AnimationStatus.completed] when [upperBound] is
 reached at the end of the animation.

## Return Type
`TickerFuture`

## Parameters

- ``: `dynamic`
