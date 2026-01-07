# Method: `setAll`

## Description

Overwrites elements with the objects of [iterable].

 The elements of [iterable] are written into this list,
 starting at position [index].
 This operation does not increase the length of the list.

 The [index] must be non-negative and no greater than [length].

 The [iterable] must not have more elements than what can fit from [index]
 to [length].

 If `iterable` is based on this list, its values may change _during_ the
 `setAll` operation.
 ```dart
 final list = <String>['a', 'b', 'c', 'd'];
 list.setAll(1, ['bee', 'sea']);
 print(list); // [a, bee, sea, d]
 ```

## Return Type
`void`

## Parameters

- `index`: `int`
- `iterable`: `Iterable&lt;E&gt;`
