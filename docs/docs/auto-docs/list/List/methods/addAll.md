# Method: `addAll`

## Description

Appends all objects of [iterable] to the end of this list.

 Extends the length of the list by the number of objects in [iterable].
 The list must be growable.

 ```dart
 final numbers = <int>[1, 2, 3];
 numbers.addAll([4, 5, 6]);
 print(numbers); // [1, 2, 3, 4, 5, 6]
 ```

## Return Type
`void`

## Parameters

- `iterable`: `Iterable&lt;E&gt;`
