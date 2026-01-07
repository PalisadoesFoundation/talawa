# Method: `absorbTicker`

## Description

Makes this [Ticker] take the state of another ticker, and disposes the
 other ticker.

 This is useful if an object with a [Ticker] is given a new
 [TickerProvider] but needs to maintain continuity. In particular, this
 maintains the identity of the [TickerFuture] returned by the [start]
 function of the original [Ticker] if the original ticker is active.

 This ticker must not be active when this method is called.

## Return Type
`void`

## Parameters

- `originalTicker`: `Ticker`
