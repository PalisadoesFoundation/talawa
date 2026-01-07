# Method: `flush`

## Description

Returns a [Future] that completes once all buffered data is accepted by the
 underlying [StreamConsumer].

 This method must not be called while an [addStream] is incomplete.

 NOTE: This is not necessarily the same as the data being flushed by the
 operating system.

## Return Type
`Future`

