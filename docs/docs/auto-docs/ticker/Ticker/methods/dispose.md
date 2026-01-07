# Method: `dispose`

## Description

Release the resources used by this object. The object is no longer usable
 after this method is called.

 It is legal to call this method while [isActive] is true, in which case:

  * The frame callback that was requested by [scheduleTick], if any, is
    canceled.
  * The future that was returned by [start] does not resolve.
  * The future obtained from [TickerFuture.orCancel], if any, resolves
    with a [TickerCanceled] error.

## Return Type
`void`

