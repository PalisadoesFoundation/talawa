# Method: `reset`

## Description

Sets the controller's value to [lowerBound], stopping the animation (if
 in progress), and resetting to its beginning point, or dismissed state.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

 See also:

  * [value], which can be explicitly set to a specific value as desired.
  * [forward], which starts the animation in the forward direction.
  * [stop], which aborts the animation without changing its value or status
    and without dispatching any notifications other than completing or
    canceling the [TickerFuture].

## Return Type
`void`

