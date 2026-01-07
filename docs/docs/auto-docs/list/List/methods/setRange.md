# Method: `setRange`

## Description

Writes some elements of [iterable] into a range of this list.

 Copies the objects of [iterable], skipping [skipCount] objects first,
 into the range from [start], inclusive, to [end], exclusive, of this list.
 ```dart
 final list1 = <int>[1, 2, 3, 4];
 final list2 = <int>[5, 6, 7, 8, 9];
 // Copies the 4th and 5th items in list2 as the 2nd and 3rd items
 // of list1.
 const skipCount = 3;
 list1.setRange(1, 3, list2, skipCount);
 print(list1); // [1, 8, 9, 4]
 ```
 The provided range, given by [start] and [end], must be valid.
 A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
 An empty range (with `end == start`) is valid.

 The [iterable] must have enough objects to fill the range from `start`
 to `end` after skipping [skipCount] objects.

 If `iterable` is this list, the operation correctly copies the elements
 originally in the range from `skipCount` to `skipCount + (end - start)` to
 the range `start` to `end`, even if the two ranges overlap.

 If `iterable` depends on this list in some other way, no guarantees are
 made.

## Return Type
`void`

## Parameters

- `start`: `int`
- `end`: `int`
- `iterable`: `Iterable&lt;E&gt;`
- ``: `dynamic`
