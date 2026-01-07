# Method: `removeAt`

## Description

Removes the object at position [index] from this list.

 This method reduces the length of `this` by one and moves all later objects
 down by one position.

 Returns the removed value.

 The [index] must be in the range `0 ≤ index < length`.
 The list must be growable.
 ```dart
 final parts = <String>['head', 'shoulder', 'knees', 'toes'];
 final retVal = parts.removeAt(2); // knees
 print(parts); // [head, shoulder, toes]
 ```

## Return Type
`E`

## Parameters

- `index`: `int`
