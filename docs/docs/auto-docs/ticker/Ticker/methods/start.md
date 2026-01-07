# Method: `start`

## Description

Starts the clock for this [Ticker]. If the ticker is not [muted], then this
 also starts calling the ticker's callback once per animation frame.

 The returned future resolves once the ticker [stop]s ticking. If the
 ticker is disposed, the future does not resolve. A derivative future is
 available from the returned [TickerFuture] object that resolves with an
 error in that case, via [TickerFuture.orCancel].

 Calling this sets [isActive] to true.

 This method cannot be called while the ticker is active. To restart the
 ticker, first [stop] it.

 By convention, this method is used by the object that receives the ticks
 (as opposed to the [TickerProvider] which created the ticker).

## Return Type
`TickerFuture`

