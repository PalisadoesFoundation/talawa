# Method: `animateBack`

## Description

Drives the animation from its current value to the given target, "backward".

 Returns a [TickerFuture] that completes when the animation is complete.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

 During the animation, [status] is reported as [AnimationStatus.reverse]
 regardless of whether `target` < [value] or not. At the end of the
 animation, when `target` is reached, [status] is reported as
 [AnimationStatus.dismissed].

 If the `target` argument is the same as the current [value] of the
 animation, then this won't animate, and the returned [TickerFuture] will
 be already complete.

## Return Type
`TickerFuture`

## Parameters

- `target`: `double`
- ``: `dynamic`
- ``: `dynamic`
