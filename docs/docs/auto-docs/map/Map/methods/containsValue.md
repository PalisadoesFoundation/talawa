# Method: `containsValue`

## Description

Whether this map contains the given [value].

 Returns true if any of the values in the map are equal to `value`
 according to the `==` operator.
 ```dart
 final moonCount = <String, int>;
 final moons3 = moonCount.containsValue(3); // false
 final moons82 = moonCount.containsValue(82); // true
 ```

## Return Type
`bool`

## Parameters

- `value`: `Object?`
