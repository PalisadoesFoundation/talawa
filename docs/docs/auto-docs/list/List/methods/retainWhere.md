# Method: `retainWhere`

## Description

Removes all objects from this list that fail to satisfy [test].

 An object `o` satisfies [test] if `test(o)` is true.
 ```dart
 final numbers = <String>['one', 'two', 'three', 'four'];
 numbers.retainWhere((item) => item.length == 3);
 print(numbers); // [one, two]
 ```
 The list must be growable.

## Return Type
`void`

## Parameters

- ``: `dynamic`
