# Method: `maybeOf`

## Description

The ink controller from the closest instance of this class that
 encloses the given context within the closest [LookupBoundary].

 Typical usage is as follows:

 ```dart
 MaterialInkController? inkController = Material.maybeOf(context);
 ```

 This method can be expensive (it walks the element tree).

 See also:

 * [Material.of], which is similar to this method, but asserts if
   no [Material] ancestor is found.

## Return Type
`MaterialInkController?`

## Parameters

- `context`: `BuildContext`
