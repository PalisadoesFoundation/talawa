# Method: `reverse`

## Description

Starts running this animation in reverse (towards the beginning).

 Returns a [TickerFuture] that completes when the animation is dismissed.

 If [from] is non-null, it will be set as the current [value] before running
 the animation.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

 During the animation, [status] is reported as [AnimationStatus.reverse],
 which switches to [AnimationStatus.dismissed] when [lowerBound] is
 reached at the end of the animation.

## Return Type
`TickerFuture`

## Parameters

- ``: `dynamic`
