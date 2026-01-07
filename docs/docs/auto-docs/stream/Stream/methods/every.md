# Method: `every`

## Description

Checks whether [test] accepts all elements provided by this stream.

 Calls [test] on each element of this stream.
 If the call returns `false`, the returned future is completed with `false`
 and processing stops.

 If this stream ends without finding an element that [test] rejects,
 the returned future is completed with `true`.

 If this stream emits an error, or if the call to [test] throws,
 the returned future is completed with that error,
 and processing stops.

 Example:
 ```dart
 final result =
     await Stream.periodic(const Duration(seconds: 1), (count) => count)
         .take(15)
         .every((x) => x <= 5);
 print(result); // false
 ```

## Return Type
`Future&lt;bool&gt;`

## Parameters

- ``: `dynamic`
