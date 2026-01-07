# Method: `value`

## Description

Stops the animation controller and sets the current value of the
 animation.

 The new value is clamped to the range set by [lowerBound] and
 [upperBound].

 Value listeners are notified even if this does not change the value.
 Status listeners are notified if the animation was previously playing.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

 See also:

  * [reset], which is equivalent to setting [value] to [lowerBound].
  * [stop], which aborts the animation without changing its value or status
    and without dispatching any notifications other than completing or
    canceling the [TickerFuture].
  * [forward], [reverse], [animateTo], [animateWith], [animateBackWith],
    [fling], and [repeat], which start the animation controller.

## Parameters

- `newValue`: `double`
