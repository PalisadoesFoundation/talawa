# Method: `distinct`

## Description

Skips data events if they are equal to the previous data event.

 The returned stream provides the same events as this stream, except
 that it never provides two consecutive data events that are equal.
 That is, errors are passed through to the returned stream, and
 data events are passed through if they are distinct from the most
 recently emitted data event.

 Equality is determined by the provided [equals] method. If that is
 omitted, the '==' operator on the last provided data element is used.

 If [equals] throws, the data event is replaced by an error event
 containing the thrown error. The behavior is equivalent to the
 original stream emitting the error event, and it doesn't change
 the what the most recently emitted data event is.

 The returned stream is a broadcast stream if this stream is.
 If a broadcast stream is listened to more than once, each subscription
 will individually perform the `equals` test.

 Example:
 ```dart
 final stream = Stream.fromIterable([2, 6, 6, 8, 12, 8, 8, 2]).;
 stream.forEach(print); // Outputs events: 2,6,8,12,8,2.
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- ``: `dynamic`
