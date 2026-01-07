# Method: `insertAll`

## Description

Inserts all objects of [iterable] at position [index] in this list.

 This increases the length of the list by the length of [iterable] and
 shifts all later objects towards the end of the list.

 The list must be growable.
 The [index] value must be non-negative and no greater than [length].
 ```dart
 final numbers = <int>[1, 2, 3, 4];
 final insertItems = [10, 11];
 numbers.insertAll(2, insertItems);
 print(numbers); // [1, 2, 10, 11, 3, 4]
 ```

## Return Type
`void`

## Parameters

- `index`: `int`
- `iterable`: `Iterable&lt;E&gt;`
