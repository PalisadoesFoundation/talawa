# Method: `sublist`

## Description

Creates a new list containing the elements between [start] and [end].

 The new list is a `Float64List` containing the elements of this
 list at positions greater than or equal to [start] and less than [end] in
 the same order as they occur in this list.

 ```dart
 var numbers = Float64List.fromList([0.0, 1.0, 2.0, 3.0, 4.0]);
 print(numbers.sublist(1, 3)); // [1.0, 2.0]
 print(numbers.sublist(1, 3).runtimeType); // Float64List
 ```

 If [end] is omitted, it defaults to the [length] of this list.

 ```dart
 print(numbers.sublist(1)); // [1.0, 2.0, 3.0, 4.0]
 ```

 The `start` and `end` positions must satisfy the relations
 0 ≤ `start` ≤ `end` ≤ `this.length`.
 If `end` is equal to `start`, then the returned list is empty.

## Return Type
`Float64List`

## Parameters

- `start`: `int`
- ``: `dynamic`
