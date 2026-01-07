# Method: `stop`

## Description

Stops calling this [Ticker]'s callback.

 If called with the `canceled` argument set to false (the default), causes
 the future returned by [start] to resolve. If called with the `canceled`
 argument set to true, the future does not resolve, and the future obtained
 from [TickerFuture.orCancel], if any, resolves with a [TickerCanceled]
 error.

 Calling this sets [isActive] to false.

 This method does nothing if called when the ticker is inactive.

 By convention, this method is used by the object that receives the ticks
 (as opposed to the [TickerProvider] which created the ticker).

## Return Type
`void`

## Parameters

- ``: `dynamic`
