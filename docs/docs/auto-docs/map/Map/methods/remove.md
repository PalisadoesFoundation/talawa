# Method: `remove`

## Description

Removes [key] and its associated value, if present, from the map.

 Returns the value associated with `key` before it was removed.
 Returns `null` if `key` was not in the map.

 Note that some maps allow `null` as a value,
 so a returned `null` value doesn't always mean that the key was absent.
 ```dart
 final terrestrial = <int, String>;
 final removedValue = terrestrial.remove(2); // Venus
 print(terrestrial); // 
 ```

## Return Type
`V?`

## Parameters

- `key`: `Object?`
