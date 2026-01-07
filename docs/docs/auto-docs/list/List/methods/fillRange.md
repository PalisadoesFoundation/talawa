# Method: `fillRange`

## Description

Overwrites a range of elements with [fillValue].

 Sets the positions greater than or equal to [start] and less than [end],
 to [fillValue].

 The provided range, given by [start] and [end], must be valid.
 A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
 An empty range (with `end == start`) is valid.

 If the element type is not nullable, the [fillValue] must be provided and
 must be non-`null`.

 Example:
 ```dart
 final words = List.filled(5, 'old');
 print(words); // [old, old, old, old, old]
 words.fillRange(1, 3, 'new');
 print(words); // [old, new, new, old, old]
 ```

## Return Type
`void`

## Parameters

- `start`: `int`
- `end`: `int`
- ``: `dynamic`
