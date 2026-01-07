# Method: `sublist`

## Description

Creates a new list containing the elements between [start] and [end].

 The new list is a `Uint32List` containing the elements of this
 list at positions greater than or equal to [start] and less than [end] in
 the same order as they occur in this list.

 ```dart
 var numbers = Uint32List.fromList([0, 1, 2, 3, 4]);
 print(numbers.sublist(1, 3)); // [1, 2]
 print(numbers.sublist(1, 3).runtimeType); // Uint32List
 ```

 If [end] is omitted, it defaults to the [length] of this list.

 ```dart
 print(numbers.sublist(1)); // [1, 2, 3, 4]
 ```

 The `start` and `end` positions must satisfy the relations
 0 ≤ `start` ≤ `end` ≤ `this.length`.
 If `end` is equal to `start`, then the returned list is empty.

## Return Type
`Uint32List`

## Parameters

- `start`: `int`
- ``: `dynamic`
