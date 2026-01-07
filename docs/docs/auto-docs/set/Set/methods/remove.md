# Method: `remove`

## Description

Removes [value] from the set.

 Returns `true` if [value] was in the set, and `false` if not.
 The method has no effect if [value] was not in the set.
 ```dart
 final characters = <String>;
 final didRemoveB = characters.remove('B'); // true
 final didRemoveD = characters.remove('D'); // false
 print(characters); // 
 ```

## Return Type
`bool`

## Parameters

- `value`: `Object?`
