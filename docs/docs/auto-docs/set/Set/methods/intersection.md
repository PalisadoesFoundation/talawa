# Method: `intersection`

## Description

Creates a new set which is the intersection between this set and [other].

 That is, the returned set contains all the elements of this [Set] that
 are also elements of [other] according to `other.contains`.
 ```dart
 final characters1 = <String>;
 final characters2 = <String>;
 final intersectionSet = characters1.intersection(characters2);
 print(intersectionSet); // 
 ```

## Return Type
`Set&lt;E&gt;`

## Parameters

- `other`: `Set<Object?>`
