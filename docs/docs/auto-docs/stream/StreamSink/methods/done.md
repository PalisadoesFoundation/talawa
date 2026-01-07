# Method: `done`

## Description

Return a future which is completed when the [StreamSink] is finished.

 If the `StreamSink` fails with an error,
 perhaps in response to adding events using [add], [addError] or [close],
 the [done] future will complete with that error.

 Otherwise, the returned future will complete when either:

 * all events have been processed and the sink has been closed, or
 * the sink has otherwise been stopped from handling more events
   (for example by canceling a stream subscription).

## Return Type
`Future`

