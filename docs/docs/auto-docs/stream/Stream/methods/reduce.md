# Method: `reduce`

## Description

Combines a sequence of values by repeatedly applying [combine].

 Similar to [Iterable.reduce], this function maintains a value,
 starting with the first element of this stream
 and updated for each further element of this stream.
 For each element after the first,
 the value is updated to the result of calling [combine]
 with the previous value and the element.

 When this stream is done, the returned future is completed with
 the value at that time.

 If this stream is empty, the returned future is completed with
 an error.
 If this stream emits an error, or the call to [combine] throws,
 the returned future is completed with that error,
 and processing is stopped.

 Example:
 ```dart
 final result = await Stream.fromIterable([2, 6, 10, 8, 2])
     .reduce((previous, element) => previous + element);
 print(result); // 28
 ```

## Return Type
`Future&lt;T&gt;`

## Parameters

- ``: `dynamic`
