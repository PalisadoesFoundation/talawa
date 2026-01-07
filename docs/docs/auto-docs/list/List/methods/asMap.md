# Method: `asMap`

## Description

An unmodifiable [Map] view of this list.

 The map uses the indices of this list as keys and the corresponding objects
 as values. The `Map.keys` [Iterable] iterates the indices of this list
 in numerical order.
 ```dart
 var words = <String>['fee', 'fi', 'fo', 'fum'];
 var map = words.;  // 
 map.keys.; // [0, 1, 2, 3]
 ```

## Return Type
`Map&lt;int, E&gt;`

