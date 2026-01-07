# Method: `getRange`

## Description

Creates an [Iterable] that iterates over a range of elements.

 The returned iterable iterates over the elements of this list
 with positions greater than or equal to [start] and less than [end].

 The provided range, [start] and [end], must be valid at the time
 of the call.
 A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
 An empty range (with `end == start`) is valid.

 The returned [Iterable] behaves like `skip(start).take(end - start)`.
 That is, it does *not* break if this list changes size, it just
 ends early if it reaches the end of the list early
 (if `end`, or even `start`, becomes greater than [length]).
 ```dart
 final colors = <String>['red', 'green', 'blue', 'orange', 'pink'];
 final firstRange = colors.getRange(0, 3);
 print(firstRange.join(', ')); // red, green, blue

 final secondRange = colors.getRange(2, 5);
 print(secondRange.join(', ')); // blue, orange, pink
 ```

## Return Type
`Iterable&lt;E&gt;`

## Parameters

- `start`: `int`
- `end`: `int`
