# Method: `removeRange`

## Description

Removes a range of elements from the list.

 Removes the elements with positions greater than or equal to [start]
 and less than [end], from the list.
 This reduces the list's length by `end - start`.

 The provided range, given by [start] and [end], must be valid.
 A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
 An empty range (with `end == start`) is valid.

 The list must be growable.
 ```dart
 final numbers = <int>[1, 2, 3, 4, 5];
 numbers.removeRange(1, 4);
 print(numbers); // [1, 5]
 ```

## Return Type
`void`

## Parameters

- `start`: `int`
- `end`: `int`
