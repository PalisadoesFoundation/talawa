# Method: `sublist`

## Description

Returns a new list containing the elements between [start] and [end].

 The new list is a `List&lt;E&gt;` containing the elements of this list at
 positions greater than or equal to [start] and less than [end] in the same
 order as they occur in this list.

 ```dart
 final colors = <String>['red', 'green', 'blue', 'orange', 'pink'];
 print(colors.sublist(1, 3)); // [green, blue]
 ```

 If [end] is omitted, it defaults to the [length] of this list.

 ```dart
 final colors = <String>['red', 'green', 'blue', 'orange', 'pink'];
 print(colors.sublist(3)); // [orange, pink]
 ```

 The `start` and `end` positions must satisfy the relations
 0 ≤ `start` ≤ `end` ≤ [length].
 If `end` is equal to `start`, then the returned list is empty.

## Return Type
`List&lt;E&gt;`

## Parameters

- `start`: `int`
- ``: `dynamic`
