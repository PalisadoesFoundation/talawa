# Method: `length`

## Description

Setting the `length` changes the number of elements in the list.

 The list must be growable.
 If [newLength] is greater than current length,
 new entries are initialized to `null`,
 so [newLength] must not be greater than the current length
 if the element type [E] is non-nullable.

 ```dart
 final maybeNumbers = <int?>[1, null, 3];
 maybeNumbers.length = 5;
 print(maybeNumbers); // [1, null, 3, null, null]
 maybeNumbers.length = 2;
 print(maybeNumbers); // [1, null]

 final numbers = <int>[1, 2, 3];
 numbers.length = 1;
 print(numbers); // [1]
 numbers.length = 5; // Throws, cannot add `null`s.
 ```

## Parameters

- `newLength`: `int`
