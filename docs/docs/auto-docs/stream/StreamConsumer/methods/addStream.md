# Method: `addStream`

## Description

Consumes the elements of [stream].

 Listens on [stream] and does something for each event.

 Returns a future which is completed when the stream is done being added,
 and the consumer is ready to accept a new stream.
 No further calls to [addStream] or [close] should happen before the
 returned future has completed.

 The consumer may stop listening to the stream after an error,
 it may consume all the errors and only stop at a done event,
 or it may be canceled early if the receiver don't want any further events.

 If the consumer stops listening because of some error preventing it
 from continuing, it may report this error in the returned future,
 otherwise it will just complete the future with `null`.

## Return Type
`Future`

## Parameters

- `stream`: `Stream&lt;S&gt;`
