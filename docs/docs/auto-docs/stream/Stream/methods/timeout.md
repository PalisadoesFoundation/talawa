# Method: `timeout`

## Description

Creates a new stream with the same events as this stream.

 When someone is listening on the returned stream and more than
 [timeLimit] passes without any event being emitted by this stream,
 the [onTimeout] function is called, which can then emit further events on
 the returned stream.

 The countdown starts when the returned stream is listened to,
 and is restarted when an event from this stream is emitted,
 or when listening on the returned stream is paused and resumed.
 The countdown is stopped when listening on the returned stream is
 paused or cancelled.
 No new countdown is started when a countdown completes
 and the [onTimeout] function is called, even if events are emitted.
 If the delay between events of this stream is multiple times
 [timeLimit], at most one timeout will happen between events.

 The [onTimeout] function is called with one argument: an
 [EventSink] that allows putting events into the returned stream.
 This `EventSink` is only valid during the call to [onTimeout].
 Calling [EventSink.close] on the sink passed to [onTimeout] closes the
 returned stream, and no further events are processed.

 If [onTimeout] is omitted, a timeout will emit a [TimeoutException]
 into the error channel of the returned stream.
 If the call to [onTimeout] throws, the error is emitted as an error
 on the returned stream.

 The returned stream is a broadcast stream if this stream is.
 If a broadcast stream is listened to more than once, each subscription
 will have its individually timer that starts counting on listen,
 and the subscriptions' timers can be paused individually.

 Example:
 ```dart
 Future&lt;String&gt;  async 
 final stream = Stream&lt;String&gt;.fromFuture
     .timeout(const Duration(seconds: 2), onTimeout: (controller) );

 stream.listen(print, onDone:  => print('Done'));

 // Outputs:
 // TimeOut occurred
 // Done
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- `timeLimit`: `Duration`
- ``: `dynamic`
