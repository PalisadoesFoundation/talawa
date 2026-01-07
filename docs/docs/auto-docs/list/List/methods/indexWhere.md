# Method: `indexWhere`

## Description

The first index in the list that satisfies the provided [test].

 Searches the list from index [start] to the end of the list.
 The first time an object `o` is encountered so that `test(o)` is true,
 the index of `o` is returned.

 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final first = notes.indexWhere((note) => note.startsWith('r')); // 1
 final second = notes.indexWhere((note) => note.startsWith('r'), 2); // 3
 ```

 Returns -1 if [element] is not found.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final index = notes.indexWhere((note) => note.startsWith('k')); // -1
 ```

## Return Type
`int`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
