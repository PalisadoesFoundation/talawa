# Method: `maybeOf`

## Description

The closest instance of [DefaultTextHeightBehavior] that encloses the
 given context, or null if none is found.

 If no such instance exists, this method will return `null`.

 Calling this method will create a dependency on the closest
 [DefaultTextHeightBehavior] in the [context], if there is one.

 Typical usage is as follows:

 ```dart
 TextHeightBehavior? defaultTextHeightBehavior = DefaultTextHeightBehavior.of(context);
 ```

 See also:

 * [DefaultTextHeightBehavior.maybeOf], which is similar to this method,
   but asserts if no [DefaultTextHeightBehavior] ancestor is found.

## Return Type
`TextHeightBehavior?`

## Parameters

- `context`: `BuildContext`
