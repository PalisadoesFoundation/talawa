# Method: `of`

## Description

The closest instance of [DrawerController] that encloses the given
 context.

 If no instance is found, this method will assert in debug mode and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest
 [DrawerController] in the [context].

  Typical usage is as follows:

 ```dart
 DrawerController controller = DrawerController.of(context);
 ```
 

## Return Type
`DrawerController`

## Parameters

- `context`: `BuildContext`
