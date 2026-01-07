# Method: `current`

## Description

The current element.

 If the iterator has not yet been moved to the first element
 ([moveNext] has not been called yet),
 or if the iterator has been moved past the last element of the [Iterable]
 ([moveNext] has returned false),
 then [current] is unspecified.
 An [Iterator] may either throw or return an iterator specific default value
 in that case.

 The `current` getter should keep its value until the next call to
 [moveNext], even if an underlying collection changes.
 After a successful call to `moveNext`, the user doesn't need to cache
 the current value, but can keep reading it from the iterator.
 ```dart
 final colors = ['blue', 'yellow', 'red'];
 var colorsIterator = colors.iterator;
 while (colorsIterator.) 
 ```
 The output of the example is:
 ```
 blue
 yellow
 red
 ```

## Return Type
`E`

