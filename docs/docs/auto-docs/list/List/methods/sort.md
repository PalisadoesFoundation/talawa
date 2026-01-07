# Method: `sort`

## Description

Sorts this list according to the order specified by the [compare] function.

 The [compare] function must act as a [Comparator].
 ```dart
 final numbers = <String>['two', 'three', 'four'];
 // Sort from shortest to longest.
 numbers.sort((a, b) => a.length.compareTo(b.length));
 print(numbers); // [two, four, three]
 ```
 The default [List] implementations use [Comparable.compare] if
 [compare] is omitted.
 ```dart
 final numbers = <int>[13, 2, -11, 0];
 numbers.;
 print(numbers); // [-11, 0, 2, 13]
 ```
 In that case, the elements of the list must be [Comparable] to
 each other.

 A [Comparator] may compare objects as equal (return zero), even if they
 are distinct objects.
 The sort function is not guaranteed to be stable, so distinct objects
 that compare as equal may occur in any order in the result:
 ```dart
 final numbers = <String>['one', 'two', 'three', 'four'];
 numbers.sort((a, b) => a.length.compareTo(b.length));
 print(numbers); // [one, two, four, three] OR [two, one, four, three]
 ```

## Return Type
`void`

## Parameters

- ``: `dynamic`
