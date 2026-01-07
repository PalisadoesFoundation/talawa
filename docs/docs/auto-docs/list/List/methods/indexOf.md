# Method: `indexOf`

## Description

The first index of [element] in this list.

 Searches the list from index [start] to the end of the list.
 The first time an object `o` is encountered so that `o == element`,
 the index of `o` is returned.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 print(notes.indexOf('re')); // 1

 final indexWithStart = notes.indexOf('re', 2); // 3
 ```
 Returns -1 if [element] is not found.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final index = notes.indexOf('fa'); // -1
 ```

## Return Type
`int`

## Parameters

- `element`: `E`
- ``: `dynamic`
