# Method: `first`

## Description

The first element of the list.

 The list must be non-empty when accessing its first element.

 The first element of a list can be modified, unlike an [Iterable].
 A `list.first` is equivalent to `list[0]`,
 both for getting and setting the value.

 ```dart
 final numbers = <int>[1, 2, 3];
 print(numbers.first); // 1
 numbers.first = 10;
 print(numbers.first); // 10
 numbers.;
 numbers.first; // Throws.
 ```

## Return Type
`void`

## Parameters

- `value`: `E`
