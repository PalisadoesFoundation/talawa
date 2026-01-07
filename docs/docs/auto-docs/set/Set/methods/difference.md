# Method: `difference`

## Description

Creates a new set with the elements of this that are not in [other].

 That is, the returned set contains all the elements of this [Set] that
 are not elements of [other] according to `other.contains`.
 ```dart
 final characters1 = <String>;
 final characters2 = <String>;
 final differenceSet1 = characters1.difference(characters2);
 print(differenceSet1); // 
 final differenceSet2 = characters2.difference(characters1);
 print(differenceSet2); // 
 ```

## Return Type
`Set&lt;E&gt;`

## Parameters

- `other`: `Set<Object?>`
