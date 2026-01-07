# Method: `any`

## Description

Checks whether [test] accepts any element provided by this stream.

 Calls [test] on each element of this stream.
 If the call returns `true`, the returned future is completed with `true`
 and processing stops.

 If this stream ends without finding an element that [test] accepts,
 the returned future is completed with `false`.

 If this stream emits an error, or if the call to [test] throws,
 the returned future is completed with that error,
 and processing stops.

 Example:
 ```dart
 final result =
     await Stream.periodic(const Duration(seconds: 1), (count) => count)
         .take(15)
         .any((element) => element >= 5);

 print(result); // true
 ```

## Return Type
`Future&lt;bool&gt;`

## Parameters

- ``: `dynamic`
