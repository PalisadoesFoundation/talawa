# Method: `last`

## Description

The last element of the list.

 The list must be non-empty when accessing its last element.

 The last element of a list can be modified, unlike an [Iterable].
 A `list.last` is equivalent to `theList[theList.length - 1]`,
 both for getting and setting the value.

 ```dart
 final numbers = <int>[1, 2, 3];
 print(numbers.last); // 3
 numbers.last = 10;
 print(numbers.last); // 10
 numbers.;
 numbers.last; // Throws.
 ```

## Return Type
`void`

## Parameters

- `value`: `E`
