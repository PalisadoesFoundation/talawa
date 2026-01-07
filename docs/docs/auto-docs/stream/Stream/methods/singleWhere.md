# Method: `singleWhere`

## Description

Finds the single element in this stream matching [test].

 Returns a future that is completed with the single element of this stream
 for which [test] returns `true`.

 

 Only one element may match. If more than one matching element is found an
 error is thrown, regardless of whether [orElse] was passed.

 If this stream emits an error at any point, the returned future is
 completed with that error, and the subscription is canceled.

 A non-error result cannot be provided before this stream is done.

 Similar to [lastWhere], except that it is an error if more than one
 matching element occurs in this stream.

 Example:
 ```dart
 var result = await Stream.fromIterable([1, 2, 3, 6, 9, 12])
     .singleWhere((element) => element % 4 == 0, orElse:  => -1);
 print(result); // 12

 result = await Stream.fromIterable([2, 6, 8, 12, 24, 32])
     .singleWhere((element) => element % 9 == 0, orElse:  => -1);
 print(result); // -1

 result = await Stream.fromIterable([2, 6, 8, 12, 24, 32])
     .singleWhere((element) => element % 6 == 0, orElse:  => -1);
 // Throws.
 ```

## Return Type
`Future&lt;T&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
