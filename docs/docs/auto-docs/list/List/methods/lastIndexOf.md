# Method: `lastIndexOf`

## Description

The last index of [element] in this list.

 Searches the list backwards from index [start] to 0.

 The first time an object `o` is encountered so that `o == element`,
 the index of `o` is returned.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 const startIndex = 2;
 final index = notes.lastIndexOf('re', startIndex); // 1
 ```
 If [start] is not provided, this method searches from the end of the
 list.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final index = notes.lastIndexOf('re'); // 3
 ```
 Returns -1 if [element] is not found.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final index = notes.lastIndexOf('fa'); // -1
 ```

## Return Type
`int`

## Parameters

- `element`: `E`
- ``: `dynamic`
