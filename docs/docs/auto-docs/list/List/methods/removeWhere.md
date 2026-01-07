# Method: `removeWhere`

## Description

Removes all objects from this list that satisfy [test].

 An object `o` satisfies [test] if `test(o)` is true.
 ```dart
 final numbers = <String>['one', 'two', 'three', 'four'];
 numbers.removeWhere((item) => item.length == 3);
 print(numbers); // [three, four]
 ```
 The list must be growable.

## Return Type
`void`

## Parameters

- ``: `dynamic`
