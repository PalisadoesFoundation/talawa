# Method: `map`

## Description

Transforms each element of this stream into a new stream event.

 Creates a new stream that converts each element of this stream
 to a new value using the [convert] function, and emits the result.

 For each data event, `o`, in this stream, the returned stream
 provides a data event with the value `convert(o)`.
 If [convert] throws, the returned stream reports it as an error
 event instead.

 Error and done events are passed through unchanged to the returned stream.

 The returned stream is a broadcast stream if this stream is.
 The [convert] function is called once per data event per listener.
 If a broadcast stream is listened to more than once, each subscription
 will individually call [convert] on each data event.

 Unlike [transform], this method does not treat the stream as
 chunks of a single value. Instead each event is converted independently
 of the previous and following events, which may not always be correct.
 For example, UTF-8 encoding, or decoding, will give wrong results
 if a surrogate pair, or a multibyte UTF-8 encoding, is split into
 separate events, and those events are attempted encoded or decoded
 independently.

 Example:
 ```dart
 final stream =
     Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (count) => count)
         .take(5);

 final calculationStream =
     stream.map&lt;String&gt;((event) => 'Square: $');
 calculationStream.forEach(print);
 // Square: 0
 // Square: 1
 // Square: 4
 // Square: 9
 // Square: 16
 ```

## Return Type
`Stream&lt;S&gt;`

## Parameters

- ``: `dynamic`
