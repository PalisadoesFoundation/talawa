# Method: `skip`

## Description

Skips the first [count] data events from this stream.

 Returns a stream that emits the same events as this stream would
 if listened to at the same time, except that the first [count]
 data events are not emitted.
 The returned stream is done when this stream is.

 If this stream emits fewer than [count] data events
 before being done, the returned stream emits no data events.

 The returned stream is a broadcast stream if this stream is.
 For a broadcast stream, the events are only counted from the time
 the returned stream is listened to.

 Example:
 ```dart
 final stream =
     Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (i) => i).skip(7);
 stream.forEach(print); // Skips events 0, ..., 6. Outputs events: 7, ...
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- `count`: `int`
