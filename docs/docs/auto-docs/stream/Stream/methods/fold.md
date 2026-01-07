# Method: `fold`

## Description

Combines a sequence of values by repeatedly applying [combine].

 Similar to [Iterable.fold], this function maintains a value,
 starting with [initialValue] and updated for each element of
 this stream.
 For each element, the value is updated to the result of calling
 [combine] with the previous value and the element.

 When this stream is done, the returned future is completed with
 the value at that time.
 For an empty stream, the future is completed with [initialValue].

 If this stream emits an error, or the call to [combine] throws,
 the returned future is completed with that error,
 and processing is stopped.

 Example:
 ```dart
 final result = await Stream.fromIterable([2, 6, 10, 8, 2])
     .fold&lt;int&gt;(10, (previous, element) => previous + element);
 print(result); // 38
 ```

## Return Type
`Future&lt;S&gt;`

## Parameters

- `initialValue`: `S`
- ``: `dynamic`
