# Method: `union`

## Description

Creates a new set which contains all the elements of this set and [other].

 That is, the returned set contains all the elements of this [Set] and
 all the elements of [other].
 ```dart
 final characters1 = <String>;
 final characters2 = <String>;
 final unionSet1 = characters1.union(characters2);
 print(unionSet1); // 
 final unionSet2 = characters2.union(characters1);
 print(unionSet2); // 
 ```

## Return Type
`Set&lt;E&gt;`

## Parameters

- `other`: `Set&lt;E&gt;`
