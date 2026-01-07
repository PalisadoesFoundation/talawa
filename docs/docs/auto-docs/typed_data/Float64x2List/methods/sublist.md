# Method: `sublist`

## Description

Creates a new list containing the elements between [start] and [end].

 The new list is a `Float64x2List` containing the elements of this
 list at positions greater than or equal to [start] and less than [end] in
 the same order as they occur in this list.

 ```dart
 var numbers = Float64x2List.fromList([
   Float64x2(0, 1),
   Float64x2(1, 2),
   Float64x2(2, 3),
   Float64x2(3, 4),
   Float64x2(4, 5),
 ]);
 print(numbers.sublist(1, 3)); // [Float64x2(1, 2), Float64x2(2, 3)]
 print(numbers.sublist(1, 3).runtimeType); // Float64x2List
 ```

 If [end] is omitted, it defaults to the [length] of this list.

 ```dart
 print(numbers.sublist(3)); // [Float64x2(3, 4), Float64x2(4, 5)]
 ```

 The `start` and `end` positions must satisfy the relations
 0 ≤ `start` ≤ `end` ≤ `this.length`.
 If `end` is equal to `start`, then the returned list is empty.

## Return Type
`Float64x2List`

## Parameters

- `start`: `int`
- ``: `dynamic`
