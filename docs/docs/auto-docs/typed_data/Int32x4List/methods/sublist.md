# Method: `sublist`

## Description

Creates a new list containing the elements between [start] and [end].

 The new list is an `Int32x4List` containing the elements of this
 list at positions greater than or equal to [start] and less than [end] in
 the same order as they occur in this list.

 ```dart
 var numbers = Int32x4List.fromList([
   Int32x4(0, 1, 2, 3),
   Int32x4(1, 2, 3, 4),
   Int32x4(2, 3, 4, 5),
   Int32x4(3, 4, 5, 6),
   Int32x4(4, 5, 6, 7),
 ]);
 print(numbers.sublist(1, 2)); // [Int32x4(1, 2, 3, 4)]
 print(numbers.sublist(1, 2).runtimeType); // Int32x4List
 ```

 If [end] is omitted, it defaults to the [length] of this list.

 ```dart
 print(numbers.sublist(3)); // [Int32x4(3, 4, 5, 6), Int32x4(4, 5, 6, 7)]
 ```

 The `start` and `end` positions must satisfy the relations
 0 ≤ `start` ≤ `end` ≤ `this.length`.
 If `end` is equal to `start`, then the returned list is empty.

## Return Type
`Int32x4List`

## Parameters

- `start`: `int`
- ``: `dynamic`
