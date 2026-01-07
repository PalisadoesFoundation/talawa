# Method: `maybeOf`

## Description

The closest instance of [DrawerController] that encloses the given
 context, or null if none is found.

  Typical usage is as follows:

 ```dart
 DrawerController? controller = DrawerController.maybeOf(context);
 ```
 

 Calling this method will create a dependency on the closest
 [DrawerController] in the [context], if there is one.

 See also:

 * [DrawerController.of], which is similar to this method, but asserts
   if no [DrawerController] ancestor is found.

## Return Type
`DrawerController?`

## Parameters

- `context`: `BuildContext`
