# Method: `pipe`

## Description

Pipes the events of this stream into [streamConsumer].

 All events of this stream are added to `streamConsumer` using
 [StreamConsumer.addStream].
 The `streamConsumer` is closed when this stream has been successfully added
 to it - when the future returned by `addStream` completes without an error.

 Returns a future which completes when this stream has been consumed
 and the consumer has been closed.

 The returned future completes with the same result as the future returned
 by [StreamConsumer.close].
 If the call to [StreamConsumer.addStream] fails in some way, this
 method fails in the same way.

## Return Type
`Future`

## Parameters

- `streamConsumer`: `StreamConsumer&lt;T&gt;`
