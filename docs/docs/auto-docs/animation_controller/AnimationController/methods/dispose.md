# Method: `dispose`

## Description

Release the resources used by this object. The object is no longer usable
 after this method is called.

 The most recently returned [TickerFuture], if any, is marked as having been
 canceled, meaning the future never completes and its [TickerFuture.orCancel]
 derivative future completes with a [TickerCanceled] error.

## Return Type
`void`

