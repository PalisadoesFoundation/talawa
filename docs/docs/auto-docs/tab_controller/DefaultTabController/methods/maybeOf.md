# Method: `maybeOf`

## Description

The closest instance of [DefaultTabController] that encloses the given
 context, or null if none is found.

  Typical usage is as follows:

 ```dart
 TabController? controller = DefaultTabController.maybeOf(context);
 ```
 

 Calling this method will create a dependency on the closest
 [DefaultTabController] in the [context], if there is one.

 See also:

 * [DefaultTabController.of], which is similar to this method, but asserts
   if no [DefaultTabController] ancestor is found.

## Return Type
`TabController?`

## Parameters

- `context`: `BuildContext`
