# Method: `firstWhere`

## Description

Finds the first element of this stream matching [test].

 Returns a future that is completed with the first element of this stream
 for which [test] returns `true`.

 
 If no such element is found before this stream is done, and an
 [orElse] function is provided, the result of calling [orElse]
 becomes the value of the future. If [orElse] throws, the returned
 future is completed with that error.
 

 If this stream emits an error before the first matching element,
 the returned future is completed with that error, and processing stops.

 Stops listening to this stream after the first matching element or error
 has been received.

 Internally the method cancels its subscription after the first element that
 matches the predicate. This means that single-subscription (non-broadcast)
 streams are closed and cannot be reused after a call to this method.

 If an error occurs, or if this stream ends without finding a match and
 with no [orElse] function provided,
 the returned future is completed with an error.

 Example:
 ```dart
 var result = await Stream.fromIterable([1, 3, 4, 9, 12])
     .firstWhere((element) => element % 6 == 0, orElse:  => -1);
 print(result); // 12

 result = await Stream.fromIterable([1, 2, 3, 4, 5])
     .firstWhere((element) => element % 6 == 0, orElse:  => -1);
 print(result); // -1
 ```

## Return Type
`Future&lt;T&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
