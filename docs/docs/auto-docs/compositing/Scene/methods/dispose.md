# Method: `dispose`

## Description

Releases the resources used by this scene.

 After calling this function, the scene is cannot be used further.

 This can't be a leaf call because the native function calls Dart API
 (Dart_SetNativeInstanceField).

## Return Type
`void`

