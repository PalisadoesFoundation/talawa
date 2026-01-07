# Method: `takeWhile`

## Description

Forwards data events while [test] is successful.

 Returns a stream that provides the same events as this stream
 until [test] fails for a data event.
 The returned stream is done when either this stream is done,
 or when this stream first emits a data event that fails [test].

 The `test` call is considered failing if it returns a non-`true` value
 or if it throws. If the `test` call throws, the error is emitted as the
 last event on the returned streams.

 Stops listening to this stream after the accepted elements.

 Internally the method cancels its subscription after these elements. This
 means that single-subscription (non-broadcast) streams are closed and
 cannot be reused after a call to this method.

 The returned stream is a broadcast stream if this stream is.
 For a broadcast stream, the events are only tested from the time
 the returned stream is listened to.

 Example:
 ```dart
 final stream = Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (i) => i)
     .takeWhile((event) => event < 6);
 stream.forEach(print); // Outputs events: 0, ..., 5.
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- ``: `dynamic`
