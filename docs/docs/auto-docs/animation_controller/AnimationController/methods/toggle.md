# Method: `toggle`

## Description

Toggles the direction of this animation, based on whether it [isForwardOrCompleted].

 Specifically, this function acts the same way as [reverse] if the [status] is
 either [AnimationStatus.forward] or [AnimationStatus.completed], and acts as
 [forward] for [AnimationStatus.reverse] or [AnimationStatus.dismissed].

 If [from] is non-null, it will be set as the current [value] before running
 the animation.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

## Return Type
`TickerFuture`

## Parameters

- ``: `dynamic`
