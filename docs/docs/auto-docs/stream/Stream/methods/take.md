# Method: `take`

## Description

Provides at most the first [count] data events of this stream.

 Returns a stream that emits the same events that this stream would
 if listened to at the same time,
 until either this stream ends or it has emitted [count] data events,
 at which point the returned stream is done.

 If this stream produces fewer than [count] data events before it's done,
 so will the returned stream.

 Starts listening to this stream when the returned stream is listened to
 and stops listening when the first [count] data events have been received.

 This means that if this is a single-subscription (non-broadcast) streams
 it cannot be reused after the returned stream has been listened to.

 If this is a broadcast stream, the returned stream is a broadcast stream.
 In that case, the events are only counted from the time
 the returned stream is listened to.

 Example:
 ```dart
 final stream =
     Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (i) => i)
         .take(60);
 stream.forEach(print); // Outputs events: 0, ... 59.
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- `count`: `int`
