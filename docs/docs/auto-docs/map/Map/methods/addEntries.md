# Method: `addEntries`

## Description

Adds all key/value pairs of [newEntries] to this map.

 If a key of [newEntries] is already in this map,
 the corresponding value is overwritten.

 The operation is equivalent to doing `this[entry.key] = entry.value`
 for each [MapEntry] of the iterable.
 ```dart
 final planets = <int, String>;
 final gasGiants = <int, String>;
 final iceGiants = <int, String>;
 planets.addEntries(gasGiants.entries);
 planets.addEntries(iceGiants.entries);
 print(planets);
 // 
 ```

## Return Type
`void`

## Parameters

- `newEntries`: `Iterable&lt;MapEntry&lt;K, V&gt;&gt;`
