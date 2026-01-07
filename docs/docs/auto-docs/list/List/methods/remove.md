# Method: `remove`

## Description

Removes the first occurrence of [value] from this list.

 Returns true if [value] was in the list, false otherwise.
 The list must be growable.

 ```dart
 final parts = <String>['head', 'shoulders', 'knees', 'toes'];
 final retVal = parts.remove('head'); // true
 print(parts); // [shoulders, knees, toes]
 ```
 The method has no effect if [value] was not in the list.
 ```dart
 final parts = <String>['shoulders', 'knees', 'toes'];
 // Note: 'head' has already been removed.
 final retVal = parts.remove('head'); // false
 print(parts); // [shoulders, knees, toes]
 ```

## Return Type
`bool`

## Parameters

- `value`: `Object?`
