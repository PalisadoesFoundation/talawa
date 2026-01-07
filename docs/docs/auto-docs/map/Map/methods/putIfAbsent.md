# Method: `putIfAbsent`

## Description

Look up the value of [key], or add a new entry if it isn't there.

 Returns the value associated to [key], if there is one.
 Otherwise calls [ifAbsent] to get a new value, associates [key] to
 that value, and then returns the new value.

 That is, if the key is currently in the map,
 `map.putIfAbsent(key, ifAbsent)` is equivalent to `map[key]`.
 If the key is not currently in the map,
 it's instead equivalent to `map[key] = `
 (but without any guarantee that the `[]` and `[]=` operators are
 actually called to achieve that effect).

 ```dart
 final diameters = <num, String>;
 final otherDiameters = <double, String>;

 for (final item in otherDiameters.entries) 
 print(diameters); // 

 // If the key already exists, the current value is returned.
 final result = diameters.putIfAbsent(0.383,  => 'Random');
 print(result); // Mercury
 print(diameters); // 
 ```
 The [ifAbsent] function is allowed to modify the map,
 and if so, it behaves the same as the equivalent `map[key] = `.

## Return Type
`V`

## Parameters

- `key`: `K`
- ``: `dynamic`
