# Method: `lastWhere`

## Description

Finds the last element in this stream matching [test].

 Returns a future that is completed with the last element of this stream
 for which [test] returns `true`.

 

 If this stream emits an error at any point, the returned future is
 completed with that error, and the subscription is canceled.

 A non-error result cannot be provided before this stream is done.

 Similar too [firstWhere], except that the last matching element is found
 instead of the first.

 Example:
 ```dart
 var result = await Stream.fromIterable([1, 3, 4, 7, 12, 24, 32])
     .lastWhere((element) => element % 6 == 0, orElse:  => -1);
 print(result); // 24

 result = await Stream.fromIterable([1, 3, 4, 7, 12, 24, 32])
     .lastWhere((element) => element % 10 == 0, orElse:  => -1);
 print(result); // -1
 ```

## Return Type
`Future&lt;T&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
