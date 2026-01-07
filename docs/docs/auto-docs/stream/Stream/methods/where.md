# Method: `where`

## Description

Creates a new stream from this stream that discards some elements.

 The new stream sends the same error and done events as this stream,
 but it only sends the data events that satisfy the [test].

 If the [test] function throws, the data event is dropped and the
 error is emitted on the returned stream instead.

 The returned stream is a broadcast stream if this stream is.
 If a broadcast stream is listened to more than once, each subscription
 will individually perform the `test`.

 Example:
 ```dart
 final stream =
     Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (count) => count)
         .take(10);

 final customStream = stream.where((event) => event > 3 && event <= 6);
 customStream.listen(print); // Outputs event values: 4,5,6.
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- ``: `dynamic`
