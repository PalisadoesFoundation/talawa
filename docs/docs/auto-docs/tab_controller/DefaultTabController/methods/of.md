# Method: `of`

## Description

The closest instance of [DefaultTabController] that encloses the given
 context.

 If no instance is found, this method will assert in debug mode and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest
 [DefaultTabController] in the [context].

  Typical usage is as follows:

 ```dart
 TabController controller = DefaultTabController.of(context);
 ```
 

 See also:

 * [DefaultTabController.maybeOf], which is similar to this method, but
   returns null if no [DefaultTabController] ancestor is found.

## Return Type
`TabController`

## Parameters

- `context`: `BuildContext`
