# Method: `close`

## Description

Tells the stream sink that no further streams will be added.

 This allows the stream sink to complete any remaining work and release
 resources that are no longer needed

 Returns a future which is completed when the stream sink has shut down.
 If cleaning up can fail, the error may be reported in the returned future,
 otherwise it completes with `null`.

 Returns the same future as [done].

 The stream sink may close before the [close] method is called, either due
 to an error or because it is itself providing events to someone who has
 stopped listening. In that case, the [done] future is completed first,
 and the `close` method will return the `done` future when called.

 Unifies [StreamConsumer.close] and [EventSink.close] which both mark their
 object as not expecting any further events.

## Return Type
`Future`

