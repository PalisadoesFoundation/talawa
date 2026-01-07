# Method: `lastIndexWhere`

## Description

The last index in the list that satisfies the provided [test].

 Searches the list from index [start] to 0.
 The first time an object `o` is encountered so that `test(o)` is true,
 the index of `o` is returned.
 If [start] is omitted, it defaults to the [length] of the list.

 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final first = notes.lastIndexWhere((note) => note.startsWith('r')); // 3
 final second = notes.lastIndexWhere((note) => note.startsWith('r'),
     2); // 1
 ```

 Returns -1 if [element] is not found.
 ```dart
 final notes = <String>['do', 're', 'mi', 're'];
 final index = notes.lastIndexWhere((note) => note.startsWith('k'));
 print(index); // -1
 ```

## Return Type
`int`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
