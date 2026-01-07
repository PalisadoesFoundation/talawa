# Method: `skipWhile`

## Description

Skip data events from this stream while they are matched by [test].

 Returns a stream that emits the same events as this stream,
 except that data events are not emitted until a data event fails `test`.
 The test fails when called with a data event
 if it returns a non-`true` value or if the call to `test` throws.
 If the call throws, the error is emitted as an error event
 on the returned stream instead of the data event,
 otherwise the event that made `test` return non-true is emitted as the
 first data event.

 Error and done events are provided by the returned stream unmodified.

 The returned stream is a broadcast stream if this stream is.
 For a broadcast stream, the events are only tested from the time
 the returned stream is listened to.

 Example:
 ```dart
 final stream = Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (i) => i)
     .take(10)
     .skipWhile((x) => x < 5);
 stream.forEach(print); // Outputs events: 5, ..., 9.
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- ``: `dynamic`
