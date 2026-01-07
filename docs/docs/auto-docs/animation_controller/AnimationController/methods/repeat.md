# Method: `repeat`

## Description

Starts running this animation in the forward direction, and
 restarts the animation when it completes.

 Defaults to repeating between the [lowerBound] and [upperBound] of the
 [AnimationController] when no explicit value is set for [min] and [max].

 With [reverse] set to true, instead of always starting over at [min]
 the starting value will alternate between [min] and [max] values on each
 repeat. The [status] will be reported as [AnimationStatus.reverse] when
 the animation runs from [max] to [min].

 Each run of the animation will have a duration of `period`. If `period` is not
 provided, [duration] will be used instead, which has to be set before [repeat] is
 called either in the constructor or later by using the [duration] setter.

 If a value is passed to [count], the animation will perform that many
 iterations before stopping. Otherwise, the animation repeats indefinitely.

 Returns a [TickerFuture] that never completes, unless a [count] is specified.
 The [TickerFuture.orCancel] future completes with an error when the animation is
 stopped (e.g. with [stop]).

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

## Return Type
`TickerFuture`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
