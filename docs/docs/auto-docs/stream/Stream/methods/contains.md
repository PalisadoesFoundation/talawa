# Method: `contains`

## Description

Returns whether [needle] occurs in the elements provided by this stream.

 Compares each element of this stream to [needle] using [Object.==].
 If an equal element is found, the returned future is completed with `true`.
 If this stream ends without finding a match, the future is completed with
 `false`.

 If this stream emits an error, or the call to [Object.==] throws,
 the returned future is completed with that error,
 and processing stops.

 Example:
 ```dart
 final result = await Stream.fromIterable(['Year', 2021, 12, 24, 'Dart'])
     .contains('Dart');
 print(result); // true
 ```

## Return Type
`Future&lt;bool&gt;`

## Parameters

- `needle`: `Object?`
