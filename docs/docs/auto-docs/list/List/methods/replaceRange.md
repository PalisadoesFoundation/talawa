# Method: `replaceRange`

## Description

Replaces a range of elements with the elements of [replacements].

 Removes the objects in the range from [start] to [end],
 then inserts the elements of [replacements] at [start].
 ```dart
 final numbers = <int>[1, 2, 3, 4, 5];
 final replacements = [6, 7];
 numbers.replaceRange(1, 4, replacements);
 print(numbers); // [1, 6, 7, 5]
 ```
 The provided range, given by [start] and [end], must be valid.
 A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
 An empty range (with `end == start`) is valid.

 The operation `list.replaceRange(start, end, replacements)`
 is roughly equivalent to:
 ```dart
 final numbers = <int>[1, 2, 3, 4, 5];
 numbers.removeRange(1, 4);
 final replacements = [6, 7];
 numbers.insertAll(1, replacements);
 print(numbers); // [1, 6, 7, 5]
 ```
 but may be more efficient.

 The list must be growable.
 This method does not work on fixed-length lists, even when [replacements]
 has the same number of elements as the replaced range. In that case use
 [setRange] instead.

## Return Type
`void`

## Parameters

- `start`: `int`
- `end`: `int`
- `replacements`: `Iterable&lt;E&gt;`
