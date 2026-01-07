# Method: `of`

## Description

The closest instance of [DefaultTextHeightBehavior] that encloses the
 given context.

 If no such instance exists, this method will assert in debug mode, and
 throw an exception in release mode.

 Typical usage is as follows:

 ```dart
 TextHeightBehavior defaultTextHeightBehavior = DefaultTextHeightBehavior.of(context);
 ```

 Calling this method will create a dependency on the closest
 [DefaultTextHeightBehavior] in the [context].

 See also:

 * [DefaultTextHeightBehavior.maybeOf], which is similar to this method,
   but returns null if no [DefaultTextHeightBehavior] ancestor is found.

## Return Type
`TextHeightBehavior`

## Parameters

- `context`: `BuildContext`
