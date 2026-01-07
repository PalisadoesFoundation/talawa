# Method: `of`

## Description

The ink controller from the closest instance of [Material] that encloses
 the given context within the closest [LookupBoundary].

 If no [Material] widget ancestor can be found then this method will assert
 in debug mode, and throw an exception in release mode.

 Typical usage is as follows:

 ```dart
 MaterialInkController inkController = Material.of(context);
 ```

 This method can be expensive (it walks the element tree).

 See also:

 * [Material.maybeOf], which is similar to this method, but returns null if
   no [Material] ancestor is found.

## Return Type
`MaterialInkController`

## Parameters

- `context`: `BuildContext`
