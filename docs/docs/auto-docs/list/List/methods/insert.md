# Method: `insert`

## Description

Inserts [element] at position [index] in this list.

 This increases the length of the list by one and shifts all objects
 at or after the index towards the end of the list.

 The list must be growable.
 The [index] value must be non-negative and no greater than [length].

 ```dart
 final numbers = <int>[1, 2, 3, 4];
 const index = 2;
 numbers.insert(index, 10);
 print(numbers); // [1, 2, 10, 3, 4]
 ```

## Return Type
`void`

## Parameters

- `index`: `int`
- `element`: `E`
