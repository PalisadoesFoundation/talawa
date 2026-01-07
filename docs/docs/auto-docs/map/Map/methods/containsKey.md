# Method: `containsKey`

## Description

Whether this map contains the given [key].

 Returns true if any of the keys in the map are equal to `key`
 according to the equality used by the map.
 ```dart
 final moonCount = <String, int>;
 final containsUranus = moonCount.containsKey('Uranus'); // true
 final containsPluto = moonCount.containsKey('Pluto'); // false
 ```

## Return Type
`bool`

## Parameters

- `key`: `Object?`
